<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="xs" version="2.0">
	<xsl:template match="/table">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="simple"
                  page-height="29.7cm" page-width="21cm"
                  margin-top="1cm" margin-bottom="2cm"
                  margin-left="2.5cm" margin-right="2.5cm">
					<fo:region-body margin-top="3cm"/>
					<fo:region-before extent="3cm"/>
					<fo:region-after extent="1.5cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="simple">
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<fo:block font-size="14pt" padding="10px" font-weight="bold">
							<xsl:value-of select="@heading"/>
						</fo:block>
						<fo:block font-size="10pt">
							<fo:table border="solid" border-collapse="separate" border-separation="5pt">
								<fo:table-column column-width="7cm"/>
								<fo:table-column column-width="8cm"/>
								<fo:table-header>
									<fo:table-row>
										<xsl:for-each select="*[1]/*">
											<fo:table-cell>
												<fo:block font-weight="bold">
													<xsl:value-of select="name(.)"/>
												</fo:block>
											</fo:table-cell>
										</xsl:for-each>
									</fo:table-row>
								</fo:table-header>
								<fo:table-body>
									<xsl:apply-templates select="*"/>
								</fo:table-body>
							</fo:table>
						</fo:block>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template match="*">
		<fo:table-row>
			<xsl:for-each select="*">
				<fo:table-cell>
					<fo:block>
						<xsl:value-of select="."/>
					</fo:block>
				</fo:table-cell>
			</xsl:for-each>
		</fo:table-row>
	</xsl:template>
</xsl:stylesheet>
