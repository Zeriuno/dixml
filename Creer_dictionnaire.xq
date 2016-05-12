<dic>
{
let $file := "input-list.xml"
for $element in doc($file)/item (:l'élément après // doit correspondre à l'élément dont est constituté le fichier de input:)
return
  <entry>
    <orth>{$element/text()}</orth>
    <gramgrp>
    {
    let $word := $element/item/text()
    for $gram in html:parse(fetch:text(concat("http://fr.wiktionary.org/wiki/",$element)))//h3/span/span[@class="titredef"
    }
    </gramgrp>
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
