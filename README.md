# BestBooks Accounting Application Framework - Reports

There are no free options for creating reports from content received from a database. jsreports, jasperreports have limited free options.

Hence the report design will go back to basics,

    1. creating an XML document for the data required for the report
    2. display the XML using XSLT with CSS which can be printed or
       save as a PDF or DOCX (see https://www.geeksforgeeks.org/displaying-xml-using-xslt/)

During initialization (invoking the init() function)), will copy the xslt template files to the user's home directory in the bestbooks system directory.

The js2xmlparser package is used to convert an object to xml, while the xslt-processor package will transform the XML data and XSLT template to HTML format.

HTML can be converted to other forms like PDF.

## Reporting in Accounting

Reporting is the most important feature of any accounting system, because reporting permits the communication to interested parties. Using test driven development (TDD) allows the implementation of the reports module first.

## GAAP Compliance

There is much discussion concerning GAAP compliance and accounting sofftware with some commentors stating that accounting software can never be GAAP compliance. First, GAAP compliance has to do with reporting and involves an accountant statement or notes added to the financial statements, this where the component noteToFinancialStatements permits the addition of a notes fields to the report XML data, thus making BestBooks GAAP compliance with the addition of a notes field on reports.

Also to ensure GAAP compliance, standard labels as defined by FASB should be used in the report generation. See [FASB Segment Reporting (Topic 280)](https://www.fasb.org/page/ShowPdf?path=ASU%202023-07.pdf),  [2024 US GAAP Financial, SEC Reporting and DQC Rules Taxonomies ](https://xbrl.us/xbrl-taxonomy/2024-us-gaap/)with the updated link to [FASB Explanatory Page ](https://fasb.org/projects/fasb-taxonomies)

An exempt offering under Section 3(a)(11) which is an intrastate public offering issuing unrestricted securities to a single state bonafide residents. To ensure compliance of this exempt offering, segment reporting is required if the securities become traded on a NMS Exchange.

## Sample Reports

You can customize the style of the reports by modifying the XSLT file located in the **.bestbooks** system directory of the current user home directory. The package XSLT files are ONLY copied to this directory if they do not exist. The available report XSLT files include,

```
balance-sheet.xslt
customer-estimate.xslt
income-statement.xslt
income-statement-geographic.xslt
purchase-order.xslt
statement-in-change-in-equity.xslt
statement-of-cash-flows.xslt
trial-balance.xslt
retained-earnings.xslt
```

### Balance Sheet

![1712592400396](https://github.com/pingleware/bestbooks-reports/blob/master/image/README/1712592400396.png)

### Income Statement

![1712586856327](https://github.com/pingleware/bestbooks-reports/blob/master/image/README/1712586856327.png)

### Income Statement by Geography

aka Segment Reporting per [FASB](https://www.fasb.org/segmentreporting_2017). See also [https://www.fasb.org/revenue_2020.](https://www.fasb.org/revenue_2020)

![1729949969875](https://github.com/pingleware/bestbooks-reports/blob/master/image/README/1729949969875.png "Courtesy of FASB")

(Courtesy of FASB)

### Customer Estimate

![1712500090802](https://github.com/pingleware/bestbooks-reports/blob/master/image/README/1712500090802.png)

### Trial Balance

![1712501317103](https://github.com/pingleware/bestbooks-reports/blob/master/image/README/1712501317103.png)

### Purchase Order

![1712501796886](https://github.com/pingleware/bestbooks-reports/blob/master/image/README/1712501796886.png)

### Statement in Change in Equity

![1712503491502](https://github.com/pingleware/bestbooks-reports/blob/master/image/README/1712503491502.png)

### Retained Earnings

![1712504010713](https://github.com/pingleware/bestbooks-reports/blob/master/image/README/1712504010713.png)
