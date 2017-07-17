<?xml version="1.0" encoding="utf-8"?>

  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                  xmlns:h="http://www.w3.org/1999/xhtml" 
                  xmlns="http://www.w3.org/1999/xhtml" 
                  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
                  xmlns:dc="http://purl.org/dc/elements/1.1/" 
                  xmlns:my="http://edutechwiki.unige.ch/XML" 
                  version="1.0">
	
    <xsl:output method="html" 
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" 
                doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>
    <!--<link rel="stylesheet" type="text/css" href="Style.css"/>-->
    <xsl:template match="/bill">
      <html>
        <head>
          <title>
            <xsl:value-of select="metadata/dublinCore/dc:title"/>
          </title>
            <!--<xsl:value-of select="metadata/dublinCore/dc:publisher"/>
            <xsl:value-of select="metadata/dublinCore/dc:date"/>
            <xsl:value-of select="metadata/dublinCore/dc:format"/>
            <xsl:value-of select="metadata/dublinCore/dc:language"/>
            <xsl:value-of select="metadata/dublinCore/dc:rights"/>-->
       
        </head>


        <body>
          <form style="font-family:Arial;font-size:15px;margin:5px 0px 0px 30px">

            <!--Top left header-->
            <div style="margin:0 0 0 50px;font-size:12px">    
              <div><xsl:value-of select="form/congress"/></div>
              <div style="margin:0 0 0 17px"><xsl:value-of select="form/session"/></div>
            </div>
            
            <!--Body section here-->
            <div style="text-align:center;font-size:25px;margin:35px 0 25px 0"><strong><xsl:value-of select="form/legis-num"/></strong></div>
            <div style="margin: 0 0 20px 0;text-algin:center"><xsl:value-of select="form/official-title"/></div>
            <hr style="display: block;width:35%"/>

            <!--Chamber and date in center-->
            <div style="text-align:center;font-size:18px">
              <div><xsl:value-of select="form/current-chamber"/></div>
              <div style="margin:20px 2px 0px 20px"><xsl:value-of select ="form/action/action-date"/><br/></div>
            </div>
            
            
                   
                <xsl:value-of select="form/action/action-desc"/>
                <hr style="display: block;width:35%;margin-top: 1.2em"/>
               
            <div style="text-align:center;font-size:25px;margin:20px 0 20px 0"><strong><xsl:value-of select="form/legis-type"/></strong></div>
            <div style="margin: 0 0 30px 0;text-algin:center"><xsl:value-of select="form/official-title"/></div>
            
            <!-- Bullets 1 and 2-->
            <xsl:for-each select="legis-body/section">
              <div style=" text-transform: uppercase;margin: 0 0 10px"><strong>Section. <xsl:value-of select="enum"/>
              <xsl:value-of select="header"/> </strong></div>
              <div style="margin:0 0 10px 20px"><xsl:value-of select="text"/></div>
              </xsl:for-each>

               <!--After Bullet Points-->
            <xsl:for-each select="legis-body/section/paragraph">

              <div style="margin:15px 15px 15px 15px">
                <xsl:value-of select="enum"/>
                <xsl:value-of select="text"/>
              </div>
            </xsl:for-each>
            
            <xsl:value-of select="legis-body/section/paragraph/quoted-block/subsection/enum"/>
            <xsl:value-of select="legis-body/section/paragraph/quoted-block/subsection/header"/>
            <xsl:value-of select="legis-body/section/paragraph/quoted-block/subsection/text"/>
            <hr/>
            
          </form>

        
        </body>
      </html>
      
    
    </xsl:template>
</xsl:stylesheet>
