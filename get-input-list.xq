<input>
{
let $url:= "https://fr.wiktionary.org/wiki/Cat%C3%A9gorie:Outils_en_fran%C3%A7ais"
for $mot in html:parse(fetch:text($url))//a
return
<item>{$mot/text()}</item>
}
</input>