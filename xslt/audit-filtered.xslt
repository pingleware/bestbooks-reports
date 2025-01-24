<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Filtered Audit Trail</title>
            </head>
            <body>
                <h2><xsl:value-of select="//title" /></h2>
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
