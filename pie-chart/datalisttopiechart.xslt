<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/2000/svg"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	exclude-result-prefixes="xs fn xd">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD SVG 1.1//EN" doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11-basic.dtd" media-type="image/svg+xml" />
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> 2007-01-10</xd:p>
			<xd:p><xd:b>Author:</xd:b> developer@sleepingdog.org.uk</xd:p>
			<xd:p><xd:b>Last modified on:</xd:b> 2013-11-20</xd:p>
			<xd:p><xd:b>Version:</xd:b> 1.0.1.2</xd:p>
			<xd:p>Takes a simple datalist of values, and outputs a SVG pie chart.</xd:p>
			<xd:p>This software is licenced under the CC-GNU GPL http://creativecommons.org/licenses/GPL/2.0/</xd:p>
			<xd:p>Documentation at http://www.sleepingdog.org.uk/svg/chart/pie/</xd:p>
		</xd:desc>
	</xd:doc>
  <xsl:template match="/">
    <svg width="540" height="400" version="1.1" style="font-family: Verdana; stroke: none; font-size: 10px;">
      <defs>
        <clipPath id="clip0">
          <!--rect id="clipShape0" x="100" y="0" width="100" height="100" fill="none" /-->
          <path id="clipShape090" d="M 100,4 A96,96 0 0,1 196,100 L 100,100 z" />
        </clipPath>
        <circle id="pieOutline" cx="100" cy="100" r="96" stroke-width="2" stroke="black" fill="none" />
        <path id="pieShape090" d="M 4,100 A96,96 0 0,1 100,4 L 100,100 z" />
        <use xlink:href="#pieShape090" id="pieShape90180" transform="rotate(-90, 100, 100)" />
        <use xlink:href="#pieShape090" id="pieShape180270" transform="rotate(-180, 100, 100)" />
        <use xlink:href="#pieShape090" id="pieShape270360" transform="rotate(-270, 100, 100)" />
      </defs>
      <!-- draw pie shape -->
      <use xlink:href="#pieOutline" />
      <xsl:variable name="sumMagnitude" select="sum(datalist/values/value/@magnitude)" />
      <xsl:for-each select="datalist/values/value">
        <!-- calculate the angle where this pie segment ends -->
        <xsl:variable name="rotation" select="(@magnitude + sum(preceding-sibling::value/@magnitude)) div $sumMagnitude * 360" />
        <xsl:variable name="rotation2" select="(sum(preceding-sibling::value/@magnitude)) div $sumMagnitude * 360" />
        <!-- calculate how many extra quarters will the final segment need -->
        <xsl:variable name="quarters" select="floor(@magnitude div $sumMagnitude * 4)" />
        <!-- create a fill area for this segment -->
        <defs>
          <rect id="fill{position()}" x="0" y="0" width="100" height="100" fill="{@colour}" transform="rotate({$rotation - $quarters * 90}, 100, 100)" />
          <clipPath id="clip{position()}">
            <use xlink:href="#clipShape090" transform="rotate({$rotation}, 100, 100)" />
          </clipPath>
        </defs>
        <!-- draw a fill area on the pie chart -->
        <!--use xlink:href="#fill{position()}" /-->
        <!--xsl:comment select="concat('quarters = ', $quarters)" /-->
        <use xlink:href="#fill{position()}" style="clip-path: url(#clip{position() - 1});" />
        <xsl:if test="$quarters &gt; 0">
          <use xlink:href="#pieShape090" fill="{@colour}" transform="rotate({$rotation}, 100, 100)" />
        </xsl:if>
        <xsl:if test="$quarters &gt; 1">
          <use xlink:href="#pieShape90180" fill="{@colour}" transform="rotate({$rotation}, 100, 100)" />
        </xsl:if>
        <xsl:if test="$quarters &gt; 2">
          <use xlink:href="#pieShape270360" fill="{@colour}" transform="rotate({$rotation}, 100, 100)" />
        </xsl:if>
        <!-- draw a line on the pie chart -->
        <!--line id="line{position()}" x1="100" y1="100" x2="100" y2="4" style="stroke: {@colour};" stroke-width="3" transform="rotate({$rotation}, 100, 100)" /-->
        <!-- create key with bars -->
        <rect x="{300 - (@magnitude div $sumMagnitude * 100)}" y="{position() * 15 - 11}" width="{@magnitude div $sumMagnitude * 100}" height="10" fill="{@colour}" stroke="none" />
        <text x="310" y="{position() * 15 - 1}" style="font-weight: normal;">
          <xsl:value-of select="." />
          <xsl:text> (</xsl:text>
          <xsl:value-of select="round(@magnitude div $sumMagnitude * 100)" />
          <xsl:text>%)</xsl:text>
        </text>
      </xsl:for-each>
      <text x="4" y="220" style="font-size: 14px;">
        <xsl:value-of select="datalist/title" />
      </text>
    </svg>
  </xsl:template>
</xsl:stylesheet>