<!--<?xml version="1.0" encoding="UTF-u8"?>-->
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:ead="urn:isbn:1-931666-22-9" xmlns:ns2="http://www.w3.org/1999/xlink">
    <!--
        *******************************************************************
        *                                                                 *
        * VERSION:          1.02                                          *
        *                                                                 *
        * AUTHOR:           Winona Salesky                                *
        *                   wsalesky@gmail.com
        * EDITOR:           Matt Francis                             
        *                   mrf22@psu.edu                               *
        *                                                                 *
        * ABOUT:           This file has been created for use with        *
        *                  the Archivists' Toolkit  July 30 2008.         *
        *                  this file calls lookupLists.xsl, which         *
        *                  should be located in the same folder.          *
        *                                                                 *
        * UPDATED          May 31, 2012                                   *
        *                  Fixed bug with multiple instance display       *
        * UPDATED          June 3, 2009                                   *
        *                  Added additional table cell to component       *
        *                  display to address bug ART-1833, also addressed* 
        *                  problematic container heading displays         *          
        *                                                                 *
        * UPDATED          September 24, 2009                             *
        *                  Added address to publication statement         *
        *                  March 23, 2009                                 *
        *                  Added revision description and date,           * 
        *                  and publication information                    *
        *                  March 12, 2009                                 *
        *                  Fixed character encoding issues                *
        *                  March 11, 2009                                 *
        *                  Added repository branding device to header     *
        *                  March 1, 2009                                  *
        *                  Changed bulk date display for unitdates        *
        *                  Feb. 6, 2009                                   *
        *                  Added roles to creator display in summary      * 
        *******************************************************************
    -->
    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes" method="html"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" encoding="utf-8"/>
    <!--    <xsl:include href="lookupLists.xsl"/>-->
    <!-- Creates the body of the finding aid.-->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <title>
                    <xsl:value-of select="ead/eadheader/filedesc/titlestmt/titleproper"/>
                </title>
                <xsl:call-template name="metadata"/>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <div id="main">
                    <!--<xsl:call-template name="header"/>-->
                    <div id="pageheader">
                        <!--overall blue bar container - spans entire page-->
                        <div id="pageheadercontent">
                            <!--holds content for page header (logo and global nav)-->
                            <!--start global navigation-->
                            <!--logo-->
                            <div id="logo">
                                <!--positions logo in pageheader-->
                                <img src="logowordmark1.jpg"
                                    alt="Penn State University Libraries Logo" width="465"
                                    height="78" border="0" usemap="#Map"/>
                                <map name="Map" id="Map">
                                    <area shape="rect" coords="103,4,199,74"
                                        href="http://www.psu.edu" alt="penn state"/>
                                    <area shape="rect" coords="199,4,401,73"
                                        href="http://www.libraries.psu.edu/psul/home.html"
                                        alt="university libraries"/>
                                </map>

                                <h1>Penn State University Libraries - University Libraries Home</h1>

                            </div>
                        </div>
                    </div>
                    <div id="contents">
                        <div id="contentscontainer">
                            <xsl:call-template name="toc"/>
                            <div id="content-right">
                                <!-- Arranges archdesc into predefined sections, to change order 
                                or groupings, rearrange templates  -->
                                <div id="title">
                                    <xsl:apply-templates select="/ead/eadheader"/>
                                </div>
                                <div id="deaccession-note">
                                    <xsl:apply-templates select="/ead/archdesc/accessrestrict"/>
                                </div>
                                <!-- Summary Information, summary information includes citation -->
                                <xsl:apply-templates select="/ead/archdesc/did"/>
                                <xsl:apply-templates select="/ead/archdesc/bioghist"/>
                                <xsl:apply-templates select="/ead/archdesc/scopecontent"/>
                                <xsl:apply-templates select="/ead/archdesc/arrangement"/>
                                <xsl:apply-templates select="/ead/archdesc/fileplan"/>

                                <!-- Administrative Information  -->
                                <xsl:if
                                    test="/ead/archdesc/accessrestrict or
                                /ead/archdesc/userestrict or
                                /ead/earchdesc/custodhist or
                                /ead/archdesc/accruals or
                                /ead/archdesc/altformavail or
                                /ead/archdesc/acqinfo or
                                /ead/archdesc/processinfo or
                                /ead/archdesc/appraisal or
                                /ead/archdesc/originalsloc or 
                                /ead/eadheader/filedesc/publicationstmt or 
                                /ead/eadheader/revisiondesc">

                                    <h3 id="adminInfo">Administrative Information</h3>
                                    <xsl:apply-templates
                                        select="/ead/eadheader/filedesc/publicationstmt"/>
                                    <xsl:apply-templates select="/ead/eadheader/revisiondesc"/>
                                    <xsl:apply-templates
                                        select="/ead/archdesc/descgrp/accessrestrict"/>
                                    <xsl:apply-templates select="/ead/archdesc/accessrestrict"/>
                                    <xsl:apply-templates select="/ead/archdesc/descgrp/userestrict"/>
                                    <xsl:apply-templates select="/ead/archdesc/userestrict"/>
                                    <xsl:apply-templates select="/ead/archdesc/descgrp/custodhist"/>
                                    <xsl:apply-templates select="/ead/archdesc/custodhist"/>
                                    <xsl:apply-templates select="/ead/archdesc/descgrp/prefercite"/>
                                    <xsl:apply-templates select="/ead/archdesc/prefercite"/>
                                    <xsl:apply-templates select="/ead/archdesc/accruals"/>
                                    <xsl:apply-templates select="/ead/archdesc/acqinfo"/>
                                    <xsl:apply-templates select="/ead/archdesc/descgrp/processinfo"/>
                                    <xsl:apply-templates select="/ead/archdesc/processinfo"/>
                                    <xsl:apply-templates select="/ead/archdesc/appraisal"/>
                                    <xsl:apply-templates select="/ead/archdesc/altformavail"/>
                                    <xsl:apply-templates select="/ead/archdesc/originalsloc"/>
                                    <xsl:call-template name="returnTOC"/>
                                </xsl:if>

                                <!-- Related Materials -->
                                <xsl:if
                                    test="/ead/archdesc/relatedmaterial or /ead/archdesc/separatedmaterial">
                                    <h3 id="relMat">Related Materials</h3>
                                    <xsl:apply-templates select="/ead/archdesc/relatedmaterial"/>
                                    <xsl:apply-templates select="/ead/archdesc/separatedmaterial"/>
                                    <xsl:call-template name="returnTOC"/>
                                </xsl:if>
                                <xsl:apply-templates select="/ead/archdesc/daogrp"/>
                                <xsl:apply-templates select="/ead/archdesc/dao"/>
                                <!--<xsl:apply-templates select="/ead/archdesc/controlaccess"/>-->
                                <xsl:apply-templates select="/ead/archdesc/otherfindaid"/>
                                <xsl:apply-templates select="/ead/archdesc/phystech"/>
                                <xsl:apply-templates select="/ead/archdesc/odd"/>

                                <xsl:apply-templates select="/ead/archdesc/bibliography"/>
                                <xsl:apply-templates select="/ead/archdesc/index"/>
                                <xsl:if test="/ead/archdesc/dsc/child::*">
                                    <xsl:apply-templates select="/ead/archdesc/dsc"/>
                                    <xsl:apply-templates select="/ead/archdesc/dsc/dao"/>
                                </xsl:if>
                            </div>
                        </div>
                    </div>
                </div>
                <script type="text/javascript" src="/etc/designs/psul/js/gaAddons-2.1.2.min.js"/>
                <script type="text/javascript">
                    var _gaq = _gaq || [];
                    _gaq.push(
                    ['_setAccount', 'UA-7434386-5'],
                    ['_trackDownload'], // This is where gaAddons calls go
                    ['_trackOutbound'], // Showing three basic calls       
                    ['_setXDomain', {
                    domainName: 'libraries.psu.edu'
                    }],
                    
                    ['_trackPageview']
                    );
                    (function() {
                    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
                    })();
                </script>
            </body>
        </html>
    </xsl:template>

    <!-- CSS for styling HTML output. Place all CSS styles in this template.-->
    <xsl:template name="css">
        <style type="text/css">
            html{
                margin:0;
                padding:0;
                background:#fff;
            }
            
            body{
                color:#000;
                font:13px Cambria, Verdana, Trebuchet, Arial, Helvetica, sans-serif;
                margin:0px;
                padding:0px;
                text-align:center;
            }
            
            ul,
            ol{
                padding:5px 0 5px 2.5em;
                margin:0 0 0 0;
            }
            
            li{
                font-size:107%;
                line-height:1.7em;
            }
            
            /*--- Main Div styles ---*/
            div#main{
                margin:0 auto;
                /*width: 95%;*/
                text-align:left;
            }
            /*--- Header trying to mimic www.libraries.psu.edu --- */
            #pageheader{
                width:100%;
                padding:0;
                margin:0;
                background-image:url(headerbg.jpg);
                background-color:#31526f;
                background-repeat:repeat-x;
                height:78px;
                color:#ffffff;
            }
            
            #pageheadercontent{
                width:1024px;
                margin:0 auto;
                padding:0;
            }
            
            #logo{
                width:465px;
                margin:0 0 0 -85px;
                padding:0;
                z-index:0;
            }
            #logo h1{
                display:none;
                color:#ffffff;
            }
            
            #logoprint{
                display:none;
            }
            
            
            
            #header{
                margin:/*10px */0px;
                padding:10px 0;
                display:block;
                width:100%;
                /*height: 50px;
                overflow:hidden;*/
                background-color:#FFF;
                border-top:5px solid #000;
                border-bottom:1px solid #000;
                text-align:right;
            }
            #header h3{
                display:inline;
                font-size:138.5%;
                margin:20px 20px 0px 25px;
                padding-top:20px;
                color:#000;
                font-weight:lighter;
                text-align:right;
            }
            #header img{
                display:inline;
                vertical-align:bottom; /*padding-top: 2px;*/
            }
            #title{
                /*display: block; 
                margin:0; 
                height: 85px;*/
                padding:0 0 16px 0px;
                background-color:#fff;
                text-align:left;
                color:#000;
            }
                        
            /*border: 1px dashed #999; 
                background-color: #eee; 
                margin: 0; 
                padding: 8px 8px 8px 24px;
                }*/
            
            #title h1{
                margin:10px 0;
                padding:0;
                font-size:160%;
                font-weight:normal;
            }
            #title h2{
                margin:10 px 0;
                padding:0;
                font-size:160%;
                font-weight:normal;
            }
            
            #deaccession-note{
            /*display: block; 
            margin:0; 
            height: 85px;*/
            padding:0 0 16px 0px;
            background-color:#fff;
            text-align:left;
            color: red;
            font-size:120%;
            }
            
            /*--- Main Content Div ---*/
            #contents{
                /*display:block; */
                margin:0 /*10px 20px*/;
                padding:0;
                width:100%;
                text-align:center;
                /*border-top: 1px solid #000; 
                border-bottom: 1px solid #000;*/
            }
            
            #contentscontainer{
                width:1024px;
                margin:0 auto;
                padding:20px 10px;
            }
            
            /*--- Table of Contents styles ---*/
            #toc{
                display:block;
                width:200px;
                position:relative;
                float:left;
                clear:left;
                /*margin: 10px/*16px 8px*/
                ;
                /*padding: 0px;
                border-right: 1px solid #000;*/
                text-align:left;
            
                border:1px dashed #999;
                background-color:#eee;
                margin:0;
                padding:12px /*8px 8px 24px*/;
            }
            
            #toc h3{
                margin:/*16px 8px 16px */0px;
            }
            #toc dt{
                margin:3px;
                padding-bottom:4px;
                font-weight:normal;
                font-size:107%;
            }
            #toc dd{
                margin-top:3px;
                margin-left:16px;
                padding-bottom:4px;
                font-size:107%;
            }
            #toc dt a:link,
            #toc dd a:link{
                color:#31526F;
                text-decoration:underline;
            }
            #toc dt a:visited,
            #toc dd a:visited{
                color:#31526F;
                text-decoration:underline;
            }
            #toc dt a:active,
            #toc dd a:active{
                color:#31526F;
            }
            #toc dt a:hover,
            #toc dd a:hover{
                color:#000;
            }
            
            /*--- EAD body ---*/
            #content-right{
                display:block;
                float:right;
                width:765px;
                margin:0;
                padding-left:25px;
                text-align:left;
                /*margin-left:275px; 
                margin-right: 10px;*/
            }
            
            /*--- Typography ---*/
            h1,
            h2,
            h3,
            h4{
                font-family:Verdana, Arial, Helvetica, sans-serif;
            }
            #contents h3{
                margin:0 0 15px 0 /*16px 8px 16px -8px*/;
                font-size:116%;
                font-variant:small-caps;
                border-bottom:1px dashed #999;
            }
            
            h4{
                font-size:93%;
                margin:0 /*24px 8px 4px -4px*/;
                padding-bottom:15px;
                color:#555;
            }
            
            p{
                margin:0 /*8px*/;
                padding-bottom:15px;
                font-size:107%;
                line-height:1.7em;
            }
            dt{
                margin:0 /*2px 8px*/;
                font-weight:bold;
            }
            dd{
                margin:0 /*2px 16px*/;
            }
            br{
                margin:0;
                padding:0;
            }
            hr{
                border:1px solid #000;
                margin:0 0 24px 0;
            }
            .summary dt{
                margin:0 /*16px 8px 0px 8px*/;
                padding-bottom:15px;
                color:#555;
                font-size:107%;
            }
            .summary dd{
                margin:0 /*2px 24px 2px 24px*/;
                padding-bottom:15px;
                font-size:107%;
            }
            .returnTOC{
                font-size:90%;
                margin-bottom:15px;
            }
            .returnTOC a:link{
                color:#31526F;
                text-decoration:underline;
            }
            .returnTOC a:visited{
                color:#31526F;
                text-decoration:underline;
            }
            .returnTOC a:active{
                color:#31526F;
            }
            .returnTOC a:hover{
                color:#EE0000;
            }
            
            /*--- Emph styles -------*/
            .smcaps{
                font-variant:small-caps;
            }
            .underline{
                text-decoration:underline;
            }
            .bold{
                font-weight:bold;
            }
            
            .hide{
                display:none;
            }
            
            /*--- Styles Index entry elements ---*/
            .indexEntry{
                display:block
            }
            
            /*---- Table Styles ---*/
            table{
                border:1px solid #bbbbbb;
                margin:/*16px*/0;
                /*width: 60%;*/
                padding:0;
                font-size:107%;
            }
            
            th{
                background-color:#000;
                color:#fff;
                padding:0;
            }
            td{
                vertical-align:top;
                padding:0;
            }
            
            /*---Summary Table Styles --*/
            table.summary{
                border:0 /*1px solid #bbbbbb*/;
                margin:/*16px*/0;
                /*width: 60%;*/
                padding:0 0 24px 0;
                font-size:107%;
            
            }
            
            /*---Container List Styles  --*/
            table.containerList{
                border:1px solid #bbbbbb;
                padding:0;
                margin:0;
                width:auto;
            }
            table.containerList h4{
                margin:0 /*2px 8px*/;
                padding:5px 10px;
            }
            
            table.containerList td{
                margin:0;
                padding:5px 10px;
            }
            
            table.containerList p{
                margin:0;
                padding:5px 10px;
            }
            
            tr.series{
                background-color:#bbbbbb;
                border:1px solid #bbbbbb;
                margin:0;
                padding:5px 10px;
            }
            tr.subseries{
                background-color:#dddddd;
                border:1px solid #bbbbbb;
                margin:0;
                padding:5px 10px;
            }
            .containerHeader{
                /*display:none;*/
                font-variant:small-caps;
                font-weight:bold;
                color:#555;
                text-align:center;
            }
            .containerTypes{
                font-varient:small-caps;
                font-weight:bold;
                color:#555;
            }
            .container{
                text-align:center;
                padding:0;
            }
            .clear{
                clear:both;
            }
            table.parentContainers{ /*margin-top:2px;*/
                border:none;
                float:right;
                clear:both;
                width:400px;
                border-top:1px solid #666;
                border-bottom:1px solid #666;
            }
            
            table hr{
                display:none;
            }
            
            /*--- Clevel Margins ---*/
            table td.c{
                padding-left:0; /*border-left:1px solid #bbbbbb;*/
            }
            table td.c01{
                padding-left:0;
            }
            table td.c02{
                padding-left:8px;
            }
            table td.c03{
                padding-left:16px;
            }
            table td.c04{
                padding-left:24px;
            }
            table td.c05{
                padding-left:32px;
            }
            table td.c06{
                padding-left:40px;
            }
            table td.c07{
                padding-left:48px;
            }
            table td.c08{
                padding-left:56px;
            }
            
            
            
            
            .address{
                display:inline;
                margin:8px;
            }
            .odd{
                background-color:#eee;
            }
            .citation{
                border:1px dashed #999;
                background-color:#eee;
                margin:24px 8px;
                padding:8px 8px 8px 24px;
            }
            .citation h4{
                margin-top:8px;
            }
            
            /*---List Styles---*/
            .simple{
                list-style-type:none;
            }
            .arabic{
                list-style-type:decimal
            }
            .upperalpha{
                list-style-type:upper-alpha
            }
            .loweralpha{
                list-style-type:lower-alpha
            }
            .upperroman{
                list-style-type:upper-roman
            }
            .lowerroman{
                list-style-type:lower-roman
            }</style>
    </xsl:template>

    <!-- This template creates a customizable header  -->
    <xsl:template name="header">
        <div id="header">
            <div>
                <!--<h3>
                <xsl:value-of select="/ead/eadheader/filedesc/publicationstmt/publisher"/>
            </h3>-->
                <!-- Adds repository branding device, looks best if this is under 100px high. -->
                <!--<xsl:if test="/ead/eadheader/filedesc/publicationstmt/p/extref">-->
                <img src="psulogo.gif"/>
                <!--</xsl:if>-->
            </div>
        </div>
    </xsl:template>

    <!-- HTML meta tags for use by web search engines for indexing. -->
    <xsl:template name="metadata">
        <meta http-equiv="Content-Type" name="dc.title"
            content="{concat(/ead/eadheader/filedesc/titlestmt/titleproper,' ',/ead/eadheader/filedesc/titlestmt/subtitle)}"/>
        <meta http-equiv="Content-Type" name="dc.author" content="{/ead/archdesc/did/origination}"/>
        <xsl:for-each select="/ead/archdesc/controlaccess/descendant::*">
            <meta http-equiv="Content-Type" name="dc.subject" content="{.}"/>
        </xsl:for-each>
        <meta http-equiv="Content-Type" name="dc.type" content="text"/>
        <meta http-equiv="Content-Type" name="dc.format" content="manuscripts"/>
        <meta http-equiv="Content-Type" name="dc.format" content="finding aids"/>
    </xsl:template>

    <!-- Removes period from Collection Number and replaces with a space -->

    <!-- Creates an ordered table of contents that matches the order of the archdesc 
        elements. To change the order rearrange the if/for-each statements. -->
    <xsl:template name="toc">
        <div id="toc">
            <h3>Table of Contents</h3>
            <dl>
                <xsl:if test="/ead/archdesc/did">
                    <dt>
                        <a href="#{generate-id(.)}">Descriptive Summary</a>
                    </dt>
                </xsl:if>
                <xsl:for-each select="/ead/archdesc/bioghist">
                    <dt>
                        <a>
                            <xsl:call-template name="tocLinks"/>
                            <xsl:choose>
                                <xsl:when test="head">
                                    <xsl:value-of select="head"/>
                                </xsl:when>
                                <xsl:otherwise>Biographical or Historical Information</xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </dt>
                </xsl:for-each>
                <xsl:for-each select="/ead/archdesc/scopecontent">
                    <dt>
                        <a>
                            <xsl:call-template name="tocLinks"/>
                            <xsl:choose>
                                <xsl:when test="head">
                                    <xsl:value-of select="head"/>
                                </xsl:when>
                                <xsl:otherwise>Scope &amp; Content</xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </dt>
                </xsl:for-each>
                <xsl:for-each select="/ead/archdesc/arrangement">
                    <dt>
                        <a>
                            <xsl:call-template name="tocLinks"/>
                            <xsl:choose>
                                <xsl:when test="head">
                                    <xsl:value-of select="head"/>
                                </xsl:when>
                                <xsl:otherwise>Arrangement of Collection</xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </dt>
                </xsl:for-each>
                <xsl:for-each select="/ead/archdesc/fileplan">
                    <dt>
                        <a>
                            <xsl:call-template name="tocLinks"/>
                            <xsl:choose>
                                <xsl:when test="head">
                                    <xsl:value-of select="head"/>
                                </xsl:when>
                                <xsl:otherwise>File Plan</xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </dt>
                </xsl:for-each>

                <!-- Administrative Information  -->
                <xsl:if
                    test="/ead/archdesc/accessrestrict or
                    /ead/archdesc/userestrict or
                    /ead/archdesc/custodhist or
                    /ead/archdesc/accruals or
                    /ead/archdesc/altformavail or
                    /ead/archdesc/acqinfo or
                    /ead/archdesc/processinfo or
                    /ead/archdesc/appraisal or
                    /ead/archdesc/originalsloc or /ead/eadheader/filedesc/publicationstmt or /ead/eadheader/revisiondesc">
                    <dt>
                        <a href="#adminInfo">Administrative Information</a>
                    </dt>
                </xsl:if>

                <!-- Related Materials -->
                <xsl:if test="/ead/archdesc/relatedmaterial or /ead/archdesc/separatedmaterial">
                    <dt>
                        <a href="#relMat">Related Materials</a>
                    </dt>
                </xsl:if>
                <!--<xsl:for-each select="/ead/archdesc/controlaccess">
                    <dt>
                        <a>
                            <xsl:call-template name="tocLinks"/>
                            <xsl:choose>
                                <xsl:when test="head">
                                    <xsl:value-of select="head"/>
                                </xsl:when>
                                <xsl:otherwise>Controlled Access Headings</xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </dt>
                </xsl:for-each>-->
                <xsl:for-each select="/ead/archdesc/otherfindaid">
                    <dt>
                        <a>
                            <xsl:call-template name="tocLinks"/>
                            <xsl:choose>
                                <xsl:when test="head">
                                    <xsl:value-of select="head"/>
                                </xsl:when>
                                <xsl:otherwise>Other Finding Aids</xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </dt>
                </xsl:for-each>
                <xsl:for-each select="/ead/archdesc/phystech">
                    <dt>
                        <a>
                            <xsl:call-template name="tocLinks"/>
                            <xsl:choose>
                                <xsl:when test="head">
                                    <xsl:value-of select="head"/>
                                </xsl:when>
                                <xsl:otherwise>Technical Requirements</xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </dt>
                </xsl:for-each>
                <xsl:for-each select="/ead/archdesc/odd">
                    <dt>
                        <a>
                            <xsl:call-template name="tocLinks"/>
                            <xsl:choose>
                                <xsl:when test="head">
                                    <xsl:value-of select="head"/>
                                </xsl:when>
                                <xsl:otherwise>Other Descriptive Data</xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </dt>
                </xsl:for-each>
                <xsl:for-each select="/ead/archdesc/bibliography">
                    <dt>
                        <a>
                            <xsl:call-template name="tocLinks"/>
                            <xsl:choose>
                                <xsl:when test="head">
                                    <xsl:value-of select="head"/>
                                </xsl:when>
                                <xsl:otherwise>Bibliography</xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </dt>
                </xsl:for-each>
                <xsl:for-each select="/ead/archdesc/index">
                    <dt>
                        <a>
                            <xsl:call-template name="tocLinks"/>
                            <xsl:choose>
                                <xsl:when test="head">
                                    <xsl:value-of select="head"/>
                                </xsl:when>
                                <xsl:otherwise>Index</xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </dt>
                </xsl:for-each>
                <xsl:for-each select="/ead/archdesc/dsc">
                    <xsl:if test="child::*">
                        <dt>
                            <a>
                                <xsl:call-template name="tocLinks"/>
                                <xsl:choose>
                                    <xsl:when test="head">
                                        <xsl:value-of select="head"/>
                                    </xsl:when>
                                    <xsl:otherwise>Collection Inventory</xsl:otherwise>
                                </xsl:choose>
                            </a>
                        </dt>
                    </xsl:if>
                    <!--Creates a submenu for collections, record groups and series and fonds-->
                    <xsl:for-each
                        select="child::*[@level = 'collection'] 
                        | child::*[@level = 'recordgrp']  | child::*[@level = 'series'] | child::*[@level = 'fonds']">
                        <dd>
                            <a><xsl:call-template name="tocLinks"/>
                                <xsl:choose>
                                    <xsl:when test="head">
                                        <xsl:apply-templates select="child::*/head"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="child::*/unitid">
                                                <xsl:text>Series</xsl:text>
                                                <xsl:apply-templates select="child::*/unitid"/>
                                                <xsl:text>:&#160;</xsl:text>
                                                <xsl:apply-templates select="child::*/unittitle"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:apply-templates select="child::*/unittitle"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose></a>
                        </dd>
                    </xsl:for-each>
                </xsl:for-each>
            </dl>
            <h3>Additional Resources</h3>
            <dl>
                <dt>
                    <a href="http://www.libraries.psu.edu/psul/speccolls/search.html">Search All
                        Collections</a>
                </dt>
                <dt>
                    <a href="http://www.libraries.psu.edu/findingaids/finaidaz.html"
                        >Browse Collections A-Z</a>
                </dt>
                <dt>
                    <a href="http://www.libraries.psu.edu/psul/speccolls.html">Contact Special
                        Collections</a>
                </dt>
            </dl>
        </div>
    </xsl:template>

    <!-- Named template for a generic p element with a link back to the table of contents  -->
    <xsl:template name="returnTOC">
        <p class="returnTOC">
            <a href="#toc">Return to Table of Contents</a>
        </p>
        <hr/>
    </xsl:template>
    <xsl:template match="eadheader">
        <h2 id="{generate-id(filedesc/titlestmt/titleproper)}">
            <xsl:apply-templates select="filedesc/titlestmt/titleproper"/>
        </h2>
        <!--<xsl:if test="filedesc/titlestmt/subtitle">
            <h2>
                <xsl:apply-templates select="filedesc/titlestmt/subtitle"/>
            </h2>
        </xsl:if>-->
    </xsl:template>
    <xsl:template match="filedesc/titlestmt/titleproper">
        <xsl:choose>
            <xsl:when test="@type = 'filing'">
                <xsl:choose>
                    <xsl:when test="count(parent::*/titleproper) &gt; 1"/>
                    <xsl:otherwise>
                        <xsl:value-of select="/ead/archdesc/did/unittitle"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="filedesc/titlestmt/titleproper/num">
        <br/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="filedesc/titlestmt/titleproper/date">
        <br/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="archdesc/did">
        <h3>
            <a name="{generate-id(.)}">
                <xsl:choose>
                    <xsl:when test="head">
                        <xsl:value-of select="head"/>
                    </xsl:when>
                    <xsl:otherwise>Collection Overview</xsl:otherwise>
                </xsl:choose>
            </a>
        </h3>
        <!-- Determines the order in wich elements from the archdesc did appear, 
            to change the order of appearance for the children of did
            by changing the order of the following statements.-->
        <!--<dl class="summary">
            <xsl:apply-templates select="repository"/>
            <xsl:apply-templates select="origination"/>
            <xsl:apply-templates select="unittitle"/>
            <xsl:apply-templates select="unitid"/>
            <xsl:apply-templates select="unitdate"/>
            <xsl:apply-templates select="physdesc"/>
            <xsl:apply-templates select="physloc"/>
            <xsl:apply-templates select="langmaterial"/>
            <xsl:apply-templates select="materialspec"/>
            <xsl:apply-templates select="container"/>
            <xsl:apply-templates select="abstract"/>
            <xsl:apply-templates select="note"/>
        </dl>
        <xsl:apply-templates select="../prefercite"/>-->

        <table width="100%" class="summary">
            <tr>
                <!--<td width="5%"/>-->
                <td width="20%"/>
                <td width="75%"/>
            </tr>
            <!--<tr>
					<td colspan="2">
						<xsl:choose>
							<xsl:when test="@id">
								<h3>
									<a name="{@id}">
										<xsl:value-of select="head"/>
									</a>
								</h3>
							</xsl:when>
							<xsl:otherwise>
								<h3>
									<a name="{generate-id()}">
										<xsl:value-of select="head"/>
									</a>
								</h3>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>-->
            <xsl:for-each select="unittitle">
                <!-- Title of the archive -->
                <!--<xsl:choose>
                    <xsl:when test="@label">
                        <tr>
                            <td/>
                            <td>
                                <b>
                                    <xsl:value-of select="@label"/>: </b>
                            </td>
                            <td>
                                <xsl:value-of select="text()|*[*!='unitdate']"/>
                            </td>
                        </tr>
                    </xsl:when>
                    <xsl:otherwise>-->
                <xsl:if test="text()">
                    <tr>
                        <!--<td/>-->
                        <td>
                            <div class="bold">Title:</div>
                        </td>
                        <td>
                            <xsl:value-of select="text()|*[*!='unitdate']"/>
                        </td>
                    </tr>
                </xsl:if>
                <!--</xsl:otherwise>
                </xsl:choose>-->
                <xsl:for-each select="unitdate">
                    <!--[string-length(text())!=0]">-->
                    <xsl:if test="@type='inclusive'">
                        <xsl:choose>
                            <!--This code processes the elements when unitdate is a child of unittitle.-->
                            <xsl:when test="unittitle/unitdate">
                                <xsl:apply-templates select="unittitle"/>
                                <tr>
                                    <!--<td/>-->
                                    <td>
                                        <div class="bold"> Dates: </div>
                                    </td>
                                    <td>
                                        <xsl:value-of select="unittitle/unitdate"/>
                                    </td>
                                </tr>
                            </xsl:when>
                            <!--This code process the elements when unitdate is not a child of untititle-->
                            <xsl:otherwise>
                                <xsl:apply-templates select="unittitle"/>
                                <xsl:text>,&#160;</xsl:text>
                                <xsl:for-each select="unitdate[not(self::unitdate[@type='bulk'])]">
                                    <xsl:apply-templates/>
                                    <xsl:text>&#160;</xsl:text>
                                </xsl:for-each>
                                <xsl:for-each select="unitdate[@type = 'bulk']">
                                    (<xsl:apply-templates/>) </xsl:for-each>
                                <tr>
                                    <!--<td/>-->
                                    <td>
                                        <div class="bold">Dates: </div>
                                    </td>
                                    <td>
                                        <xsl:value-of select="unitdate"/>
                                    </td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!--<xsl:choose>
								<xsl:when test="unitdate/@label">
									<tr>
										<td/>
										<td>
											<b>
												<xsl:value-of select="unitdate/@label"/>:
											</b>
										</td>
										<td>
											<xsl:value-of select="unitdate"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>-->
                        <tr>
                            <!--<td/>-->
                            <td>
                                <div class="bold">Dates (Inclusive):</div>
                            </td>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                        </tr>
                        <!--</xsl:otherwise>
							</xsl:choose>-->
                    </xsl:if>
                    <xsl:if test="@type='bulk'">
                        <!--<xsl:choose>
                            <xsl:when test="unitdate/@label">
                                <tr>
                                    <td/>
                                    <td>
                                        <b>
                                            <xsl:value-of select="unitdate/@label"/>: </b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="unitdate"/>
                                    </td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>-->
                        <tr>
                            <!--<td/>-->
                            <td>
                                <div class="bold">Dates (Bulk):</div>
                            </td>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                        </tr>
                        <!--</xsl:otherwise>
                        </xsl:choose>-->
                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:if test="unitdate[string-length(text()|*)!=0]">
                <xsl:for-each select="unitdate">
                    <xsl:choose>
                        <xsl:when test="@type='inclusive'">
                            <tr>
                                <!--<td/>-->
                                <td>
                                    <div class="bold">Dates (Inclusive):</div>
                                </td>
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:when>
                        <xsl:when test="@type='bulk'">
                            <tr>
                                <!--<td/>-->
                                <td>
                                    <div class="bold">Dates (Bulk):</div>
                                </td>
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:when>
                        <xsl:otherwise>
                            <tr>
                                <!--<td/>-->
                                <td>
                                    <div class="bold">Dates:</div>
                                </td>
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="origination[string-length(text()|*)!=0]">
                <!-- Information about the creator/collector/dealer -->
                <xsl:for-each select="origination">
                    <!--<xsl:choose>
							<xsl:when test="@label">
								<tr>
									<td/>
									<td>
										<b>
											<xsl:value-of select="@label"/>:
										</b>
									</td>
									<td>
										<xsl:value-of select="."/>
									</td>
								</tr>
							</xsl:when>
							<xsl:otherwise>-->
                    <tr>
                        <!--<td/>-->
                        <td>
                            <div class="bold">Creator:</div>
                        </td>
                        <td>
                            <xsl:value-of select="."/>
                        </td>
                    </tr>
                    <!--</xsl:otherwise>
						</xsl:choose>-->
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="abstract[string-length(text()|*)!=0]">
                <!-- Information about the archive in brief -->
                <xsl:for-each select="abstract">
                    <!--<xsl:choose>
						<xsl:when test="abstract/@label">
							<tr>
								<td/>
								<td valign="top">
									<b>
										<xsl:value-of select="abstract/@label"/>:
									</b>
								</td>
								<td valign="top">
									<xsl:value-of select="abstract"/>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>-->
                    <tr>
                        <!--<td/>-->
                        <td valign="top">
                            <div class="bold">Abstract:</div>
                        </td>
                        <td valign="top">
                            <xsl:value-of select="."/>
                        </td>
                    </tr>
                    <!--</xsl:otherwise>
					</xsl:choose>-->
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="unitid[string-length(text()|*)!=0]">
                <!-- Archive Identifier -->
                <!--<xsl:choose>
						<xsl:when test="unitid/@label">
							<tr>
								<td/>
								<td>
									<b>
										<xsl:value-of select="unitid/@label"/>:
									</b>
								</td>
								<td>
									<xsl:value-of select="unitid"/>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>-->
                <tr>
                    <!--<td/>-->
                    <td>
                        <div class="bold">Collection Number:</div>
                    </td>
                    <td>
                        <xsl:value-of select="unitid"/>
                    </td>
                </tr>
                <!--</xsl:otherwise>
					</xsl:choose>-->
            </xsl:if>
            <!--<xsl:if test="physdesc[string-length(text()|*)!=0]">-->
            <!-- Information about the physical dimension of the archival object -->
            <!--<xsl:choose>
						<xsl:when test="physdesc/@label">
							<tr>
								<td/>
								<td>
									<b>
										<xsl:value-of select="physdesc/@label"/>:
									</b>
								</td>
								<td>
									<xsl:apply-templates select="physdesc"/>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>
                <tr>
                    <td/>
                    <td>
                        <div class="bold">Size:</div>
                    </td>
                    <td>
                        <<xsl:apply-templates select="physdesc"/>
                        <xsl:value-of select="."/>
                    </td>
                </tr>
                </xsl:otherwise>
					</xsl:choose>
            </xsl:if>-->
            <xsl:if test="physdesc[string-length(text()|*)!=0]">
                <!-- Information about the archive in brief -->
                <xsl:for-each select="physdesc/extent">
                    <!--<xsl:choose>
						<xsl:when test="physdesc/@label">
							<tr>
								<td/>
								<td valign="top">
									<b>
										<xsl:value-of select="physdesc/@label"/>:
									</b>
								</td>
								<td valign="top">
									<xsl:value-of select="physdesc"/>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>-->
                    <tr>
                        <!--<td/>-->
                        <td valign="top">
                            <div class="bold">Size:</div>
                        </td>
                        <td valign="top">
                            <xsl:value-of select="."/>
                        </td>
                    </tr>
                    <!--</xsl:otherwise>
					</xsl:choose>-->
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="physloc[string-length(text()|*)!=0]">
                <!-- Information about the physical location of the archive, where it is available -->
                <!--<xsl:choose>
						<xsl:when test="physloc/@label">
							<tr>
								<td/>
								<td valign="top">
									<b>
										<xsl:value-of select="physloc/@label"/>:
									</b>
								</td>
								<td>
									<xsl:value-of select="physloc"/>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>-->
                <tr>
                    <!--<td/>-->
                    <td valign="top">
                        <div class="bold">Location:</div>
                    </td>
                     <td><xsl:value-of select="physloc"/>&#160;
                       </td>
                </tr>
                <!--</xsl:otherwise>
					</xsl:choose>-->
            </xsl:if>
            <xsl:if test="repository[string-length(text()|*)!=0]">
                <!-- Information about the institution/agency which can give access to the archive -->
                <xsl:for-each select="repository">
                    <!--<xsl:choose>
							<xsl:when test="@label">
								<tr>
									<td/>
									<td>
										<b>
											<xsl:value-of select="@label"/>:
										</b>
									</td>
									<td>
										<xsl:apply-templates select="*"/>
									</td>
								</tr>
							</xsl:when>
							<xsl:otherwise>-->
                    <!--<td/>-->
                    <td>
                        <div class="bold">Repository:</div>
                    </td>
                    <td>
                        <!--<xsl:apply-templates select="*"/>--><a
                            href="http://www.libraries.psu.edu/psul/speccolls.html">Special
                            Collections Library. Pennsylvania State University</a>.</td>
                    <!--</xsl:otherwise>
						</xsl:choose>-->
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="langmaterial[string-length(text()|*)!=0]">
                <!-- Information about the language/s of the material-->
                <xsl:for-each select="langmaterial">
                    <!--<xsl:choose>
							<xsl:when test="@label">
								<tr>
									<td/>
									<td>
										<b>
											<xsl:value-of select="@label"/>:
										</b>
									</td>
									<td>
										<xsl:apply-templates select="*"/>
									</td>
								</tr>
							</xsl:when>
							<xsl:otherwise>-->
                    <tr>
                        <!--<td/>-->
                        <td>
                            <div class="bold">Languages:</div>
                        </td>
                        <td>
                            <xsl:apply-templates select="*"/>
                        </td>
                    </tr>
                    <!--</xsl:otherwise>
						</xsl:choose>-->
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="note[string-length(text()|*)!=0]">
                <!-- A short statement describing some aspect of the archive -->
                <xsl:for-each select="note">
                    <xsl:choose>
                        <xsl:when test="@label">
                            <tr>
                                <!--<td/>-->
                                <td>
                                    <em>
                                        <xsl:value-of select="@label"/>: </em>
                                </td>
                            </tr>
                            <xsl:for-each select="p">
                                <tr>
                                    <!--<td/>-->
                                    <td>
                                        <xsl:apply-templates/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <tr>
                                <!--<td/>-->
                                <td>
                                    <div class="bold">Location:</div>
                                </td>
                                <td>
                                    <xsl:value-of select="note"/>
                                </td>
                            </tr>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:if>
        </table>
        <hr/>
        <!--<xsl:call-template name="returnTOC"/>-->
    </xsl:template>



    <!-- Template calls and formats the children of archdesc/did -->
    <xsl:template
        match="archdesc/did/repository | archdesc/did/unittitle | archdesc/did/unitid | archdesc/did/origination 
        | archdesc/did/unitdate | archdesc/did/physdesc | archdesc/did/physloc 
        | archdesc/did/abstract | archdesc/did/langmaterial | archdesc/did/materialspec | archdesc/did/container">
        <dt>
            <xsl:choose>
                <xsl:when test="@label">
                    <xsl:value-of
                        select="concat(translate( substring(@label, 1, 1 ),
                        'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' ), 
                        substring(@label, 2, string-length(@label )))"/>
                    <xsl:if test="@type"> [<xsl:value-of select="@type"/>]</xsl:if>
                    <xsl:if test="self::origination">
                        <xsl:choose>
                            <xsl:when test="persname[@role != ''] and contains(persname/@role,' (')"
                                > - <xsl:value-of select="substring-before(persname/@role,' (')"/>
                            </xsl:when>
                            <xsl:when test="persname[@role != '']"> - <xsl:value-of
                                    select="persname/@role"/>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="self::repository">Repository</xsl:when>
                        <xsl:when test="self::unittitle">Title</xsl:when>
                        <xsl:when test="self::unitid">ID</xsl:when>
                        <xsl:when test="self::unitdate">Date<xsl:if test="@type"> [<xsl:value-of
                                    select="@type"/>]</xsl:if></xsl:when>
                        <xsl:when test="self::origination">
                            <xsl:choose>
                                <xsl:when
                                    test="persname[@role != ''] and contains(persname/@role,' (')">
                                    Creator - <xsl:value-of
                                        select="substring-before(persname/@role,' (')"/>
                                </xsl:when>
                                <xsl:when test="persname[@role != '']"> Creator - <xsl:value-of
                                        select="persname/@role"/>
                                </xsl:when>
                                <xsl:otherwise> Creator </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when test="self::physdesc">Extent</xsl:when>
                        <xsl:when test="self::abstract">Abstract</xsl:when>
                        <xsl:when test="self::physloc">Location</xsl:when>
                        <xsl:when test="self::langmaterial">Language</xsl:when>
                        <xsl:when test="self::materialspec">Technical</xsl:when>
                        <xsl:when test="self::container">Container</xsl:when>
                        <xsl:when test="self::note">Note</xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </dt>
        <dd>
            <xsl:apply-templates/>
        </dd>
    </xsl:template>
    <!-- Template calls and formats all other children of archdesc many of 
        these elements are repeatable within the dsc section as well.-->
    <xsl:template
        match="bibliography | odd | accruals | arrangement  | bioghist 
        | userestrict  | custodhist | altformavail | originalsloc 
        | fileplan | acqinfo | otherfindaid | phystech | processinfo | relatedmaterial
        | separatedmaterial | appraisal">
        <xsl:choose>
            <xsl:when test="head">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="parent::archdesc">
                        <xsl:choose>
                            <xsl:when test="self::bibliography">
                                <h3><xsl:call-template name="anchor"/>Bibliography</h3>
                            </xsl:when>
                            <xsl:when test="self::odd">
                                <h3><xsl:call-template name="anchor"/>Other Descriptive Data</h3>
                            </xsl:when>
                            <xsl:when test="self::accruals">
                                <h4><xsl:call-template name="anchor"/>Accruals</h4>
                            </xsl:when>
                            <xsl:when test="self::arrangement">
                                <h3><xsl:call-template name="anchor"/>Arrangement of Collection</h3>
                            </xsl:when>
                            <xsl:when test="self::bioghist">
                                <h3><xsl:call-template name="anchor"/>Biographical or Historical
                                    Information</h3>
                            </xsl:when>

                            <xsl:when test="self::userestrict">
                                <h4><xsl:call-template name="anchor"/>Restrictions on Use</h4>
                            </xsl:when>
                            <xsl:when test="self::custodhist">
                                <h4><xsl:call-template name="anchor"/>Custodial History</h4>
                            </xsl:when>
                            <xsl:when test="self::altformavail">
                                <h4><xsl:call-template name="anchor"/>Alternative Form
                                    Available</h4>
                            </xsl:when>
                            <xsl:when test="self::originalsloc">
                                <h4><xsl:call-template name="anchor"/>Original Location</h4>
                            </xsl:when>
                            <xsl:when test="self::fileplan">
                                <h3><xsl:call-template name="anchor"/>File Plan</h3>
                            </xsl:when>
                            <xsl:when test="self::acqinfo">
                                <h4><xsl:call-template name="anchor"/>Acquisition Information</h4>
                            </xsl:when>
                            <xsl:when test="self::otherfindaid">
                                <h3><xsl:call-template name="anchor"/>Other Finding Aids</h3>
                            </xsl:when>
                            <xsl:when test="self::phystech">
                                <h3><xsl:call-template name="anchor"/>Physical Characteristics and
                                    Technical Requirements</h3>
                            </xsl:when>
                            <xsl:when test="self::processinfo">
                                <h4><xsl:call-template name="anchor"/>Processing Information</h4>
                            </xsl:when>
                            <xsl:when test="self::relatedmaterial">
                                <h4><xsl:call-template name="anchor"/>Related Material</h4>
                            </xsl:when>

                            <xsl:when test="self::separatedmaterial">
                                <h4><xsl:call-template name="anchor"/>Separated Material</h4>
                            </xsl:when>
                            <xsl:when test="self::appraisal">
                                <h4><xsl:call-template name="anchor"/>Appraisal</h4>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <h4>
                            <xsl:call-template name="anchor"/>
                            <xsl:choose>
                                <xsl:when test="self::bibliography">Bibliography</xsl:when>
                                <xsl:when test="self::odd">Other Descriptive Data</xsl:when>
                                <xsl:when test="self::accruals">Accruals</xsl:when>
                                <xsl:when test="self::arrangement">Arrangement</xsl:when>
                                <xsl:when test="self::bioghist">Biographical or Historical
                                    Information</xsl:when>

                                <xsl:when test="self::userestrict">Restrictions on Use</xsl:when>
                                <xsl:when test="self::custodhist">Custodial History</xsl:when>
                                <xsl:when test="self::altformavail">Alternative Form
                                    Available</xsl:when>
                                <xsl:when test="self::originalsloc">Original Location</xsl:when>
                                <xsl:when test="self::fileplan">File Plan</xsl:when>
                                <xsl:when test="self::acqinfo">Acquisition Information</xsl:when>
                                <xsl:when test="self::otherfindaid">Other Finding Aids</xsl:when>
                                <xsl:when test="self::phystech">Physical Characteristics and
                                    Technical Requirements</xsl:when>
                                <xsl:when test="self::processinfo">Processing Information</xsl:when>
                                <xsl:when test="self::relatedmaterial">Related Material</xsl:when>

                                <xsl:when test="self::separatedmaterial">Separated
                                    Material</xsl:when>
                                <xsl:when test="self::appraisal">Appraisal</xsl:when>
                            </xsl:choose>
                        </h4>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
        <!-- If the element is a child of arcdesc then a link to the table of contents is included -->
        <xsl:if test="parent::archdesc">
            <xsl:choose>
                <xsl:when
                    test="self::userestrict or
                    self::custodhist or self::accruals or
                    self::altformavail or self::acqinfo or
                    self::processinfo or self::appraisal or
                    self::originalsloc or  
                    self::relatedmaterial or self::separatedmaterial or self::prefercite"/>
                <xsl:otherwise>
                    <xsl:call-template name="returnTOC"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template match="accessrestrict | scopecontent">
        <xsl:choose>
            <xsl:when test="head">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="parent::archdesc">
                        <xsl:choose>

                            <xsl:when test="self::accessrestrict">
                                <p><xsl:call-template name="anchor"/>Restrictions on Access</p>
                            </xsl:when>

                            <xsl:when test="self::scopecontent">
                                <p><xsl:call-template name="anchor"/>Scope &amp; Content</p>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <p class="hide">
                            <xsl:call-template name="anchor"/>
                            <xsl:choose>

                                <xsl:when test="self::accessrestrict"> Restrictions on Access </xsl:when>

                                <xsl:when test="self::scopecontent">Scope and Content</xsl:when>

                            </xsl:choose>
                        </p>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
        <!-- If the element is a child of arcdesc then a link to the table of contents is included -->
        <xsl:if test="parent::archdesc">
            <xsl:choose>
                <xsl:when
                    test="self::accessrestrict or self::userestrict or
                    self::custodhist or self::accruals or
                    self::altformavail or self::acqinfo or
                    self::processinfo or self::appraisal or
                    self::originalsloc or  
                    self::relatedmaterial or self::separatedmaterial or self::prefercite"/>
                <xsl:otherwise>
                    <xsl:call-template name="returnTOC"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>





    <!-- Templates for publication information  -->
    <xsl:template match="/ead/eadheader/filedesc/publicationstmt">
        <!--<h4>Publication Information</h4>
        <p>
            <xsl:apply-templates select="publisher"/>
            <xsl:if test="date">&#160;<xsl:apply-templates select="date"/></xsl:if>
        </p>
        <xsl:if test="address">
            <xsl:apply-templates select="address"/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="address">
        <p>
            <xsl:for-each select="addressline">
                <xsl:apply-templates select="."/>
                <br/>
            </xsl:for-each>
        </p>-->
    </xsl:template>
    <!-- Templates for revision description  -->
    <xsl:template match="/ead/eadheader/revisiondesc">
        <h4>Revision Description</h4>
        <p>
            <xsl:if test="change/item">
                <xsl:apply-templates select="change/item"/>
            </xsl:if>
            <xsl:if test="change/date">&#160;<xsl:apply-templates select="change/date"/></xsl:if>
        </p>
    </xsl:template>

    <!-- Formats controlled access terms -->
    <!--<xsl:template match="controlaccess">
        <xsl:choose>
            <xsl:when test="head">
                <xsl:apply-templates select="head"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="parent::archdesc">
                        <h3><xsl:call-template name="anchor"/>Controlled Access Headings</h3>
                    </xsl:when>
                    <xsl:otherwise>
                        <h4>Controlled Access Headings</h4>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="corpname">
            <h4>Corporate Name(s)</h4>
            <ul>
                <xsl:for-each select="corpname">
                    <li>
                        <xsl:apply-templates/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="famname">
            <h4>Family Name(s)</h4>
            <ul>
                <xsl:for-each select="famname">
                    <li>
                        <xsl:apply-templates/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="function">
            <h4>Function(s)</h4>
            <ul>
                <xsl:for-each select="function">
                    <li>
                        <xsl:apply-templates/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="genreform">
            <h4>Genre(s)</h4>
            <ul>
                <xsl:for-each select="genreform">
                    <li>
                        <xsl:apply-templates/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="geogname">
            <h4>Geographic Name(s)</h4>
            <ul>
                <xsl:for-each select="geogname">
                    <li>
                        <xsl:apply-templates/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="occupation">
            <h4>Occupation(s)</h4>
            <ul>
                <xsl:for-each select="occupation">
                    <li>
                        <xsl:apply-templates/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="persname">
            <h4>Personal Name(s)</h4>
            <ul>
                <xsl:for-each select="persname">
                    <li>
                        <xsl:apply-templates/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="subject">
            <h4>Subject(s)</h4>
            <ul>
                <xsl:for-each select="subject">
                    <li>
                        <xsl:apply-templates/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="parent::archdesc">
            <xsl:call-template name="returnTOC"/>
        </xsl:if>
    </xsl:template>-->

    <!-- Formats index and child elements, groups indexentry elements by type (i.e. corpname, subject...)-->
    <xsl:template match="index">
        <xsl:choose>
            <xsl:when test="head"/>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="parent::archdesc">
                        <h3><xsl:call-template name="anchor"/>Index</h3>
                    </xsl:when>
                    <xsl:otherwise>
                        <h4><xsl:call-template name="anchor"/>Index</h4>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="child::*[not(self::indexentry)]"/>
        <xsl:if test="indexentry/corpname">
            <h4>Corporate Name(s)</h4>
            <ul>
                <xsl:for-each select="indexentry/corpname">
                    <xsl:sort/>
                    <li><xsl:apply-templates select="."/>: &#160;<xsl:apply-templates
                            select="following-sibling::*"/></li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="indexentry/famname">
            <h4>Family Name(s)</h4>
            <ul>
                <xsl:for-each select="indexentry/famname">
                    <xsl:sort/>
                    <li><xsl:apply-templates select="."/>: &#160;<xsl:apply-templates
                            select="following-sibling::*"/></li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="indexentry/function">
            <h4>Function(s)</h4>
            <ul>
                <xsl:for-each select="indexentry/function">
                    <xsl:sort/>
                    <li><xsl:apply-templates select="."/>: &#160;<xsl:apply-templates
                            select="following-sibling::*"/></li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="indexentry/genreform">
            <h4>Genre(s)</h4>
            <ul>
                <xsl:for-each select="indexentry/genreform">
                    <xsl:sort/>
                    <li><xsl:apply-templates select="."/>: &#160;<xsl:apply-templates
                            select="following-sibling::*"/></li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="indexentry/geogname">
            <h4>Geographic Name(s)</h4>
            <ul>
                <xsl:for-each select="indexentry/geogname">
                    <xsl:sort/>
                    <li><xsl:apply-templates select="."/>: &#160;<xsl:apply-templates
                            select="following-sibling::*"/></li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="indexentry/name">
            <h4>Name(s)</h4>
            <ul>
                <xsl:for-each select="indexentry/name">
                    <xsl:sort/>
                    <li><xsl:apply-templates select="."/>: &#160;<xsl:apply-templates
                            select="following-sibling::*"/></li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="indexentry/occupation">
            <h4>Occupation(s)</h4>
            <ul>
                <xsl:for-each select="indexentry/occupation">
                    <xsl:sort/>
                    <li><xsl:apply-templates select="."/>: &#160;<xsl:apply-templates
                            select="following-sibling::*"/></li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="indexentry/persname">
            <h4>Personal Name(s)</h4>
            <ul>
                <xsl:for-each select="indexentry/persname">
                    <xsl:sort/>
                    <li><xsl:apply-templates select="."/>: &#160;<xsl:apply-templates
                            select="following-sibling::*"/></li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="indexentry/subject">
            <h4>Subject(s)</h4>
            <ul>
                <xsl:for-each select="indexentry/subject">
                    <xsl:sort/>
                    <li><xsl:apply-templates select="."/>: &#160;<xsl:apply-templates
                            select="following-sibling::*"/></li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="indexentry/title">
            <h4>Title(s)</h4>
            <ul>
                <xsl:for-each select="indexentry/title">
                    <xsl:sort/>
                    <li><xsl:apply-templates select="."/>: &#160;<xsl:apply-templates
                            select="following-sibling::*"/></li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="parent::archdesc">
            <xsl:call-template name="returnTOC"/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="indexentry">
        <dl class="indexEntry">
            <dt>
                <xsl:apply-templates select="child::*[1]"/>
            </dt>
            <dd>
                <xsl:apply-templates select="child::*[2]"/>
            </dd>
        </dl>
    </xsl:template>
    <xsl:template match="ptrgrp">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Linking elements. -->
    <xsl:template match="ptr">
        <xsl:choose>
            <xsl:when test="@target">
                <a href="#{@target}">
                    <xsl:value-of select="@target"/>
                </a>
                <xsl:if test="following-sibling::ptr">, </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="ref">
        <xsl:choose>
            <xsl:when test="@target">
                <a href="#{@target}">
                    <xsl:apply-templates/>
                </a>
                <xsl:if test="following-sibling::ref">, </xsl:if>
            </xsl:when>
            <xsl:when test="@ns2:href">
                <a href="#{@ns2:href}">
                    <xsl:apply-templates/>
                </a>
                <xsl:if test="following-sibling::ref">, </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="extptr">
        <xsl:choose>
            <xsl:when test="@href">
                <a href="{@href}">
                    <xsl:value-of select="@title"/>
                </a>
            </xsl:when>
            <xsl:when test="@ns2:href">
                <a href="{@ns2:href}">
                    <xsl:value-of select="@title"/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="@title"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="extref">
        <xsl:choose>
            <xsl:when test="@href">
                <a href="{@href}">
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:when test="@ns2:href">
                <a href="{@ns2:href}">
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--Creates a hidden anchor tag that allows navigation within the finding aid. 
    In this stylesheet only children of the archdesc and c0* itmes call this template. 
    It can be applied anywhere in the stylesheet as the id attribute is universal. -->
    <xsl:template match="@id">
        <xsl:attribute name="id">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    <xsl:template name="anchor">
        <xsl:choose>
            <xsl:when test="@id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="id">
                    <xsl:value-of select="generate-id(.)"/>
                </xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="tocLinks">
        <xsl:choose>
            <xsl:when test="self::*/@id">
                <xsl:attribute name="href">#<xsl:value-of select="@id"/></xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="href">#<xsl:value-of select="generate-id(.)"/></xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--Bibref, choose statement decides if the citation is inline, if there is a parent element
    or if it is its own line, typically when it is a child of the bibliography element.-->
    <xsl:template match="bibref">
        <xsl:choose>
            <xsl:when test="parent::p">
                <xsl:choose>
                    <xsl:when test="@ns2:href">
                        <a href="{@ns2:href}">
                            <xsl:apply-templates/>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:choose>
                        <xsl:when test="@ns2:href">
                            <a href="{@ns2:href}">
                                <xsl:apply-templates/>
                            </a>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates/>
                        </xsl:otherwise>
                    </xsl:choose>
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Formats prefered citation -->
    <xsl:template match="prefercite">
        <!--<div class="citation">-->
        <xsl:choose>
            <xsl:when test="head">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <h4>Preferred Citation</h4>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
        <!--</div>-->
    </xsl:template>

    <!-- Applies a span style to address elements, currently addresses are displayed 
        as a block item, display can be changed to inline, by changing the CSS -->
    <xsl:template match="address">
        <span class="address">
            <xsl:for-each select="child::*">
                <xsl:apply-templates/>
                <xsl:choose>
                    <xsl:when test="lb"/>
                    <xsl:otherwise>
                        <br/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </span>
    </xsl:template>

    <!-- Formats headings throughout the finding aid -->
    <xsl:template match="head[parent::*/parent::archdesc]">
        <xsl:choose>
            <xsl:when
                test="parent::accessrestrict or parent::userestrict or
                parent::custodhist or parent::accruals or
                parent::altformavail or parent::acqinfo or
                parent::processinfo or parent::appraisal or
                parent::originalsloc or  
                parent::relatedmaterial or parent::separatedmaterial or parent::prefercite">
                <h4>
                    <xsl:choose>
                        <xsl:when test="parent::*/@id">
                            <xsl:attribute name="id">
                                <xsl:value-of select="parent::*/@id"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="id">
                                <xsl:value-of select="generate-id(parent::*)"/>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:apply-templates/>
                </h4>
            </xsl:when>
            <xsl:otherwise>
                <h3>
                    <xsl:choose>
                        <xsl:when test="parent::*/@id">
                            <xsl:attribute name="id">
                                <xsl:value-of select="parent::*/@id"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="id">
                                <xsl:value-of select="generate-id(parent::*)"/>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:apply-templates/>
                </h3>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="head">
        <h4>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>

    <!-- Digital Archival Object -->
    <xsl:template match="daogrp">
        <xsl:choose>
            <xsl:when test="parent::archdesc">
                <h3>
                    <xsl:call-template name="anchor"/>
                    <xsl:choose>
                        <xsl:when test="@title">
                            <xsl:value-of select="@title"/>
                        </xsl:when>
                        <xsl:otherwise> Digital Archival Object </xsl:otherwise>
                    </xsl:choose>
                </h3>
            </xsl:when>
            <xsl:otherwise>
                <h4>
                    <xsl:call-template name="anchor"/>
                    <xsl:choose>
                        <xsl:when test="@title">
                            <xsl:value-of select="@title"/>
                        </xsl:when>
                        <xsl:otherwise> Digital Archival Object </xsl:otherwise>
                    </xsl:choose>
                </h4>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="dao">
        <xsl:choose>
            <xsl:when test="child::*">
                <xsl:apply-templates/>
                <a href="{@href}">[<xsl:value-of select="@href"/>]</a>
            </xsl:when>
            <xsl:otherwise>
                <a href="{@href}">
                    <xsl:value-of select="@href"/>
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="daoloc">
        <a href="{@href}">
            <xsl:value-of select="@title"/>
        </a>
    </xsl:template>

    <!--Formats a simple table. The width of each column is defined by the colwidth attribute in a colspec element.-->
    <xsl:template match="table">
        <xsl:for-each select="tgroup">
            <table>
                <tr>
                    <xsl:for-each select="colspec">
                        <td width="{@colwidth}"/>
                    </xsl:for-each>
                </tr>
                <xsl:for-each select="thead">
                    <xsl:for-each select="row">
                        <tr>
                            <xsl:for-each select="entry">
                                <td valign="top">
                                    <strong>
                                        <xsl:value-of select="."/>
                                    </strong>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:for-each select="tbody">
                    <xsl:for-each select="row">
                        <tr>
                            <xsl:for-each select="entry">
                                <td valign="top">
                                    <xsl:value-of select="."/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </xsl:for-each>
            </table>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="unitdate">
        <xsl:if test="preceding-sibling::*">&#160;</xsl:if>
        <xsl:choose>
            <xsl:when test="@type = 'bulk'"> (<xsl:apply-templates/>) </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="date">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="unittitle">
        <xsl:choose>
            <xsl:when test="child::unitdate[@type='bulk']">
                <xsl:apply-templates select="node()[not(self::unitdate[@type='bulk'])]"/>
                <xsl:apply-templates select="date[@type='bulk']"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- Following five templates output chronlist and children in a table -->
    <xsl:template match="chronlist">
        <table class="chronlist">
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    <xsl:template match="chronlist/listhead">
        <tr>
            <th>
                <xsl:apply-templates select="head01"/>
            </th>
            <th>
                <xsl:apply-templates select="head02"/>
            </th>
        </tr>
    </xsl:template>
    <xsl:template match="chronlist/head">
        <tr>
            <th colspan="2">
                <xsl:apply-templates/>
            </th>
        </tr>
    </xsl:template>
    <xsl:template match="chronitem">
        <tr>
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="(position() mod 2 = 0)">odd</xsl:when>
                    <xsl:otherwise>even</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <td>
                <xsl:apply-templates select="date"/>
            </td>
            <td>
                <xsl:apply-templates select="descendant::event"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="event">
        <xsl:choose>
            <xsl:when test="following-sibling::*">
                <xsl:apply-templates/>
                <br/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <!-- Output for a variety of list types -->
    <xsl:template match="list">
        <xsl:if test="head">
            <h4>
                <xsl:value-of select="head"/>
            </h4>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="descendant::defitem">
                <dl>
                    <xsl:apply-templates select="defitem"/>
                </dl>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@type = 'ordered'">
                        <ol>
                            <xsl:attribute name="class">
                                <xsl:value-of select="@numeration"/>
                            </xsl:attribute>
                            <xsl:apply-templates/>
                        </ol>
                    </xsl:when>
                    <xsl:when test="@numeration">
                        <ol>
                            <xsl:attribute name="class">
                                <xsl:value-of select="@numeration"/>
                            </xsl:attribute>
                            <xsl:apply-templates/>
                        </ol>
                    </xsl:when>
                    <xsl:when test="@type='simple'">
                        <ul>
                            <xsl:attribute name="class">simple</xsl:attribute>
                            <xsl:apply-templates select="child::*[not(head)]"/>
                        </ul>
                    </xsl:when>
                    <xsl:otherwise>
                        <ul>
                            <xsl:apply-templates/>
                        </ul>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="list/head"/>
    <xsl:template match="list/item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="defitem">
        <dt>
            <xsl:apply-templates select="label"/>
        </dt>
        <dd>
            <xsl:apply-templates select="item"/>
        </dd>
    </xsl:template>

    <!-- Formats list as table if list has listhead element  -->
    <xsl:template match="list[child::listhead]">
        <table>
            <tr>
                <th>
                    <xsl:value-of select="listhead/head01"/>
                </th>
                <th>
                    <xsl:value-of select="listhead/head02"/>
                </th>
            </tr>
            <xsl:for-each select="defitem">
                <tr>
                    <td>
                        <xsl:apply-templates select="label"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="item"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

    <!-- Formats notestmt and notes -->
    <xsl:template match="notestmt">
        <h4>Note</h4>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="note">
        <xsl:choose>
            <xsl:when test="parent::notestmt">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@label">
                        <h4>
                            <xsl:value-of select="@label"/>
                        </h4>
                        <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:otherwise>
                        <h4>Note</h4>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Child elements that should display as paragraphs-->
    <xsl:template match="legalstatus">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!-- Puts a space between sibling elements -->
    <xsl:template match="child::*">
        <xsl:if test="preceding-sibling::*">&#160;</xsl:if>
        <xsl:apply-templates/>
    </xsl:template>
    <!-- Generic text display elements -->
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="lb">
        <br/>
    </xsl:template>
    <xsl:template match="blockquote">
        <blockquote>
            <xsl:apply-templates/>
        </blockquote>
    </xsl:template>
    <xsl:template match="emph">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>

    <!--Render elements -->
    <xsl:template match="*[@render = 'bold'] | *[@altrender = 'bold'] ">
        <xsl:if test="preceding-sibling::*"> &#160;</xsl:if>
        <strong>
            <xsl:apply-templates/>
        </strong>
    </xsl:template>
    <xsl:template match="*[@render = 'bolddoublequote'] | *[@altrender = 'bolddoublequote']">
        <xsl:if test="preceding-sibling::*"> &#160;</xsl:if>
        <strong>"<xsl:apply-templates/>"</strong>
    </xsl:template>
    <xsl:template match="*[@render = 'boldsinglequote'] | *[@altrender = 'boldsinglequote']">
        <xsl:if test="preceding-sibling::*"> &#160;</xsl:if>
        <strong>'<xsl:apply-templates/>'</strong>
    </xsl:template>
    <xsl:template match="*[@render = 'bolditalic'] | *[@altrender = 'bolditalic']">
        <xsl:if test="preceding-sibling::*"> &#160;</xsl:if>
        <strong>
            <em>
                <xsl:apply-templates/>
            </em>
        </strong>
    </xsl:template>
    <xsl:template match="*[@render = 'boldsmcaps'] | *[@altrender = 'boldsmcaps']">
        <xsl:if test="preceding-sibling::*"> &#160;</xsl:if>
        <strong>
            <span class="smcaps">
                <xsl:apply-templates/>
            </span>
        </strong>
    </xsl:template>
    <xsl:template match="*[@render = 'boldunderline'] | *[@altrender = 'boldunderline']">
        <xsl:if test="preceding-sibling::*"> &#160;</xsl:if>
        <strong>
            <span class="underline">
                <xsl:apply-templates/>
            </span>
        </strong>
    </xsl:template>
    <xsl:template match="*[@render = 'doublequote'] | *[@altrender = 'doublequote']">
        <xsl:if test="preceding-sibling::*"> &#160;</xsl:if>"<xsl:apply-templates/>" </xsl:template>
    <xsl:template match="*[@render = 'italic'] | *[@altrender = 'italic']">
        <xsl:if test="preceding-sibling::*"> &#160;</xsl:if>
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    <xsl:template match="*[@render = 'singlequote'] | *[@altrender = 'singlequote']">
        <xsl:if test="preceding-sibling::*"> &#160;</xsl:if>'<xsl:apply-templates/>' </xsl:template>
    <xsl:template match="*[@render = 'smcaps'] | *[@altrender = 'smcaps']">
        <xsl:if test="preceding-sibling::*"> &#160;</xsl:if>
        <span class="smcaps">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="*[@render = 'sub'] | *[@altrender = 'sub']">
        <xsl:if test="preceding-sibling::*"> &#160;</xsl:if>
        <sub>
            <xsl:apply-templates/>
        </sub>
    </xsl:template>
    <xsl:template match="*[@render = 'super'] | *[@altrender = 'super']">
        <xsl:if test="preceding-sibling::*"> &#160;</xsl:if>
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>
    <xsl:template match="*[@render = 'underline'] | *[@altrender = 'underline']">
        <xsl:if test="preceding-sibling::*"> &#160;</xsl:if>
        <span class="underline">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <!-- 
        <value>nonproport</value>        
    -->

    <!-- *** Begin templates for Container List *** -->
    <xsl:template match="archdesc/dsc">
        <xsl:choose>
            <xsl:when test="head">
                <xsl:apply-templates select="head"/>
            </xsl:when>
            <xsl:otherwise>
                <h3><xsl:call-template name="anchor"/>Collection Inventory</h3>
            </xsl:otherwise>
        </xsl:choose>
        <!-- Creates a table for container lists, defaults to 5 cells, for up to 4 container lists.  -->
        <table class="containerList" cellpadding="0" cellspacing="0">
            <!-- Call children of dsc -->
            <xsl:apply-templates select="*[not(self::head)]"/>
            <tr>
                <td/>
                <td style="width: 15%;"/>
                <td style="width: 15%;"/>
                <td style="width: 15%;"/>
                <td style="width: 15%;"/>
            </tr>
        </table>
    </xsl:template>

    <!--This section of the stylesheet creates a div for each c01 or c 
        It then recursively processes each child component of the c01 by 
        calling the clevel template.
        Edited 5/31/12: Added parameter to indicate clevel margin, parameter is called by clevelMargin variable
    -->
    <xsl:template match="c">
        <xsl:call-template name="clevel">
            <xsl:with-param name="level">01</xsl:with-param>
        </xsl:call-template>
        <xsl:for-each select="c">
            <xsl:call-template name="clevel">
                <xsl:with-param name="level">02</xsl:with-param>
            </xsl:call-template>
            <xsl:for-each select="c">
                <xsl:call-template name="clevel">
                    <xsl:with-param name="level">03</xsl:with-param>
                </xsl:call-template>
                <xsl:for-each select="c">
                    <xsl:call-template name="clevel">
                        <xsl:with-param name="level">04</xsl:with-param>
                    </xsl:call-template>
                    <xsl:for-each select="c">
                        <xsl:call-template name="clevel">
                            <xsl:with-param name="level">05</xsl:with-param>
                        </xsl:call-template>
                        <xsl:for-each select="c">
                            <xsl:call-template name="clevel">
                                <xsl:with-param name="level">06</xsl:with-param>
                            </xsl:call-template>
                            <xsl:for-each select="c">
                                <xsl:call-template name="clevel">
                                    <xsl:with-param name="level">07</xsl:with-param>
                                </xsl:call-template>
                                <xsl:for-each select="c">
                                    <xsl:call-template name="clevel">
                                        <xsl:with-param name="level">08</xsl:with-param>
                                    </xsl:call-template>
                                    <xsl:for-each select="c">
                                        <xsl:call-template name="clevel">
                                            <xsl:with-param name="level">09</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
        <!-- ADDED 5/31/12: Return to top only after series -->
        <xsl:if test="self::*[@level='series']">
            <tr>
                <td colspan="5">
                    <xsl:call-template name="returnTOC"/>
                </td>
            </tr>
        </xsl:if>
    </xsl:template>
    <xsl:template match="c01">
        <xsl:call-template name="clevel"/>
        <xsl:for-each select="c02">
            <xsl:call-template name="clevel"/>
            <xsl:for-each select="c03">
                <xsl:call-template name="clevel"/>
                <xsl:for-each select="c04">
                    <xsl:call-template name="clevel"/>
                    <xsl:for-each select="c05">
                        <xsl:call-template name="clevel"/>
                        <xsl:for-each select="c06">
                            <xsl:call-template name="clevel"/>
                            <xsl:for-each select="c07">
                                <xsl:call-template name="clevel"/>
                                <xsl:for-each select="c08">
                                    <xsl:call-template name="clevel"/>
                                    <xsl:for-each select="c09">
                                        <xsl:call-template name="clevel"/>
                                        <xsl:for-each select="c10">
                                            <xsl:call-template name="clevel"/>
                                            <xsl:for-each select="c11">
                                                <xsl:call-template name="clevel"/>
                                                <xsl:for-each select="c12">
                                                  <xsl:call-template name="clevel"/>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
        <!-- ADDED 5/31/12: Return to top only after series -->
        <xsl:if test="self::*[@level='series']">
            <tr>
                <td colspan="5">
                    <xsl:call-template name="returnTOC"/>
                </td>
            </tr>
        </xsl:if>

    </xsl:template>

    <!--This is a named template that processes all c0* elements  -->
    <xsl:template name="clevel">
        <!-- Establishes which level is being processed in order to provided indented displays. 
        Indents handled by CSS margins-->
        <xsl:param name="level"/>
        <xsl:variable name="clevelMargin">
            <xsl:choose>
                <xsl:when test="$level = 01">c01</xsl:when>
                <xsl:when test="$level = 02">c02</xsl:when>
                <xsl:when test="$level = 03">c03</xsl:when>
                <xsl:when test="$level = 04">c04</xsl:when>
                <xsl:when test="$level = 05">c05</xsl:when>
                <xsl:when test="$level = 06">c06</xsl:when>
                <xsl:when test="$level = 07">c07</xsl:when>
                <xsl:when test="$level = 08">c08</xsl:when>
                <xsl:when test="$level = 09">c09</xsl:when>
                <xsl:when test="$level = 10">c10</xsl:when>
                <xsl:when test="$level = 11">c11</xsl:when>
                <xsl:when test="$level = 12">c12</xsl:when>
                <xsl:when test="../c">c</xsl:when>
                <xsl:when test="../c01">c01</xsl:when>
                <xsl:when test="../c02">c02</xsl:when>
                <xsl:when test="../c03">c03</xsl:when>
                <xsl:when test="../c04">c04</xsl:when>
                <xsl:when test="../c05">c05</xsl:when>
                <xsl:when test="../c06">c06</xsl:when>
                <xsl:when test="../c07">c07</xsl:when>
                <xsl:when test="../c08">c08</xsl:when>
                <xsl:when test="../c08">c09</xsl:when>
                <xsl:when test="../c08">c10</xsl:when>
                <xsl:when test="../c08">c11</xsl:when>
                <xsl:when test="../c08">c12</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <!-- Establishes a class for even and odd rows in the table for color coding. 
        Colors are Declared in the CSS. -->
        <xsl:variable name="colorClass">
            <xsl:choose>
                <xsl:when test="ancestor-or-self::*[@level='file' or @level='item']">
                    <xsl:choose>
                        <xsl:when test="(position() mod 2 = 0)">odd</xsl:when>
                        <xsl:otherwise>even</xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <!-- Processes the all child elements of the c or c0* level -->
        <xsl:for-each select=".">
            <xsl:choose>
                <!--Formats Series and Groups  -->
                <xsl:when
                    test="@level='subcollection' or @level='subgrp' or @level='series' 
                    or @level='subseries' or @level='collection'or @level='fonds' or 
                    @level='recordgrp' or @level='subfonds' or @level='class' or (@level='otherlevel' and not(child::did/container))">
                    <tr>
                        <xsl:attribute name="class">
                            <xsl:choose>
                                <xsl:when
                                    test="@level='subcollection' or @level='subgrp' or @level='subseries' or @level='subfonds'"
                                    >subseries</xsl:when>
                                <xsl:otherwise>series</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="did/container">
                                <td class="{$clevelMargin}">
                                    <xsl:choose>
                                        <xsl:when test="count(did/container) &lt; 1">
                                            <xsl:attribute name="colspan">
                                                <xsl:text>5</xsl:text>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="count(did/container) =1">
                                            <xsl:attribute name="colspan">
                                                <xsl:text>4</xsl:text>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="count(did/container) = 2">
                                            <xsl:attribute name="colspan">
                                                <xsl:text>3</xsl:text>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="count(did/container) = 3">
                                            <xsl:attribute name="colspan">
                                                <xsl:text>2</xsl:text>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:otherwise/>
                                    </xsl:choose>
                                    <xsl:call-template name="anchor"/>
                                    <xsl:apply-templates select="did" mode="dsc"/>
                                    <xsl:apply-templates
                                        select="child::*[not(did) and not(self::did)]"/>
                                </td>
                                <xsl:for-each select="descendant::did[container][1]/container">
                                    <td class="containerHeader">
                                        <xsl:value-of select="@type"/>
                                        <br/>
                                        <xsl:value-of select="."/>
                                     
                                    </td>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <td colspan="5" class="{$clevelMargin}">
                                    <xsl:call-template name="anchor"/>
                                    <xsl:apply-templates select="did" mode="dsc"/>
                                    <xsl:apply-templates
                                        select="child::*[not(did) and not(self::did)]"/>
                                </td>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tr>
                </xsl:when>

                <!--Items/Files with multiple formats linked using parent and id attributes -->
                <!--<xsl:when test="count(child::*/container/@id) &gt; 1">
                    <tr class="{$colorClass}">
                        <td colspan="5">
                            <xsl:apply-templates select="did" mode="dsc"/>
                            <br class="clear"/>
                            <table class="parentContainers">
                                <xsl:for-each select="child::*/container[@label]">
                                    <xsl:variable name="id" select="@id"/>
                                    <xsl:variable name="container" select="count(../container[@parent = $id] | ../container[@id = $id])"/>
                                    <tr class="containerTypes">
                                        <td>&#160;</td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="$container = ''"><xsl:attribute
                                                  name="colspan">4</xsl:attribute></xsl:when>
                                                <xsl:when test="$container = 1"><xsl:attribute
                                                  name="colspan">4</xsl:attribute></xsl:when>
                                                <xsl:when test="$container = 2"><xsl:attribute
                                                  name="colspan">3</xsl:attribute></xsl:when>
                                                <xsl:when test="$container = 3"><xsl:attribute
                                                  name="colspan">2</xsl:attribute></xsl:when>
                                                <xsl:when test="$container = 4"/>
                                                <xsl:otherwise/>
                                            </xsl:choose> &#160; </td>
                                        <xsl:for-each
                                            select="../container[@parent = $id] | ../container[@id = $id]">
                                            <td>
                                                <xsl:value-of select="@type"/>
                                            </td>
                                        </xsl:for-each>
                                    </tr>
                                    <tr>
                                        <td>
                                            <xsl:value-of select="@label"/>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="$container = ''"><xsl:attribute
                                                  name="colspan">4</xsl:attribute></xsl:when>
                                                <xsl:when test="$container = 1"><xsl:attribute
                                                  name="colspan">4</xsl:attribute></xsl:when>
                                                <xsl:when test="$container = 2"><xsl:attribute
                                                  name="colspan">3</xsl:attribute></xsl:when>
                                                <xsl:when test="$container = 3"><xsl:attribute
                                                  name="colspan">2</xsl:attribute></xsl:when>
                                                <xsl:when test="$container = 4"/>
                                                <xsl:otherwise/>
                                            </xsl:choose> &#160; </td>
                                        <xsl:for-each
                                            select="../container[@parent = $id] | ../container[@id = $id]">
                                            <td>
                                                <xsl:apply-templates/>
                                            </td>
                                        </xsl:for-each>
                                    </tr>
                                </xsl:for-each>
                                <xsl:if test="descendant-or-self::dao">
                                    <xsl:for-each select="descendant-or-self::dao">
                                        <tr>
                                            <td>Digital Object</td>
                                            <td/>
                                            <td colspan="4">
                                                <xsl:apply-templates select="dao"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </xsl:if>
                            </table>
                            <br class="clear"/>
                            <xsl:apply-templates
                                select="*[not(self::did) and not(descendant-or-self::dao) and
                                not(self::c) and not(self::c02) and not(self::c03) and
                                not(self::c04) and not(self::c05) and not(self::c06) and not(self::c07)
                                and not(self::c08) and not(self::c09) and not(self::c10) and not(self::c11) and not(self::c12)]"
                            />
                        </td>
                    </tr>
                </xsl:when>-->

                <!-- Items/Files-->
                <xsl:when
                    test="@level='file' or @level='item' or (@level='otherlevel'and child::did/container) or not(@level)">
                    <!-- Variables to  for Container headings, used only if headings are different from preceding heading -->
                    <xsl:variable name="container" select="string(did/container[1]/@type)"/>
                    <xsl:variable name="container2" select="string(did/container[2]/@type)"/>
                    <xsl:variable name="container3" select="string(did/container[3]/@type)"/>
                    <xsl:variable name="container4" select="string(did/container[4]/@type)"/>
                    <!-- Counts containers for current and preceding instances and if different inserts a heading -->
                    <xsl:variable name="containerCount" select="count(did/container)"/>
                    <xsl:variable name="sibContainerCount"
                        select="count(preceding-sibling::*[1]/did/container)"/>
                    <!-- Variable estabilishes previous container types for comparison to current container. -->
                    <xsl:variable name="sibContainer"
                        select="string(preceding-sibling::*[1]/did/container[1]/@type)"/>
                    <xsl:variable name="sibContainer2"
                        select="string(preceding-sibling::*[1]/did/container[2]/@type)"/>
                    <xsl:variable name="sibContainer3"
                        select="string(preceding-sibling::*[1]/did/container[3]/@type)"/>
                    <xsl:variable name="sibContainer4"
                        select="string(preceding-sibling::*[1]/did/container[4]/@type)"/>
                    <!-- Tests to see if current container type is different from previous container type, if it is a new row with container type headings is output -->
                    <xsl:if
                        test="$container != $sibContainer or $container2 != $sibContainer2 or $container3 != $sibContainer3 or $container4 != $sibContainer4 or$containerCount != $sibContainerCount">
                        <xsl:if test="did/container">
                            <tr>
                                <td class="title">
                                    <xsl:choose>
                                        <xsl:when test="count(did[container][1]/container) &lt; 1">
                                            <xsl:attribute name="colspan">
                                                <xsl:text>5</xsl:text>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="count(did[container][1]/container) = 1">
                                            <xsl:attribute name="colspan">
                                                <xsl:text>4</xsl:text>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="count(did[container][1]/container) = 2">
                                            <xsl:attribute name="colspan">
                                                <xsl:text>3</xsl:text>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="count(did[container][1]/container) = 3">
                                            <xsl:attribute name="colspan">
                                                <xsl:text>2</xsl:text>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:otherwise/>
                                    </xsl:choose>
                                    <xsl:text/>
                                </td>
                                <xsl:for-each select="did/container">
                                    <td class="containerHeader">
                                        <!--<xsl:choose>
                                            <xsl:when test="@type='Box'">
                                                <xsl:text>Box&#160;</xsl:text>
                                                <xsl:value-of select="@type"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>Folder&#160;</xsl:text>
                                                <xsl:value-of select="@type"/>
                                            </xsl:otherwise>
                                        </xsl:choose>-->
                                        <xsl:value-of select="@type"/>
                                    </td>
                                </xsl:for-each>
                            </tr>
                        </xsl:if>
                    </xsl:if>
                    <tr class="{$colorClass}">
                        <td class="{$clevelMargin}">
                            <xsl:choose>
                                <xsl:when test="count(did/container) &lt; 1">
                                    <xsl:attribute name="colspan">
                                        <xsl:text>5</xsl:text>
                                    </xsl:attribute>
                                </xsl:when>
                                <xsl:when test="count(did/container) = 1">
                                    <xsl:attribute name="colspan">
                                        <xsl:text>4</xsl:text>
                                    </xsl:attribute>
                                </xsl:when>
                                <xsl:when test="count(did/container) = 2">
                                    <xsl:attribute name="colspan">
                                        <xsl:text>3</xsl:text>
                                    </xsl:attribute>
                                </xsl:when>
                                <xsl:when test="count(did/container) = 3">
                                    <xsl:attribute name="colspan">
                                        <xsl:text>2</xsl:text>
                                    </xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                            <xsl:apply-templates select="did" mode="dsc"/>
                            <xsl:apply-templates
                                select="*[not(self::did) and 
                                not(self::c) and not(self::c02) and not(self::c03) and
                                not(self::c04) and not(self::c05) and not(self::c06) and not(self::c07)
                                and not(self::c08) and not(self::c09) and not(self::c10) and not(self::c11) and not(self::c12)]"
                            />
                        </td>
                        <!-- Containers -->
                        <xsl:for-each select="did/container">
                            <td class="container">
                                <xsl:value-of select="."/>
                            </td>
                        </xsl:for-each>
                    </tr>
                </xsl:when>
                <xsl:otherwise>
                    <tr class="{$colorClass}">
                        <td class="{$clevelMargin}" colspan="5">
                            <xsl:apply-templates select="did" mode="dsc"/>
                            <xsl:apply-templates
                                select="*[not(self::did) and 
                                not(self::c) and not(self::c02) and not(self::c03) and
                                not(self::c04) and not(self::c05) and not(self::c06) and not(self::c07)
                                and not(self::c08) and not(self::c09) and not(self::c10) and not(self::c11) and not(self::c12)]"
                            />
                        </td>
                    </tr>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="did" mode="dsc">
        <xsl:choose>
            <xsl:when
                test="../@level='subcollection' or ../@level='subgrp' or ../@level='series' 
                or ../@level='subseries'or ../@level='collection'or ../@level='fonds' or 
                ../@level='recordgrp' or ../@level='subfonds'">
                <h4>
                    <xsl:call-template name="component-did-core"/>
                </h4>
            </xsl:when>
            <!--Otherwise render the text in its normal font.-->
            <xsl:otherwise>
                <p>
                    <xsl:call-template name="component-did-core"/>
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="component-did-core">
        <!--Inserts unitid and a space if it exists in the markup.-->
        <xsl:if test="unitid">
            <xsl:choose>
                <xsl:when test="../../@level='series'">
                    <xsl:text>Subseries</xsl:text>
                    <xsl:apply-templates select="unitid"/>
                    <xsl:text>:&#160;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Item</xsl:text>
                    <xsl:apply-templates select="unitid"/>
                    <xsl:text>:&#160;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>

        <!--Inserts origination and a space if it exists in the markup.-->
        <xsl:if test="origination">
            <xsl:apply-templates select="origination"/>
            <xsl:text>&#160;</xsl:text>
        </xsl:if>

        <!--<xsl:if test="descendant::accessrestrict">
            <xsl:value-of select="accessrestrict"/>
        </xsl:if>-->

        <!--This choose statement selects between cases where unitdate is a child of unittitle and where it is a separate child of did.-->
        <xsl:choose>
            <!--This code processes the elements when unitdate is a child of unittitle.-->
            <xsl:when test="unittitle/unitdate">
                <xsl:apply-templates select="unittitle"/>
            </xsl:when>
            <!--This code process the elements when unitdate is not a child of untititle-->
            <xsl:otherwise>
                <xsl:apply-templates select="unittitle"/>
                <xsl:text>,&#160;</xsl:text>
                <xsl:for-each select="unitdate[not(self::unitdate[@type='bulk'])]">
                    <xsl:apply-templates/>
                    <xsl:text>&#160;</xsl:text>
                </xsl:for-each>
                <xsl:for-each select="unitdate[@type = 'bulk']"> (<xsl:apply-templates/>)
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
        <!--<xsl:if test="physdesc">
            <xsl:text>,&#160;</xsl:text>
            <xsl:apply-templates select="physdesc"/>
        </xsl:if>-->
    </xsl:template>
    <!-- ******************************************************************* -->
    <!-- LINKS                                                               -->
    <!-- Converts REF, EXTREF, ARCHREF, DAO and PTR elements into HTML links -->
    <!-- Don't forget to add the callout to this template to the did         -->
    <!-- processing in your chosen dsc# style sheet!                         -->
    <!-- Known limitations: If you use an href value that has an             -->
    <!-- ampersand & in it, you will encounter problems.                     -->
    <!-- ******************************************************************* -->
    
    <xsl:template match="ref">
        <a href="#{@target}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    
    <xsl:template match="extref | archref">
        <xsl:choose>
            <xsl:when test="self::extref[@show='new']">
                <a href="{@href}" target="_blank"><xsl:apply-templates/></a>
            </xsl:when>
            <xsl:otherwise>
                <a href="{@href}"><xsl:apply-templates/></a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="ptr">
        <a href="{@href}">
            <xsl:value-of select="@href"/><xsl:apply-templates/>
        </a>
    </xsl:template>
    
    
    <xsl:template match="extptr">
        <xsl:choose>
            <xsl:when test="self::extptr[@show='embed']">
                <img src="{@xpointer}" alt="{@title}" align="{@altrender}"/>
            </xsl:when>
            <xsl:otherwise>
                <a href="{@xpointer}">"{@title}"</a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="dao">
        <xsl:if test="preceding-sibling::dao">
            <br/>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="self::dao[@show='new']">
                <a href="{@href}" target="_blank">Digital object</a>
            </xsl:when>
            <xsl:otherwise>
                <a href="{@href}">Digital object</a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
