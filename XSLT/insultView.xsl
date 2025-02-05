<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:sha="http://insults.obdurodon.org"
    exclude-result-prefixes="xs" xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:variable name="title" select="//titleStmt/shortTitle" as="xs:string"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>
                    <xsl:value-of select="$title"/> Insults</title>
                <!-- This needs changed per insultPage -->
                <link rel="stylesheet" type="text/css" href="CSS/index.css"/>
            </head>
            <body class="corp">
                <xsl:comment>#include virtual="menu.xhtml"</xsl:comment>
                <div class="pagination">
                    <xsl:choose>
                        <xsl:when test="$title eq 'Hamlet'">
                            <a class="active" href="hamInsults.xhtml">Hamlet</a>
                            <a href="othInsults.xhtml">Othello</a>
                            <a href="mndInsults.xhtml">A Midsummer Night's Dream</a>
                            <a href="coeInsults.xhtml">The Comedy of Errors</a>
                        </xsl:when>
                        <xsl:when test="$title eq 'Othello'">
                            <a href="hamInsults.xhtml">Hamlet</a>
                            <a class="active" href="othInsults.xhtml">Othello</a>
                            <a href="mndInsults.xhtml">A Midsummer Night's Dream</a>
                            <a href="coeInsults.xhtml">The Comedy of Errors</a>
                        </xsl:when>
                        <xsl:when test="$title eq 'Midsummer Night''s Dream'">
                            <a href="hamInsults.xhtml">Hamlet</a>
                            <a href="othInsults.xhtml">Othello</a>
                            <a class="active" href="mndInsults.xhtml">A Midsummer Night's Dream</a>
                            <a href="coeInsults.xhtml">The Comedy of Errors</a>
                        </xsl:when>
                        <xsl:when test="$title eq 'Comedy of Errors'">
                            <a href="hamInsults.xhtml">Hamlet</a>
                            <a href="othInsults.xhtml">Othello</a>
                            <a href="mndInsults.xhtml">A Midsummer Night's Dream</a>
                            <a class="active" href="coeInsults.xhtml">The Comedy of Errors</a>
                        </xsl:when>
                    </xsl:choose>
                </div>
                <h1 id="mainTitle">Insults in <xsl:value-of select="$title"/>
                </h1>
                <p class="notice">Notice: While using the sorting box on the left, that the intended
                    use is not that of a filter system. Instead, when any of the checkboxes is
                    selected any insult which has a matching attribute value will be displayed. E.g.
                    If I have selected slander and direct speech, I will get insults that have
                    slander with indirect speech and direct insults with types other than slander.
                    While this system is confusing, it is a product of time limits placed upon the
                    creation of this system.</p>
                <!-- This needs changed per insultPage -->
                <div id="insultPageContainer">
                    <xsl:comment>#include virtual="insultSort.xhtml"</xsl:comment>
                    <div id="insultFlex">
                        <!-- This is where insults would go -->
                        <xsl:apply-templates select="//insult" mode="readView"/>
                    </div>
                </div>
                <script src="sort.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="insult" mode="readView">
        <xsl:variable name="insType" as="xs:string" select="insultStart/@insType"/>
        <xsl:variable name="gender" as="xs:string?" select="insultStart/@gender"/>
        <xsl:variable name="rel" as="xs:string?" select="insultStart/@rel"/>
        <xsl:variable name="relState" as="xs:string?" select="insultStart/@rel-state"/>
        <xsl:variable name="speechAct" as="xs:string?" select="insultStart/@speechAct"/>
        <xsl:variable name="illocType" as="xs:string?" select="insultStart/@illoc-type"/>
        <xsl:variable name="maxim" as="xs:string?" select="insultStart/@maxim"/>
        <a>
            <xsl:attribute name="class">
                <xsl:value-of select="insultStart/@*"/>
                <xsl:text> insult</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="href">
                <xsl:choose>
                    <xsl:when test="$title eq 'Hamlet'">ham</xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="$title eq 'Othello'">oth</xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="$title eq 'Midsummer Night''s Dream'">mnd</xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="$title eq 'Comedy of Errors'">coe</xsl:when>
                </xsl:choose>
                <xsl:text>Reading.xhtml#</xsl:text>
                <xsl:value-of select="position() - 1"/>
            </xsl:attribute>
            <xsl:apply-templates select="replace(normalize-space(), ' ([,.!?;:])', '$1')"/>

            <span>
                <xsl:attribute name="class">
                    <xsl:text>infoSymbol</xsl:text>
                </xsl:attribute>
                <xsl:text> ⓘ</xsl:text>
            </span>
            <span>
                <xsl:attribute name="class">
                    <xsl:text>infoBox</xsl:text>
                </xsl:attribute>
                <table>
                    <xsl:attribute name="class">
                        <xsl:text>infoTable</xsl:text>
                    </xsl:attribute>
                    <tr>
                        <td>Insult type:</td>
                        <td>
                            <xsl:value-of select="$insType"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td>
                            <xsl:value-of select="$gender"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Relationship:</td>
                        <td>
                            <xsl:value-of select="$rel"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Relationship State:</td>
                        <td>
                            <xsl:value-of select="$relState"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Speech Act:</td>
                        <td>
                            <xsl:value-of select="$speechAct"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Illocutionary Type:</td>
                        <td>
                            <xsl:value-of select="$illocType"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Maxim:</td>
                        <td>
                            <xsl:value-of select="$maxim"/>
                        </td>
                    </tr>
                </table>
            </span>
        </a>
    </xsl:template>
</xsl:stylesheet>
