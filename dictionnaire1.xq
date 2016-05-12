<dictionnaire>
{
let $fichier := "liste1.xml"
for $element in doc($fichier)//mot
return
  <vedette>
    <mot>{$element/text()}</mot>
    <catgram>       
      {
			let $mot := $element/text()
       return (html:parse(fetch:text(concat("https://fr.wiktionary.org/wiki/",$mot)))//span[@class="titredef"]/text())[1]
      }
    </catgram>
      {
       let $mot := $element/text()
       for $L in html:parse(fetch:text(concat("https://fr.wiktionary.org/wiki/",$mot)))//div[@class="translations"]//li//span[@lang]
       let $abreviationLang := data($L/@lang)
       let $langueComplete :=$L/../..//span[@class=concat("trad-",$abreviationLang)]/data()
       let $motTraduit := $L/data()
       return
       <traduction>
         <langue>{$langueComplete}</langue>
         <trad>{$motTraduit}</trad>
       </traduction>
      }
  </vedette>
}
</dictionnaire>
