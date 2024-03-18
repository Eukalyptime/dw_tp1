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
			<xsl:apply-templates select="image"/>
		</td>

		<td>
			<h1 style="text-align:center; color:blue;"><xsl:apply-templates select="title"/></h1>
			<h2 style="text-align:center; font-style: italic"><xsl:apply-templates select="author"/></h2>
			<blockquote style="color: darkgreen;">
				<xsl:apply-templates select="style_manager"/>
				<xsl:apply-templates select="NoBinome"/>
			</blockquote>
		</td>
	</tr>
	</table>

	<hr>
	<h3>Début du texte:</h3>

	<h3>Fin du texte.</h3>
	</hr>
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


<xsl:template match="image">
	<div align="center">
		<img>
			<xsl:attribute name="">
			<xsl:value-of select="images/prince.png"/>
			</xsl:attribute>
		</img>
	</div>
</xsl:template> 



</xsl:stylesheet>