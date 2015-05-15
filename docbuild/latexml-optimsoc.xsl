<?xml version="1.0" encoding="utf-8"?>
<!--
Adapted from LaTeXML-html5.xsl from LaTeXML.

Original work is public domain by Bruce Miller <bruce.miller@nist.gov>
-->
<xsl:stylesheet
    version     = "1.0"
    xmlns:xsl   = "http://www.w3.org/1999/XSL/Transform"
    xmlns:ltx   = "http://dlmf.nist.gov/LaTeXML"
    xmlns:string= "http://exslt.org/strings"
    xmlns:f     = "http://dlmf.nist.gov/LaTeXML/functions"
    exclude-result-prefixes = "ltx f"
    extension-element-prefixes="string f">

  <!-- Include all LaTeXML to xhtml modules -->
  <xsl:import href="urn:x-LaTeXML:XSLT:LaTeXML-all-xhtml.xsl"/>

  <!-- Override the output method & parameters -->
  <xsl:output
      method = "html"
      omit-xml-declaration="yes"
      indent="yes"
      encoding       = 'utf-8'
      media-type     = 'text/html'/>

  <!-- No namespaces; DO use HTML5 elements (include MathML & SVG) -->
  <xsl:param name="USE_NAMESPACES"  ></xsl:param>
  <xsl:param name="USE_HTML5"       >true</xsl:param>

  <xsl:template match="/">
    <xsl:apply-templates select="." mode="yamlheader"/>


    <div class="col-md-3">
      <!-- main navigation (only chapters) -->
      <div class="optimsoc-doc-mainnav" data-spy="affix" data-offset-top="50" >
        <ul class="nav">
          <xsl:apply-templates select="//ltx:navigation/ltx:TOC//ltx:toclist[@class='ltx_toc_document' or @class='ltx_toclist_document']/ltx:tocentry" mode="nav-toplevel"/>
        </ul>
      </div>
    </div>

    <div class="col-md-9 optimsoc-doc-body">
      <xsl:apply-templates select="." mode="body"/>
      <xsl:apply-templates select="." mode="footnotes"/>
    </div>
  </xsl:template>

  <!-- current chapter -->
  <xsl:template match="ltx:tocentry[contains(concat(' ', @class, ' '), ' ltx_ref_self ')]"
    mode="nav-toplevel">
    <li class="active">
      <div class="active"><xsl:value-of select="ltx:ref/ltx:text/text()"/></div>

      <!-- sub navigation (inside the chapter) -->
      <div id="optimsoc-doc-subnav-nav" class="optimsoc-doc-subnav hidden-print" role="complementary">
        <ul class="nav">
          <xsl:apply-templates select="ltx:toclist/ltx:tocentry" mode="nav-chapter"/>
        </ul>
      </div>

    </li>
  </xsl:template>

  <!-- other chapter -->
  <xsl:template match="ltx:tocentry" mode="nav-toplevel">
    <li>
      <a>
        <xsl:attribute name="href"><xsl:value-of select="ltx:ref/@href"/></xsl:attribute>
        <xsl:attribute name="title"><xsl:value-of select="ltx:ref/@title"/></xsl:attribute>
        <xsl:value-of select="ltx:ref/ltx:text/text()"/>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="ltx:tocentry" mode="nav-chapter">
    <li class="">
      <a>
        <xsl:attribute name="href"><xsl:value-of select="ltx:ref/@href"/></xsl:attribute>
        <xsl:attribute name="title"><xsl:value-of select="ltx:ref/@title"/></xsl:attribute>
        <xsl:value-of select="ltx:ref/ltx:text/text()"/>
      </a>
    </li>
  </xsl:template>

  <!--
  This is mostly copied from LaTeXML-block-xhtml.xsl, but modified to use a
  regular html:li item with the default bullets instead of a customized
  version. This makes the resulting HTML much nicer.
  -->
  <xsl:template match="ltx:item">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:choose>
      <xsl:when test="child::ltx:tag and not(child::ltx:tag/text() = '•')">
        <xsl:element name="li" namespace="{$html_ns}">
          <xsl:call-template name="add_id"/>
          <xsl:call-template name="add_attributes">
            <xsl:with-param name="extra_style" select="'list-style-type:none;'"/>
          </xsl:call-template>
          <xsl:apply-templates select="." mode="begin"/>
          <xsl:apply-templates select="ltx:tag"/>
          <xsl:text> </xsl:text>
          <xsl:apply-templates select="*[local-name() != 'tag']"/>
          <xsl:apply-templates select="." mode="end"/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="@frefnum">
        <xsl:element name="li" namespace="{$html_ns}">
          <xsl:call-template name="add_id"/>
          <xsl:call-template name="add_attributes">
            <xsl:with-param name="extra_style" select="'list-style-type:none;'"/>
          </xsl:call-template>
          <xsl:apply-templates select="." mode="begin"/>
          <xsl:element name="span" namespace="{$html_ns}">
            <xsl:attribute name="class">ltx_tag</xsl:attribute>
            <xsl:value-of select="@frefnum"/>
          </xsl:element>
          <xsl:text> </xsl:text>
          <xsl:apply-templates/>
          <xsl:apply-templates select="." mode="end"/>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="li" namespace="{$html_ns}">
          <xsl:call-template name="add_id"/>
          <xsl:call-template name="add_attributes"/>
          <xsl:apply-templates select="." mode="begin"/>
          <xsl:apply-templates select="*[not(self::ltx:tag)]"/>
          <xsl:apply-templates select="." mode="end"/>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template match="/" mode="yamlheader">
    <!-- YAML header for layout inclusion -->
    <xsl:text disable-output-escaping='yes'>---
