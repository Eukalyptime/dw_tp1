<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>XSLT Excercises</title>
			</head>
			<body bgcolor="white">
				<xsl:apply-templates/>
				<!-- selection d'images ?? -->
			</body>
		</html>
	</xsl:template>


<xsl:template match="the_header">
	<table align="center" cellspacing="50">
	<tr>
		<td>
			<xsl:apply-templates select="cover"/>
		</td>

		<td>
			<h1 style="text-align:center; color:blue;"><xsl:apply-templates select="title"/></h1>
			<h2 style="text-align:center; font-style: italic"><xsl:apply-templates select="author"/></h2>
			<blockquote style="color: darkgreen;">
				<!-- <xsl:apply-templates select="styling_information/styled_by/style_manager"/> <br/> -->
				But du TP du
				<xsl:apply-templates select="styling_information/date"/>
				: 
				<xsl:apply-templates select="styling_information/styling_description"/> <br/>
				Auteurs: 
				<!-- <xsl:for-each select="styling_information/styled_by/style_manager">
					<xsl:value-of select="."/> et 

				</xsl:for-each> -->
				<xsl:value-of select="(styling_information/styled_by/style_manager)[position()=1]"/> et
				<xsl:value-of select="(styling_information/styled_by/style_manager)[position()=2]"/> 
				(<xsl:apply-templates select="styling_information/styled_by/NoBinome"/>)<br/>
				Email du responsable: 
				<xsl:apply-templates select="styling_information/email"/> <br/>
				
			</blockquote>
		</td>
	</tr>
	</table>
</xsl:template>	


<xsl:template match="cover">
	<div align="center">
		<img>
			<xsl:attribute name="src">
			<xsl:value-of select="@path"/>
			</xsl:attribute>
		</img>
	</div>
</xsl:template> 


<xsl:template match="body">
	<hr></hr>
		<h3> Début du texte </h3>
			<xsl:apply-templates/>
		<h3> Fin du texte </h3>
	<hr></hr>
</xsl:template> 


<xsl:template match="paragraph[@type='narration']">
	<p>
		<xsl:apply-templates select="phrase[@language='francais']"/>
		<br/>
		<xsl:apply-templates select="phrase[@language='hongrois']"/>
	</p>
</xsl:template> 


<!-- BONNE BASE -->
<xsl:template match="paragraph[@type='dialogue']">
	<table align="center" width="90%">
         <tr>
            <td width="45%">
				<table border="1" cellpadding="10" width="100%">
					<!-- <xsl:for-each select="phrase[@language='francais']"> -->
					<xsl:for-each select="phrase[@language='francais']">
						<tr>
							<td width="50">
								<xsl:if test="@speaker='LePetitPrince'">
									<img src="../images/LePetitPrince.png" title="LePetitPrince"> </img>
								</xsl:if>
								<xsl:if test="@speaker='Narrateur'">
									<img src="../images/Narrateur.png" title="Narrateur"> </img>
								</xsl:if>
							</td>
							<td>
								<!-- ###### OK ??? -->
								<!-- <xsl:if test="contains(.,'mouton')">
									<span style="font-size: 24px; font-weight: bold;"> <xsl:value-of select="."/></span>
									<img src="../images/moutonDessin.png" title="Dessin"> </img>
								</xsl:if>
								<xsl:if test="not(contains(.,'mouton'))">
									<span> <xsl:apply-templates select="."/> </span>
								</xsl:if> -->
								<span> <xsl:apply-templates select="."/> </span>
							</td>
						</tr>
					</xsl:for-each>
				</table>
            </td>
            <td></td>
            <td width="45%">
				<table border="1" cellpadding="10" width="100%">
					<xsl:for-each select="phrase[@language='hongrois']">
						<tr>
							<td width="50">
								<xsl:if test="@speaker='LePetitPrince'">
									<img src="../images/LePetitPrince.png" title="LePetitPrince"> </img>
								</xsl:if>
								<xsl:if test="@speaker='Narrateur'">
									<img src="../images/Narrateur.png" title="Narrateur"> </img>
								</xsl:if>
							</td>
							<td>
							<!-- ###### OK ??? -->
							<!-- <span style="font-style: italic; color: brown;"><xsl:value-of select="."/></span> -->
							<span> <xsl:apply-templates select="."/></span>
							</td>
						</tr>
					</xsl:for-each>
				</table>
            </td>
         </tr>
      </table>
</xsl:template> 


<xsl:template match="phrase">
	<xsl:if test="@language='francais'">
		<xsl:if test="contains(.,'mouton')">
			<span style="font-size: 24px; font-weight: bold;"> <xsl:value-of select="."/></span>
			<img src="../images/moutonDessin.png" title="Dessin"> </img>
		</xsl:if>
		<xsl:if test="not(contains(.,'mouton'))">
			<span> <xsl:value-of select="."/></span>
		</xsl:if>
	</xsl:if>
	<!-- Ne fonctionne pas (detection de deux elements consecutifs differents) -->
	<!-- Si les deux elements qui se suivent sont différents on fait un saut de ligne -->
	<xsl:if test="@language='hongrois'"> 
		<span style="font-style: italic; color: brown;">
			<xsl:value-of select="."/> 
		</span>
	</xsl:if>
</xsl:template> 


<xsl:template match="image">
	<div style="text-align: center;"><img src="../images/mouton.png"/></div>
</xsl:template>

</xsl:stylesheet>