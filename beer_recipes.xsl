<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<xsl:for-each select="RECIPES/RECIPE">
			<h3>Recipe Overview</h3>
			<table>
				<tr>
					<td>Boil Time:</td>
					<td><xsl:if test="number(BOIL_TIME)"><xsl:value-of select="format-number(BOIL_TIME, '###')" /> Minutes</xsl:if></td>
					<td>OG:</td>
					<td><xsl:value-of select="format-number(OG, '#.000')" /></td>
				</tr>
				<tr>
					<td>Color:</td>
					<xsl:variable name="srm_color">
						<xsl:value-of select="translate(EST_COLOR, '.', '-')" />
					</xsl:variable>
					<td class="srm_{$srm_color}">&#160;</td>
					<td>FG:</td>
					<td><xsl:value-of select="format-number(FG, '#.000')" /></td>
				</tr>
				<tr>
					<td>IBU:</td>
					<td><xsl:value-of select="IBU" /></td>
				</tr>
			</table>

			<xsl:apply-templates select="FERMENTABLES" />
			
			<xsl:apply-templates select="HOPS" />

			<xsl:apply-templates select="MISCS" />

			<xsl:apply-templates select="YEASTS" />


			<xsl:choose>
				<xsl:when test="PRIMARY_AGE != ''">
			<h3>Fermentation</h3>
			<table>
				<tbody>
					<tr>
						<td><strong>Primary:</strong></td>
						<td><xsl:value-of select="PRIMARY_AGE" /> days at <xsl:value-of select="round(PRIMARY_TEMP * (9 div 5) + 32)" /> &#176; F (<xsl:value-of select="format-number(PRIMARY_TEMP, '##')" />&#176; C)</td>
					</tr>
					
					<xsl:choose>
						<xsl:when test="SECONDARY_AGE != ''">
							<tr>
								<td><strong>Secondary:</strong></td>
								<td><xsl:value-of select="SECONDARY_AGE" /> days at <xsl:value-of select="round(SECONDARY_TEMP * (9 div 5) + 32)" /> &#176; F (<xsl:value-of select="format-number(SECONDARY_TEMP, '##')" />&#176; C)</td>
							</tr>
							
						</xsl:when>
					</xsl:choose>

					<xsl:choose>
						<xsl:when test="TERITARY_AGE != ''">
							<tr>
								<td><strong>Teritary:</strong></td>
								<td><xsl:value-of select="TERITARY_AGE" /> days at <xsl:value-of select="round(TERITARY_TEMP * (9 div 5) + 32)" /> &#176; F (<xsl:value-of select="format-number(TERITARY_TEMP, '##')" />&#176; C)</td>
							</tr>
						</xsl:when>
					</xsl:choose>

				</tbody>
			</table>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="FERMENTABLES">
		<h3>Fermentables</h3>
		<table>
			<thead>
				<th>Ingredient</th>
				<th>Amount</th>
			</thead>
			<tbody>
				<xsl:for-each select="FERMENTABLE">
				<tr>
					<td><xsl:value-of select="NAME" /></td> 
					<td><xsl:value-of select="format-number(round(100 * (AMOUNT * 2.2)) div 100, '##.00')" /> lb (<xsl:value-of select="format-number(round(AMOUNT * 100) div 100, '##.00')" /> kg)</td> 
				</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="HOPS">
		<h3>Hops</h3>
		<table>
			<thead>
				<tr>
					<th>Variety</th>
					<th>Alpha</th>
					<th>Amount</th>
					<th>Form</th>
					<th>When</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="HOP">
					<tr>
						<td><xsl:value-of select="NAME" /></td>
						<td><xsl:value-of select="ALPHA" />%</td>
						<td><xsl:value-of select="format-number(round(100 * (AMOUNT * 35.273961)) div 100, '##.00')" /> oz (<xsl:value-of select="round(AMOUNT * 1000)" /> g)</td>
						<td>
							<xsl:choose>
								<xsl:when test="string-length(FORM) > 0">Unknown</xsl:when>
								<xsl:otherwise><xsl:value-of select="FORM" /></xsl:otherwise>
							</xsl:choose>
						</td>
						<td><xsl:if test="number(TIME)"><xsl:value-of select="format-number(TIME, '###')" /> Min From End</xsl:if></td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="MISCS">

	</xsl:template>

	<xsl:template match="YEASTS">
		<h3>Yeasts</h3>
		<xsl:for-each select="YEAST">
			<xsl:value-of select="LABORATORY" />&#160;<xsl:value-of select="PRODUCT_ID" />&#160;<xsl:value-of select="NAME" /><br />
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