layout: default
title: OpTiMSoC </xsl:text><xsl:value-of select="$OPTIMSOC_TITLE" /><xsl:text>
sectiontitle: </xsl:text><xsl:value-of select="$OPTIMSOC_TITLE" /><xsl:text>
---
    </xsl:text>
  </xsl:template>

  <!-- By default, these disappear -->
  <xsl:template match="ltx:resource"/>


  <!--  ======================================================================
       The <body>
       ====================================================================== -->

  <xsl:template match="/" mode="body">
    <xsl:apply-templates select="." mode="body-begin"/>
    <xsl:apply-templates select="." mode="body-main"/>
    <xsl:apply-templates select="." mode="body-end"/>
  </xsl:template>

  <xsl:template match="/" mode="body-begin"/>
  <xsl:template match="/" mode="body-end"/>

  <xsl:template match="/" mode="body-main">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:element name="div" namespace="{$html_ns}">
      <xsl:attribute name="class">ltx_page_main</xsl:attribute>
      <xsl:apply-templates select="." mode="body-main-begin"/>
      <xsl:apply-templates select="." mode="body-content"/>
      <xsl:apply-templates select="." mode="body-main-end"/>
      <xsl:text>&#x0A;</xsl:text>
    </xsl:element>
  </xsl:template>

  <xsl:template match="/" mode="body-main-begin"/>
  <xsl:template match="/" mode="body-main-end"/>

  <xsl:template match="/" mode="body-content">
    <div class="ltx_page_content">
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="ltx:navigation"/>

  <xsl:template match="ltx:note">
    <a>
      <xsl:attribute name="href"><xsl:text>#optimsoc-doc-footnote-</xsl:text><xsl:value-of select="@mark"/></xsl:attribute>
      <sup><xsl:value-of select="@mark"/></sup>
    </a>
  </xsl:template>

  <xsl:template match="/" mode="footnotes">
    <xsl:if test="count(//ltx:note) &gt; 0">
      <hr class="optimsoc-doc-sep-footnotes"/>
      <xsl:apply-templates select="//ltx:note" mode="optimsoc-footnote"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="ltx:note" mode="optimsoc-footnote">
    <div class="optimsoc-doc-footnote-full">
      <xsl:attribute name="id"><xsl:text>optimsoc-doc-footnote-</xsl:text><xsl:value-of select="@mark"/></xsl:attribute>
      <sup><xsl:value-of select="@mark"/></sup>
      <xsl:apply-templates select="*|text()"/>
    </div>
  </xsl:template>

</xsl:stylesheet>
