"use strict"

const BaseReport = require('./report');
const { Model } = require('@pingleware/bestbooks-core');

const {format, array2xml} = require('./formatReport');
const os = require('os');
const fs = require('fs');
const path = require('path');

class AuditTrail extends BaseReport {
    constructor() {
        super();
    }

    saveReport(name, contents, type="xml",callback=null){
        const filePath = path.join(os.homedir(),`.bestbooks/${name}.${type}`);
        // the xslt-processor does not support the XSLT syntax xsl:for-each-group, 
        // so the XML generated is returned,
        // using a free tool like https://xslttest.appspot.com/, 
        // to copy the .bestbooks/balance-sheet.xslt and .bestbooks/balance-sheet.xml
        // to render a HTML
        // TODO: implement xsl:for-each-group. callback(format("balanceSheet",formattedData));

        fs.writeFileSync(filePath, contents);
        callback(filePath)
    }

    async saveReportSync(name, html, type) {
        return new Promise((resolve,reject) => {
            try {
                this.saveReport(name, html, type, function(filePath){
                    resolve(filePath);
                })    
            } catch(error) {
                reject(error);
            }
        })
    }

    async formatHtml(formattedData) {
        return format('audit',formattedData);
    }

    async formatXml(contents) {
        return array2xml('audit',contents);
    }

    async formatArray(data,notes) {
        var _data = {
            date: new Date().toDateString(),
            transactions: [],
            notes: notes
        };

        var transactions = [];

        data.forEach(function(transaction){
            transactions.push({
                id: `${transaction.account_code} (${transaction.account_name})`,
                date: transaction.txdate,
                user: transaction.changed_by,
                action: transaction.action,
                amount: transaction.new_balance
            })
        });
        _data.transactions = transactions;
        return _data;
    }

    retrieveReportData(startDate,endDate,callback) {
        callback(this.retrieveReportDataSync(startDate,endDate));
    }

    async retrieveReportDataSync(startDate, endDate) {
        const model = new Model();
        const sql = `SELECT l.txdate, l.account_code, l.account_name, l.debit, l.credit, l.balance, 
                            a.old_account_code, a.old_debit, a.old_credit, a.old_balance, 
                            a.new_account_code, a.new_debit, a.new_credit, a.new_balance, 
                            a.change_date, a.changed_by, a.action
                    FROM ledger_audit a
                    JOIN ledger l ON a.ledger_id = l.id
                    WHERE l.txdate BETWEEN "${startDate}" AND "${endDate}"
                    ORDER BY a.change_date DESC;`;
        return await model.querySync(sql);
    }

}

module.exports = AuditTrail;