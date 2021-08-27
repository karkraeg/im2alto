<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:alto="http://www.loc.gov/standards/alto/ns-v3#"
    exclude-result-prefixes="xs" version="2.0">
        <xsl:output method="xml" indent="yes"/>

   
    <xsl:template match="//page">
        <alto
            xsi:schemaLocation="http://www.loc.gov/standards/alto/ns-v3# http://www.loc.gov/standards/alto/v3/alto-3-1.xsd"
            xmlns="http://www.loc.gov/standards/alto/ns-v3#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <Description>
                <MeasurementUnit>pixel</MeasurementUnit>
                <OCRProcessing ID="iw2alto">
                    <ocrProcessingStep>
                        <processingDateTime><xsl:value-of  select="current-dateTime()"/></processingDateTime>
                        <processingSoftware>
                            <softwareCreator>Karl Krägelin</softwareCreator>
                            <softwareName>iw2alto</softwareName>
                            <softwareVersion>0.2</softwareVersion>
                        </processingSoftware>
                    </ocrProcessingStep>
                </OCRProcessing>
            </Description>
            <Styles>
                <TextStyle FONTFAMILY="Sans serif" FONTSIZE="12" ID="font0"/>
            </Styles>
            <Layout>
        <Page WIDTH="{./pagesize/@width}" HEIGHT="{./pagesize/@height}" ID="Page1" PHYSICAL_IMG_NR="1">
            <PrintSpace>
                <xsl:apply-templates select="block"/>
                   
                
            </PrintSpace>
        </Page>
            </Layout>
        </alto>
    </xsl:template>

    <xsl:template match="row">
        <TextLine xmlns="http://www.loc.gov/standards/alto/ns-v3#" VPOS="{./word[1]/@top}" HPOS="{./word[1]/@left}"  WIDTH="{./word[position()=last()]/@right - ./word[1]/@left}" HEIGHT="{./word[position()=last()]/@bottom - ./word[1]/@top}">
            
            <xsl:for-each select="./word">
                <String xmlns="http://www.loc.gov/standards/alto/ns-v3#" CONTENT="{./text()}" WC="{abs(./@conf)}" VPOS="{./@top}" HPOS="{./@left}" WIDTH="{./@right - ./@left}" HEIGHT="{./@bottom - ./@top}"></String>
            </xsl:for-each>
            
        </TextLine>
    </xsl:template>

    
    <xsl:template match="block">
        <TextBlock xmlns="http://www.loc.gov/standards/alto/ns-v3#" ID="{concat('Textblock_',position())}" VPOS="{./@top}" HPOS="{./@left}"  WIDTH="{./@right - ./@left}" HEIGHT="{./@bottom - ./@top}">
            <!-- HEIGHT und WIDTH der Textline darf sich nicht auf den TextBlock beziehen -->
            <xsl:apply-templates select="row"/>
           
        </TextBlock>
    </xsl:template>
    
    
    
    
</xsl:stylesheet>
