<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Audit Trail Report</title>
                <style>
                    table { border-collapse: collapse; width: 100%; }
                    th, td { border: 1px solid black; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                </style> 
            </head>
            <body>
                <h2>Audit Trail Report</h2>
                <table class="w3-table" border="2">
                    <tr>
                        <th>ID</th>
                        <th>Date</th>
                        <th>User</th>
                        <th>Action</th>
                        <th>Amount</th>
                    </tr>
                    <tr>
                        <td colspan="5" style="text-align: right; width:100%;">Date: <xsl:value-of select="//date" /></td>
                    </tr>
                    <xsl:for-each select="//transactions">
                        <tr>
                            <td><xsl:value-of select="id"/></td>
                            <td><xsl:value-of select="date"/></td>
                            <td><xsl:value-of select="user"/></td>
                            <td><xsl:value-of select="action"/></td>
                            <td><xsl:value-of select="amount"/></td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <th>Management|Accountant|Auditor Note(s)</th>
                        <td colspan="4"><xsl:value-of select="//notes" /></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
