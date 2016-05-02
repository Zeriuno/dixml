<dic>
{
let $fichier := "MaListe.xml"
for $element in doc($fichier)//v
return
  <entry>
    <orth>{$element/mot/text()}</orth>
    <gramgrp>{$element/catGram/text()}</gramgrp>
    <translate>
      {
       let $mot := $element/mot/text()
       for $L in html:parse(fetch:text(concat("http://fr.wiktionary.org/wiki/",$mot)))//div[@class="translations"]//li//span[@lang]
       let $abreviationLang := data($L/@lang)
       let $langueComplete :=$L/../..//span[@class=concat("trad-",$abreviationLang)]/data()
       let $motTraduit := $L/data()
       return
       <T>
         <Langue>{$langueComplete}</Langue>
         <MotTraduit>{$motTraduit}</MotTraduit>
        </T>
      }
    </translate>
  </entry>
}
</dic>
