<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Friends List</title>
        <style>
          /* Add some basic styling for better presentation */
          h1 {
            color: #0066cc;
          }
          p {
            margin: 5px 0;
          }
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid #fff;
            padding: 8px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <h1>My Friends and Their Fav Foods</h1>

        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Food Item</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="friendsList/friend[not(name = preceding-sibling::friend/name)]">
              <tr>
                <td><xsl:value-of select="name" /></td>
                <td><xsl:value-of select="item"/></td>
              </tr>
            </xsl:for-each>
            <xsl:apply-template select="friendsList">
                <tr>
                    <td><xsl:value-of select="newOnes/name"/></td>
                    <td><xsl:value-of select="newOnes/item"/></td>
                </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
<xsl:template match="newOnes">
    <p>New Friend: <xsl:value-of select="name" /></p>
    <br />
</xsl:template>
