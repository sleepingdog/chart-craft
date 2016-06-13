<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/2000/svg" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:hr="http://ns.hr-xml.org/2007-04-15"
	xmlns:team="http://www.sleepingdog.org.uk/sport/team/formation"
	exclude-result-prefixes="hr team xs xd"
	version="2.0">
	<!-- Use this if outputting to a separate SVG document. -->
	<!-- <xsl:output doctype-public="-//W3C//DTD SVG 1.1//EN"
	doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" omit-xml-declaration="no" /> -->
	<!-- Use this if outputting to inline SVG markup in HTML5. -->
	<xsl:output method="xml" omit-xml-declaration="yes" />
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> 2011-06-19</xd:p>
			<xd:p><xd:b>Last modified on:</xd:b> 2011-06-24</xd:p>
			<xd:p><xd:b>Author:</xd:b> Tavis Reddick</xd:p>
			<xd:p>Takes a HR-XML OrganizationalUnit and outputs a SVG football pitch with player shirts.</xd:p>
			<xd:p>Version: 0.2.1.8</xd:p>
			<xd:p>This software is licenced under the CC-GNU GPL, http://creativecommons.org/licenses/GPL/2.0/</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:param name="pitchWidth" select="600" />
	<xsl:param name="pitchHeight" select="500" />
	<xsl:param name="pitchOffsetX" select="310" />
	<xsl:param name="pitchOffsetY" select="10" />
	<xsl:param name="teamFormationUrl" select="'http://www.sleepingdog.org.uk/svg/chart/teamformation/teamformation.xml'" />
	<xsl:variable name="teamFormationDoc" select="document($teamFormationUrl)" />
	<xsl:template match="/">
		<!-- Use this if outputting to a separate SVG document. -->
		<!-- <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="620px"
			 height="620px" viewBox="0 0 620 620" style="enable-background:new 0 0 620 620;" xml:space="preserve"> -->
		<!-- Use this if outputting to inline SVG markup in HTML5. -->
		<svg xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="620px"
			 height="620px" viewBox="0 0 620 620" style="enable-background:new 0 0 620 620;">
			<desc/>
			<defs>
				<style type="text/css">
				<![CDATA[
					.grass{fill:#8CC63F;}
					.chalkarea{fill:#FFFFFF;}
					.captain .armband{fill:#FFFF00;stroke:#000000;stroke-width:1;}
					.armband{fill:none;stroke:none;}
					.keeper polygon.shirt{fill:#CCCCCC;}
					.keeper .hoop{display:none;}
					.keeper .stripe{display:none;}
					.chalkline{fill:none;stroke:#FFFFFF;stroke-width:3;stroke-miterlimit:10;}
					.shirtnumber{font-family:'Verdana';letter-spacing:-2.0;font-size:48;stroke:#FFFFFF;stroke-miterlimit:10;text-anchor:middle;}
					.teamname{font-family:'Verdana';fill:#006837;font-size:36;text-anchor:middle;}
					.playername{font-family:'Verdana-Bold';fill:#FCEE21;font-size:12;text-anchor:middle;}
				]]>
				</style>
				<g id="teamPlayer">
					<!-- The team player definition starts in the goalkeeper position; adjust usage measurements accordingly. -->
					<polygon id="shirt_1_" class="shirt" points="338,20 282,20 252.25,49.75 265.562,63.062 282,46.625 282,103 338,103 338,47.062 
						354,63.062 367.312,49.75 	"/>
					<g id="StripeGroup">
						<rect x="305" y="20" class="stripe" width="10" height="83"/>
						<rect x="325" y="20" class="stripe" width="10" height="83"/>
						<rect x="285" y="20" class="stripe" width="10" height="83"/>
						<polygon class="stripe" points="337,43.328 355.478,61.556 358.182,58.728 337,37.67 		"/>
						<polygon class="stripe" points="337,29.328 362.478,54.556 365.182,51.728 337,23.67 		"/>
						<polygon class="stripe" points="282,43.328 263.613,61.556 260.863,58.728 282,37.67 		"/>
						<polygon class="stripe" points="282,29.328 256.613,54.556 253.863,51.728 282,23.67 		"/>
					</g>
					<polygon id="ArmBand" class="armband" points="339.297,48.359 344.954,54.017 358.267,40.704 352.652,35.005 	"/>
					<g id="HoopGroup">
						<rect x="282" y="35" class="hoop" width="56" height="15"/>
						<rect x="282" y="65" class="hoop" width="56" height="15"/>
						<rect x="282" y="95" class="hoop" width="56" height="8"/>
						<polygon class="hoop" points="348.297,57.359 353.954,63.017 367.267,49.704 361.652,44.005 		"/>
						<polygon class="hoop" points="350.422,32.607 336.822,46.207 338,47.384 338,47.062 342.641,51.703 356.037,38.306 		"/>
						<polygon class="hoop" points="271.247,57.359 265.59,63.017 252.277,49.704 257.892,44.005 		"/>
						<polygon class="hoop" points="269.122,32.607 282.95,46.207 282,47.384 282,47.062 277.131,51.703 263.621,38.306 		"/>
					</g>
				</g>
			</defs>
			<!-- Draw the pitch. -->
			<g id="Grass">
				<rect class="grass" width="620" height="620"/>
			</g>
			<g id="Chalk">
				<polyline class="chalkline" points="9.5,620 9.5,10.5 609.5,10.5 609.5,620 	"/>
				<polyline class="chalkline" points="109.5,11 109.5,176.5 509.5,176.5 509.5,11 	"/>
				<line class="chalkline" x1="9" y1="510.5" x2="609" y2="510.5"/>
				<circle class="chalkline" cx="310" cy="510.5" r="91.5"/>
				<path class="chalkline" d="M237.639,176.5C254.376,198.096,280.562,212,310,212s55.623-13.904,72.36-35.5H237.639z"/>
				<circle class="chalkarea" cx="310" cy="120.5" r="5.5"/>
				<circle class="chalkarea" cx="310" cy="510.5" r="5.5"/>
				<polyline class="chalkline" points="218.5,11 218.5,66.5 401,66.5 401.5,10.5 	"/>
				<path class="chalkline" d="M9.5,20c5.247,0,9.5-4.253,9.5-9.5H9.5V20z"/>
				<path class="chalkline" d="M609.5,20c-5,0-8-4.253-8-9.5h8V20z"/>
			</g>
			<xsl:apply-templates/>
		</svg>
	</xsl:template>
	<xsl:template match="hr:Organization">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="hr:OrganizationalUnit">
		<xsl:variable name="teamSize" select="count(hr:PersonMember)" />
		<xsl:comment select="concat('$teamSize = ', $teamSize)" />
		<xsl:variable name="formations"
			select="$teamFormationDoc/team:teamFormation/team:formations/team:formation[team:position[last() = $teamSize]]" />
		<xsl:comment select="concat('Formations matched = ', count($formations))" />
		<xsl:variable name="formation" select="$formations[position() = 1]" />
		<xsl:comment select="$formation/team:title" />
		<xsl:for-each select="hr:PersonMember">
			<!-- For each person, get their position (in order) and plot position (on pitch) based on formation. -->
			<xsl:variable name="playerPosition" select="position()" />
			<xsl:variable name="teamPosition" select="$formation/team:position[position() = $playerPosition]" />
			<g transform="{concat('translate(', string($teamPosition/team:start/@x * $pitchWidth div 2), ', ',
				string(($teamPosition/team:start/@y - 0.2) * 1.25 * $pitchHeight), ')')}">
				<!-- Build up the use element with attribute xlink:href="#teamPlayer" which calls the definition (the shirt and
					associated graphics and text). -->
				<xsl:element name="use">
					<xsl:attribute name="xlink:href"><xsl:value-of select="'#teamPlayer'" /></xsl:attribute>
					<xsl:choose>
						<xsl:when test="hr:PersonRole/@leader = 'true' and $playerPosition = 1">
							<xsl:attribute name="class"><xsl:value-of select="'captain keeper'" /></xsl:attribute>
						</xsl:when>
						<xsl:when test="hr:PersonRole/@leader = 'true'">
							<xsl:attribute name="class"><xsl:value-of select="'captain'" /></xsl:attribute>
						</xsl:when>
						<xsl:when test="$playerPosition = 1">
							<xsl:attribute name="class"><xsl:value-of select="'keeper'" /></xsl:attribute>
						</xsl:when>
					</xsl:choose>
				</xsl:element>
				<text transform="matrix(1 0 0 1 310 123)" class="playername">
					<xsl:value-of select="hr:PersonName/hr:FormattedName" />
				</text>
				<text transform="matrix(0.9925 0 0 1 310 78)" class="shirtnumber">
					<xsl:value-of select="$playerPosition" />
				</text>
			</g>
		</xsl:for-each>
		<text transform="matrix(1 0 0 1 310 575)" class="teamname">
			<xsl:value-of select="hr:OrganizationalUnitName" />
		</text>
	</xsl:template>
	<xsl:template match="hr:OrganizationName">
		<xsl:comment select="." />
	</xsl:template>
</xsl:stylesheet>
