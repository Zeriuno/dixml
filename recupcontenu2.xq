<html>
<head>
  <meta charset="UTF-8"/>
  <title>LISTE DE VETEMENT</title>
</head>
<body>
<resultat>
{
let $fichier := "dictionnaire.xml"
for $element in doc($fichier)//vedette
return
	<ul class="vedette">
		<mot>{$element/mot/text()}</mot>
		<categorie>
        {
			let $mot := $element/mot/text()
			for $categorie  in html:parse(fetch:text(concat("https://fr.wiktionary.org/wiki/",$mot)))//h3/span/span[@class="titredef"] (:défaut: si un mot a plusieurs définitions, avec ce selecteur on aura plusieurs cat.:)
       return
      <cat>{$categorie/text()}</cat>
      }
    </categorie>
		<traduc>
    {
			let $mot := $element/mot/text()
			for $L in html:parse(fetch:text(concat("https://fr.wiktionary.org/wiki/",$mot)))//div[@class="translations"]//li//span[@lang]
			let $abreviationLang := data($L/@lang)
			let $langueComplete :=$L/../..//span[@class=concat("trad-",$abreviationLang)]/data()
			let $motTraduit := $L/data()
       return
       <ul class="contenu">
         <Langue>{$langueComplete}</Langue>
         <MotTraduit>{$motTraduit}</MotTraduit>
        </ul>
      }
		</traduc>
	</ul>
}
</resultat>
</body>
</html>