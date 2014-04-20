<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:btw="http://bentoweb.org/refs/TCDL1.1"
    exclude-result-prefixes="btw html xlink xsd dc">

<!-- ===== classifyTC.xsl =====
    Version: 1.0
    Since: December 2007
    Copyright © 2007 BenToWeb
    -->

	<xsl:output method="text" />
    <xsl:param name="filename" />
    <xsl:param name="TS2metadata" select="'http://www.bentoweb.org/ts/XHTML1_TestSuite2/metadata/'" />

    <xsl:template match="/">
        <xsl:apply-templates select="/btw:testCaseDescription" /><xsl:text>|</xsl:text>
        <xsl:apply-templates select="/btw:testCaseDescription/btw:formalMetadata/btw:title" /><xsl:text>|</xsl:text>
        <xsl:choose>
          <xsl:when test="/btw:testCaseDescription/btw:rules/btw:rule[2]/btw:techComment/btw:p/html:span[html:a[contains(@href, $TS2metadata)]]">
            <xsl:apply-templates select="/btw:testCaseDescription/btw:rules/btw:rule[2]/btw:techComment/btw:p/html:span[html:a[contains(@href, $TS2metadata)]]" />
          </xsl:when><xsl:otherwise>--</xsl:otherwise></xsl:choose><xsl:text>|</xsl:text>
    </xsl:template>

    <!-- Test case ID; output error message of ID does not match file name. -->
    <xsl:template match="/btw:testCaseDescription">
        <xsl:choose>
            <xsl:when test="@id = substring-before($filename,'.xml')">
                <xsl:value-of select="@id" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat('ERROR: ', $filename)" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/btw:testCaseDescription/btw:formalMetadata/btw:title">
        <xsl:value-of select="normalize-space(.)" />
    </xsl:template>

    <!-- links to corresponding test cases in second version of the test suite -->
    <xsl:template match="/btw:testCaseDescription/btw:rules/btw:rule[2]/btw:techComment/btw:p/html:span[html:a[contains(@href, $TS2metadata)]]">
      <!--xsl:value-of select="substring-after(normalize-space(.), $TS2metadata)" /><xsl:text></xsl:text-->
      <xsl:value-of select="substring-after(normalize-space(html:a/@href), $TS2metadata)" /><xsl:text></xsl:text>
    </xsl:template>

    <xsl:template match="*|@*">
        <!--xsl:apply-templates select="node()|@*" /-->
    </xsl:template>

</xsl:stylesheet>
