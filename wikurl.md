Catégoie grammaticale: html:parse(fetch:text(concat("http://fr.wiktionary.org/wiki/",$element)))//h3/span/span[@class="titredef"]

Langue étrangère: html:parse(fetch:text(concat("http://fr.wiktionary.org/wiki/",$element)))//div[@class="translations"]/ul/li/span

Mot traduit: html:parse(fetch:text(concat("http://fr.wiktionary.org/wiki/",$element)))//div[@class="translations"]/ul/li/a/span
