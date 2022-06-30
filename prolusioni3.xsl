<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']"/></title>

                <link rel="stylesheet" type="text/css" href="prolusioni3.css" />

                <!-- Font awesome -->
                <script src="https://kit.fontawesome.com/631a8dead6.js" crossorigin="anonymous"></script>
            </head>
            <body>
                <!-- Header -->
                <header id="header">
                    <i class="fa-solid fa-bars fa-2x" id="hamburger"></i>
                    <ul class="navbar">
                        <li><a href="#descrizione">Descrizione</a></li>
                        <li><a href="##foglio4">Pagina 4</a></li>
                        <li><a href="##foglio5">Pagina 5</a></li>
                        <li><a href="#glossario">Glossario</a></li>
                        <li><a href="#bibliografia">Bibliografia</a></li>
                        <li><a href="#riferimenti">Riferimenti</a></li>
                    </ul>
                </header>
                <main>
                    <!-- Informazioni titolo -->
                    <section id="title">
                        <h1><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']"/></h1>
                        <h3>Autore:<xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/></h3>
                    </section>
                    <!-- Caratteristiche -->
                    <section class="descrizione" id="descrizione">
                        <div>
                            <img src="img/saussure.jpg" alt="author_img" />
                        </div>
                        <div class="card_descrizione">
                            <xsl:apply-templates select="//tei:msContents" />
                        </div>
                    </section>
                    <!-- Descrizione fisica -->
                    <section class="descrizione">
                        <div class="card_descrizione" id="order_2">
                            <xsl:apply-templates select="//tei:physDesc" />
                        </div>
                        <div id="order_1">
                            <img src="img/p4p5.jpg" alt="risorsa_primaria_img" />
                        </div>
                    </section>
                    <!-- Storia editoriale -->
                    <section class="descrizione">
                        <div>
                            <img src="img/ginevra.jpg" alt="università_ginevra_img"/>
                        </div>
                        <div class="card_descrizione">
                            <xsl:apply-templates select="//tei:history" />
                        </div>
                    </section>
                    <!-- Slide -->
                    <div id="slide">
                        <xsl:apply-templates select="//tei:facsimile" />
                        <button id="indietro"><i class="fa-solid fa-angle-left fa-6x"></i></button>
                        <button id="avanti"><i class="fa-solid fa-angle-right fa-6x"></i></button>
                        <span id="testo_foto"></span>
                    </div>
                    <!-- Lista bottoni -->
                    <div class="lista_bottoni">
                        <button id="cancella">Cancellature</button>
                        <button id="correzioni">Correzioni</button>
                        <button id="terminologia">Terminologia</button>
                        <button id="aggiunte">Aggiunte e note</button>   
                        <button id="glottonimi">Glottonimi</button>
                        <button id="toponimi">Toponimi</button>
                        <button id="date">Date</button>
                    </div>
                    <!-- Pagine 4&5 -->
                    <section id="pagine4_5">
                        <!-- Pagina 4 -->
                        <div class="pagina">
                            <xsl:attribute name="id">
                                <xsl:value-of select="//tei:div[@n='4']/@facs"/>
                            </xsl:attribute>
                            <h2>Pagina 4</h2>
                            <div class="testo_pagina">
                                <div class="testo">
                                    <h3>Trascrizione testo originale</h3>
                                    <xsl:apply-templates select="//tei:div[@n = '4']" />
                                </div>
                                <div class="testo">
                                    <h3>Traduzione italiana</h3>
                                    <xsl:apply-templates select="//tei:div[@type = 'translationP4']" />
                                </div>
                            </div>
                        </div>
                        <!-- Pagina 5 -->
                        <div class="pagina">
                            <xsl:attribute name="id">
                                <xsl:value-of select="//tei:div[@n='5']/@facs"/>
                            </xsl:attribute>
                            <h2>Pagina 5</h2>
                            <div class="testo_pagina">
                                <div class="testo">
                                    <h3>Trascrizione testo originale</h3>
                                    <xsl:apply-templates select="//tei:div[@n = '5']" />
                                </div>
                                <div class="testo">
                                    <h3>Traduzione italiana</h3>
                                    <xsl:apply-templates select="//tei:div[@type = 'translationP5']" />
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Appendice -->
                    <section id="glossario">
                        <xsl:apply-templates select="//tei:back/tei:div/tei:list" />
                    </section>
                    <!-- Scroll top -->
                    <div id="scroll_top">
                        <a href="#" id="top">Top<i class="fa fa-arrow-circle-up fa-2x"></i></a>
                    </div>
                    <!-- Bibliografia -->
                    <section id="bibliografia">
                        <h3>Bibliografia</h3>
                        <xsl:apply-templates select="//tei:back/tei:div/tei:listBibl" />
                    </section>
                </main>
                <!-- footer -->
                <footer id="riferimenti">
                    <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt" />
                </footer>
                <!-- javaScript -->
                <script src="prolusioni3.js"></script>
            </body>
        </html>
    </xsl:template>

    <!-- Templates -->

    <!-- Caratteristiche -->
    <xsl:template match="tei:msContents">
        <h2>Caratteristiche</h2>
        <h3>Autore:</h3>
        <p>
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="//tei:person[@xml:id='FDS']/tei:persName/tei:ref/@target" /> 
                </xsl:attribute>
                <xsl:attribute name="target">_blank</xsl:attribute>
                <xsl:value-of select="tei:msItem/tei:author"/>
            </xsl:element>
        </p>
        <h3>Titolo:</h3>
        <p><xsl:value-of select="tei:msItem/tei:title"/></p>
        <h3>Documento:</h3>
        <p><xsl:value-of select="../tei:msIdentifier/tei:idno"/></p>
        <h3>Lingua:</h3>
        <p><xsl:value-of select="//tei:language"/></p>
        <h3>Acquisizione:</h3>
        <p>
            Testi registrati nella
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="../tei:msIdentifier/tei:repository/@ref"/> 
                </xsl:attribute>
                <xsl:attribute name="target">_blank</xsl:attribute>
                <xsl:value-of select="../tei:msIdentifier/tei:repository"/>
            </xsl:element>,
            <xsl:value-of select="../tei:msIdentifier/tei:country"/>.
        </p>
        <h3>Data:</h3>
        <p><xsl:value-of select="//tei:creation/tei:date"/></p>
    </xsl:template>
    <!-- Descrizione fisica -->
    <xsl:template match="tei:physDesc">
        <h2>Descrizione fisica</h2>
        <h3>Supporto:</h3>
        <p><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:support"/></p>
        <h3>Quantità:</h3>
        <p><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:extent/tei:measure"/></p>
        <h3>Condizioni:</h3>
        <p><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:condition"/></p>
        <h3>Mani:</h3>
        <p><xsl:value-of select="tei:handDesc/tei:p"/></p>
    </xsl:template>
    <!-- Storia editoriale -->
    <xsl:template match="tei:history">
        <h2>Storia editoriale</h2>
        <p><xsl:value-of select="tei:origin/tei:p"/></p>
    </xsl:template>

    <!-- Template immagini e mappatura -->
    <xsl:template match="tei:facsimile">
        <xsl:for-each select="tei:surface">
            <xsl:element name="img">
                <xsl:attribute name="class">foto</xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
                <xsl:attribute name="usemap">#<xsl:value-of select="@xml:id"/></xsl:attribute>
                <xsl:attribute name="alt">slide-foto</xsl:attribute>
            </xsl:element>
            <xsl:element name="map">
                <xsl:attribute name="name"><xsl:value-of select="@xml:id" /></xsl:attribute>
                <xsl:variable name="Width">
                    <xsl:value-of select="concat(substring-before(tei:graphic/@width, 'px'), '')"/> <!-- rimozione di 'px' dalla stringa-->   
                </xsl:variable>          
                <xsl:variable name="ratio" select="500 div $Width"/> <!-- ratio = rapporto tra l’attuale dimensione della foto (500) e la dimensione della foto prima della sua scalatura -->
                <xsl:for-each select="tei:zone">
                    <xsl:element name="area">
                        <xsl:attribute name="shape">rect</xsl:attribute>
                        <xsl:attribute name="coords">
                            <xsl:value-of select="concat(@ulx*$ratio, ',', @uly*$ratio, ',', @lrx*$ratio, ',', @lry*$ratio)"/> <!-- calcolo nuove coordinate aree adattate alle dimensioni della foto-->
                        </xsl:attribute>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                        <xsl:attribute name="href">##<xsl:value-of select="@xml:id"/></xsl:attribute>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <!-- blocco di testo -->
    <xsl:template match="tei:ab">
        <xsl:element name="b">
            <xsl:attribute name="class">pericope</xsl:attribute>
            Pericope <xsl:value-of select="@n" />
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Inizio riga -->
    <xsl:template match="tei:lb">
        <xsl:element name="br"></xsl:element>
        <xsl:element name="b">
            <xsl:attribute name="id">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="class">numero</xsl:attribute>
            <xsl:value-of select="@n" />
        </xsl:element>
    </xsl:template>

    <!-- Appendice -->
    <xsl:template match="tei:list">
        <h3>Glossario</h3>
        <xsl:for-each select="tei:label">
            <div class="label">
                <xsl:element name="i">
                    <xsl:attribute name="id">
                        <xsl:value-of select="tei:term[@xml:lang='fr']/@xml:id"/>
                    </xsl:attribute>
                    <xsl:value-of select="tei:term[@xml:lang='fr']" />,
                </xsl:element>
                <xsl:element name="b">
                    <xsl:value-of select="tei:term[@xml:lang='it']" />:
                </xsl:element>
            </div>
            <!-- Variabile che prende il valore dell'attributo @ref (del termine italiano) -->
            <xsl:variable name="VarTerm" >
                <xsl:value-of select="tei:term[@xml:lang='it']/@ref"/>
            </xsl:variable>
            <xsl:for-each select="../tei:item/tei:gloss">
                <!-- Se gloss ha un attributo @target con lo stesso valore di $VarTerm(=@ref) lo collego al termine corrispondente -->
                <xsl:if test ="@target = $VarTerm">
                    <p><xsl:value-of select="."/></p>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <!-- Bibliografia -->
    <xsl:template match="tei:listBibl">
        <xsl:element name="ul">
            <xsl:for-each select="tei:bibl">
                    <xsl:element name="li">
                        
                        <b><xsl:value-of select="tei:title"/></b>,
                        <xsl:for-each select="tei:author/tei:persName">
                            <i><xsl:value-of select="." /></i>,
                        </xsl:for-each>
                        <xsl:for-each select="tei:pubPlace/tei:placeName">
                        <xsl:value-of select="."/>,
                        </xsl:for-each>
                        <xsl:value-of select="tei:publisher"/>,
                        <xsl:value-of select="tei:date"/>
                        
                    </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <!-- Edizione digitale -->
    <xsl:template match="tei:editionStmt">
        <h2>Riferimenti</h2>
        <h3><xsl:value-of select="tei:edition"/></h3>
        <xsl:for-each select="tei:respStmt">
            <div>
                <h3><xsl:value-of select="tei:resp"/></h3>
                <xsl:for-each select="tei:persName">
                    <p><xsl:value-of select="."/></p>
                </xsl:for-each>
            </div>
        </xsl:for-each>
    </xsl:template>

    <!-- Correzioni che comprendono: -->
    <!-- Abbreviazioni e testo originale-->
    <xsl:template match="tei:abbr | tei:orig">
        <xsl:element name="span">
            <xsl:attribute name="class">abbr</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <!-- Espansioni e testo regolarizzato -->
    <xsl:template match="tei:expan | tei:reg">
        <xsl:element name="span">
            <xsl:attribute name="class">expan</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Aggiunte dell'autore o editoriali -->
    <xsl:template match="tei:add | tei:supplied">
        <xsl:element name="span">
            <xsl:attribute name="class">add</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Aggiunte note -->
    <xsl:template match="tei:add[@facs]">
        <xsl:element name="b">
            <xsl:attribute name="id"><xsl:value-of select="@facs"/></xsl:attribute>
            <xsl:attribute name="class">numero</xsl:attribute>
            nota
        </xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="class">add</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Cancellature -->
    <xsl:template match="tei:del">
        <xsl:element name="span">
            <xsl:attribute name="class">del</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Elementi non leggibili -->
    <xsl:template match="tei:gap">
        <xsl:element name="span">
            <xsl:attribute name="class">del</xsl:attribute>?
        </xsl:element>
    </xsl:template>

    <!-- Terminologia -->
    <xsl:template match="tei:term">
        <xsl:element name="span">
            <xsl:element name="a">
                <xsl:attribute name="class">terms</xsl:attribute>
                <xsl:attribute name="href"><xsl:value-of select="@ref"/></xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!-- Glottonimi -->
    <xsl:template match="tei:lang">
        <xsl:element name="span">
            <xsl:attribute name="class">lang</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <!-- Toponimi -->
    <xsl:template match="tei:name[@type='place']">
        <xsl:element name="span">
            <xsl:attribute name="class">top</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Date -->
    <xsl:template match="tei:date">
        <xsl:element name="span">
            <xsl:attribute name="class">date</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Enfasi -->
    <xsl:template match="tei:emph">
        <xsl:element name="u">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- highlighted items -->
    <xsl:template match="tei:hi[@rend='sup']">
        <xsl:element name="sup">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:hi[@rend='italic']">
        <xsl:element name="span">
            <xsl:element name="i">
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>