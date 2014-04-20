<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns="http://bentoweb.org/refs/TCDL1.1"
  xmlns:btw="http://bentoweb.org/refs/TCDL1.1"
  xmlns:html="http://www.w3.org/1999/xhtml">
  <!-- Take control of the whitespace. -->
  <xsl:output method="xml" indent="no" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>
  <xsl:preserve-space elements="xsl:text"/>

  <!-- 
    Note Eclipse 3.2.1 complains that "Spaces are not allowed before a Processing Instruction" 
    but this is not confirmed by the XML 1.0 Specification (4th ed);
    see http://www.w3.org/TR/2006/REC-xml-20060816/#NT-content .
  -->
  <xsl:template match="processing-instruction()">
    <!--xsl:text>&#xA;</xsl:text--><xsl:copy />
  </xsl:template>

  <!-- Copy comments, and elements recursively. -->
  <xsl:template match="*|comment()">
    <xsl:copy>
      <xsl:if test="self::*">
        <xsl:copy-of select="@*"/>

        <xsl:apply-templates />


      </xsl:if>
    </xsl:copy>
  </xsl:template>


  <!-- Copy everything as "pending bugfix": bug can be fixed by updated to current WCAG Working draft. -->
  <xsl:template match="btw:status[starts-with(normalize-space(.), 'validated') or starts-with(normalize-space(.), 'accepted QA')]"><status>pending bugfix</status><xsl:comment>@@Fix bug by updating to 17 May 2007 working draft, then change status to "draft".</xsl:comment></xsl:template>

  <xsl:template match="btw:status[starts-with(normalize-space(.), 'rejected QA')]"><status>rejected QA</status></xsl:template>


  <xsl:template match="btw:rule[@primary='yes'][starts-with(normalize-space(@id), 'http://bentoweb.org/refs/rulesets.xml#WCAG2_20060427')]">
    <rule>
      <xsl:attribute name="id">http://bentoweb.org/refs/rulesets.xml#WCAG2_20070517_<xsl:value-of select="substring-after(@id, 'http://bentoweb.org/refs/rulesets.xml#WCAG2_20060427_')"/> </xsl:attribute>
      <xsl:attribute name="primary">yes</xsl:attribute>
      <locations expectedResult="cannotTell">
        <xsl:comment>@@todo check that locations refer to the GENERATED CODE! (Pointers in rule elements for previous WCAG draft can be left alone.)</xsl:comment>
        <xsl:apply-templates select="btw:locations/btw:*" />
      </locations>
      <!-- Just copy functionalOutcome -->
      <xsl:apply-templates select="btw:functionalOutcome | comment()" />
      <xsl:if test="./btw:techComment">
        <techComment>
          <!-- Restore microformat for WCAG 2.0 technique mapping in technicalComment. -->
          <xsl:for-each select="btw:techComment/btw:p">
            <xsl:choose>
              <xsl:when test="self::node()[starts-with(normalize-space(current()), 'This test case maps to ')]">
                <xsl:call-template name="techCommentParagraphMapping" />
              </xsl:when>
              <xsl:when test="self::node()[not(starts-with(normalize-space(current()), 'This test case maps to '))]">
                <p><xsl:apply-templates /></p>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </techComment>
      </xsl:if>
    </rule>
    <rule id="{@id}" primary="no">
      <xsl:apply-templates />
    </rule>
  </xsl:template>


  <!--xsl:template match="btw:rule[@primary='yes'][starts-with(normalize-space(@id), 'http://bentoweb.org/refs/rulesets.xml#WCAG2_20060427')]/btw:techComment/btw:p[not(starts-with(normalize-space(.), 'This test case maps to '))]">
    <p><xsl:apply-templates /></p>
  </xsl:template-->

  <!-- Restore microformat for WCAG 2.0 technique mapping in technicalComment. -->
  <!--xsl:template match="btw:rule[@primary='yes'][starts-with(normalize-space(@id), 'http://bentoweb.org/refs/rulesets.xml#WCAG2_20060427')]/btw:techComment/btw:p[starts-with(normalize-space(.), 'This test case maps to ')]"-->
  <xsl:template name="techCommentParagraphMapping">
    <p>This test case maps to <xsl:choose><xsl:when test="contains(substring-before(normalize-space(string(current())), ':'), 'technique')">technique </xsl:when><xsl:when test="contains(substring-before(normalize-space(string(current())), ':'), 'failure')">failure </xsl:when></xsl:choose>
      <html:span class="technique"><html:a>
      <xsl:attribute name="href">http://www.w3.org/TR/2007/WD-WCAG20-TECHS-20070517/#<xsl:value-of select="substring-before(substring-after(normalize-space(string(current())), '#'), ')')"/></xsl:attribute>
      <xsl:value-of select="substring-before(substring-after(normalize-space(string(current())), '#'), ')')"/>:<xsl:value-of select="substring-before(substring-after(normalize-space(string(current())), ':'), ' (http://')"/>[@@checkTitle]</html:a></html:span> <xsl:if test="string-length(substring-after(substring-after(normalize-space(string(current())), '#'), ')')) &gt; 1"> <xsl:value-of select="substring-after(substring-after(normalize-space(string(current())), '#'), ')')" /></xsl:if>
    </p>
  </xsl:template>

  <xsl:template match="btw:rule[@primary='yes'][starts-with(normalize-space(@id), 'http://bentoweb.org/refs/rulesets.xml#WCAG2_20060427')]/btw:techComment">
    <techComment>
      <xsl:apply-templates />
      <p>Online version: <html:span><html:a><xsl:attribute name="href">http://www.bentoweb.org/ts/XHTML1_TestSuite2/metadata/<xsl:value-of select="/btw:testCaseDescription/@id"/></xsl:attribute><xsl:value-of select="/btw:testCaseDescription/@id"/></html:a></html:span>.</p>
    </techComment>
  </xsl:template>

</xsl:stylesheet>
