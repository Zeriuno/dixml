<ListeVedettes>
{
let $fichier := "maListe.xml"
for $element in doc($fichier)//v
return
  <Vedette>
    <Mot>{$element/mot/text()}</Mot>
    <CategorieGram>{$element/catGram/text()}</CategorieGram>
    <Traductions>
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
    </Traductions>
  </Vedette>
}
</ListeVedettes>