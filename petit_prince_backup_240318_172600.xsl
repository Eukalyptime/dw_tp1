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
				<xsl:for-each select="styling_information/styled_by/style_manager">
					<xsl:value-of select="."/> <br/>
				</xsl:for-each>
				<xsl:apply-templates select="styling_information/NoBinome"/>
				<xsl:apply-templates select="styling_information/email"/> <br/>
				<xsl:apply-templates select="styling_information/date"/>
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


<!-- <xsl:template match="body">
	<xsl:for-each select="paragraph/phrase[@language='francais']">
	<p>
		<span style="">
			<xsl:value-of select="."/>
		</span>
	</p>
	</xsl:for-each>

	<xsl:for-each select="paragraph/phrase[@language='hongrois']">
	<p>
		<span style="font-style: italic; color: brown;">
			<xsl:value-of select="."/>
		</span>
	</p>
	</xsl:for-each>
</xsl:template>  -->

<!-- <xsl:template match="body">
	<xsl:for-each select="paragraph/@type='narration'">
	<p>
		<xsl:apply-templates select="phrase"/>
	</p>
	</xsl:for-each>

	<xsl:for-each select="paragraph/@type='dialogue'">
	<tr>
		<td width="45%">

		</td>
	</tr>
	</xsl:for-each>
</xsl:template>  -->

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
								<xsl:if test="contains(.,'mouton')">
									<span style="font-size: 24; font-weight: bold;"> <xsl:value-of select="."/></span>
									<img src="../images/moutonDessin.png" title="Dessin"> </img>
								</xsl:if>
								<xsl:if test="not(contains(.,'mouton'))">
									<span> <xsl:value-of select="."/></span>
								</xsl:if>
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
							<span style="font-style: italic; color: brown;"><xsl:value-of select="."/></span></td>
						</tr>
					</xsl:for-each>
				</table>
            </td>
         </tr>
      </table>
</xsl:template> 


<!-- 					<tr>
						<td width="50">
							<xsl:if test="/phrase[@speaker='LePetitPrince']">
								<img src="../images/LePetitPrince.png" title="LePetitPrince"> </img>
							</xsl:if>
							<xsl:if test="/phrase[@speaker='Narrateur']">
								<img src="../images/Narrateur.png" title="Narrateur"> </img>
							</xsl:if>
						</td>
						<td><span> <xsl:apply-templates select="phrase[@language='hongrois']"/></span></td>
					</tr> -->



<xsl:template match="phrase">
	<xsl:if test="@language='francais'">
		<span style="">
			<xsl:value-of select="."/> 
		</span>
	</xsl:if>
	<!-- Ne fonctionne pas (detection de deux elements consecutifs differents) -->
	<!-- Si les deux elements qui se suivent sont différents on fait un saut de ligne -->
	<!-- <xsl:if test="phrase/@language[not(.=preceding::phrase/@language)]">
		<br/>
	</xsl:if> -->
	<xsl:if test="@language='hongrois'">
		<span style="font-style: italic; color: brown;">
			<xsl:value-of select="."/> 
		</span>
	</xsl:if>
</xsl:template> 


<!-- <xsl:template match="table">
	<tr>
		<td width="50">
			<xsl:if test="/phrase[@speaker='LePetitPrince']">
				<img src="../images/LePetitPrince.png" title="LePetitPrince">
			</xsl:if>
			<xsl:if test="/phrase[@speaker='Narrateur']">
				<img src="../images/LePetitPrince.png" title="LePetitPrince">
			</xsl:if>
		</td>
		<td>
		</td>
	</tr>
</xsl:template> -->


</xsl:stylesheet>