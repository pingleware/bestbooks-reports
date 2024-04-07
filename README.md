# BestBooks Accounting Application Framework - Reports

There are no free options for creating reports from content received from a database. jsreports, jasperreports have limited free options.

Hence the report design will go back to basics,

    1. creating an XML document for the data required for the report
    2. display the XML using XSLT with CSS which can be printed or save as a PDF or DOCX (see https://www.geeksforgeeks.org/displaying-xml-using-xslt/)

During initialization (invoking the init() function)), will copy the xslt template files to the user's home directory in the bestbooks system directory.

The js2xmlparser package is used to convert an object to xml, while the xslt-processor package will transform the XML data and XSLT template to HTML format.

HTML can be converted to other forms like PDF.

## Reporting in Accounting

Reporting is the most important feature of any accounting system, because reporting permits the communication to interested parties. Using test driven development (TDD) allows the implementation of the reports module first.

## GAAP Compliance

There is much discussion concerning GAAP compliance and accounting sofftware with some commentors stating that accounting software can never be GAAP compliance. First, GAAP compliance has to do with reporting and involves an accountant statement or notes added to the financial statements, this where the component noteToFinancialStatements permits the addition of a notes fields to the report XML data, thus making BestBooks GAAP compliance with the addition of a notes field on reports.

## Sample Reports

### Customer Estimate

![1712500090802](image/README/1712500090802.png)

### Trial Balance

![1712501317103](image/README/1712501317103.png)

### Purchase Order

![1712501796886](image/README/1712501796886.png)

### Statement in Change in Equity

![1712502172676](image/README/1712502172676.png)
