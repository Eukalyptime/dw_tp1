<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>XSLT Excercises</title>
			</head>
			<body bgcolor="white">
				<table align="center" cellspacing="50">
					<tr>
						<td>
						</td>

						<td>
							<h1 style="text-align:center; color:blue;">LePetitPrince</h1>
							<h2 style="text-align:center; font-style: italic">Antoine de Saint-Exupéry</h2>
							<blockquote style="color: darkgreen;">
								Moi et Mon binome
								(B3221)
							</blockquote>
						</td>
					</tr>
				</table>
				
				<hr>
					<h3>Début du texte:</h3>

					<h3>Fin du texte.</h3>
				</hr>



				<!-- selection d'images ?? -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>


<xsl:apply-templates