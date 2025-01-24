<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Audit Trail - Changes</title>
            </head>
            <body>
                <h2>Audit Trail - Change Tracking</h2>
                <table class="w3-table" border="2">
                    <tr>
                        <th>ID</th>
                        <th>Date</th>
                        <th>User</th>
                        <th>Action</th>
                        <th>Old Amount</th>
                        <th>New Amount</th>
                    </tr>
                    <xsl:for-each select="//transactions">
                        <tr>
                            <td><xsl:value-of select="id"/></td>
                            <td><xsl:value-of select="date"/></td>
                            <td><xsl:value-of select="user"/></td>
                            <td><xsl:value-of select="action"/></td>
                            <td><xsl:value-of select="oldAmount"/></td>
                            <td><xsl:value-of select="newAmount"/></td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <th>Management|Accountant|Auditor Note(s)</th>
                        <td colspan="5"><xsl:value-of select="//notes" /></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
