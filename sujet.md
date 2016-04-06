# XML : Dictionnaire

L’objectif de se devoir est de construire un ressource dictionnairique multilingue sur un sujet précis (un sport, une discipline, …) que vous choisirez. Ce travail est à rendre pour le 14 Mai.

* [x] Étape 1
* [ ] Étape 2
* [x] Étape 3
* [ ] Étape 4
* [ ] Étape 5

## Étape 1

Écrire la DTD (dictionnaire.dtd) permettant de représenter le dictionnaire. L’entrée (la vedette) du dictionnaire est un terme ou un mot en français, à chaque vedette on associe une catégorie grammaticale et une liste d’équivalents dans d’autres langues.

###Instructions

Point de départ, voici le dictionnaire qui nous a été proposé en cours:

```
<dic>
<entry>
  <form>
    <orth>GOUTTE-2</orth>
    <date>2012-08-10T20:25:51.563+02:00</date>
    <valid>newadd</valid>
    <auteur>yschauwecker</auteur>
  </form>
  <gramgrp>
    <gram type="pos">Subst.</gram>
    <gram type="gen">fém.</gram>
  </gramgrp>
  <etym>
    <bibl>
      <etymosrc>FEW</etymosrc>
    </bibl>
    <mentioned>Etymon</mentioned>
  </etym>
  <sense med="Sciences_Nat." mod="MIN.">
    <def>Corps, formation pierreuse, d'une nature différente de la pierre dans laquelle il se trouve renfermé, inclusion.</def>
    <note id="Struct">
      <xr>
        <ref>Ø</ref>
      </xr>
      <xr>
        <ref>Ø</ref>
      </xr>
      <xr>
        <ref>Ø</ref>
      </xr>
      <xr>
        <gloss>Texte encyclopédique</gloss>
      </xr>
    </note>
    <cit>
      <quote>Jaspes sont de nuef mannieres et de diverses couleurs et de diverses vertus, et son trouvees es souverainnes parties du monde ; mes celle qui est verte si est la mieudre ; et comme il y a <mark2>goutes</mark2> noires, mieuls en vuault ; et comme il i a <mark2>goutes</mark2> vermueilles et il est vert et il est entaillié de vielle entailleure, celui si est li sires des jaspes.</quote>
      <bibl>Sidrach, Fontaine de toutes sciences, 3e t. 13 s. (après 1268), ms. BL Add 17914 (1er t. 14e s.), éd. E.-P. Ruhe, q. 1072, p. 388</bibl>
    </cit>
  </sense>
  <id>10000</id>
</entry>
</dic>
```

Entre celui-ci et l'exemple donnée dans l'image, on pourrait faire cette hypothèse:

```
<dic>
  <entry>
    <orth></orth>
    <gramgrp>
      <gram type="pos"></gram>
      <gram type="gen"></gram>
    </gramgrp>
    <def></def>
    <translate>
      <foreign lang=""></foreign>
    </translate>
  </entry>
</dic>
```

L'attribut `lang` est renseigné en utilisant le code de la langue selong la norme ISO 639-1 (cf. [ici](http://www.loc.gov/standards/iso639-2/php/English_list.php "")).

Ce qui donnerait cette dtd:


```
<!ELEMENT dic (entry+)>
  <!ELEMENT entry (orth, gramgrp, def, translate)>
    <!ELEMENT orth (#PCDATA)>
    <!ELEMENT gramgrp (gram+)>
      <!ELEMENT gram (#PCDATA)>
      <!ATTLIST gram type CDATA #REQUIRED>
    <!ELEMENT def (#PCDATA)>
    <!ELEMENT translate (foreign*)>
      <!ELEMENT foreign (#PCDATA)>
      <!ATTLIST foreign lang CDATA #REQUIRED>
```

###Questions

## Étape 2

À partir d’une liste de mots en français stockés dans un fichier écrire un script XQuery qui permet de construire automatiquement un dictionnaire tel que décrit par la DTD de la question précédente à partir du site web : http://fr.wiktionary.org.

### Aide

L’instruction XQuery suivante html:parse(fetch:text(url)) permet de télécharger une page HTML et de la transformer en XML valide. Par exemple le code suivant permet de récupérer les titre de la page d’accueil du sir de l’université Paris 1 :
```
<resultat> {
        let $url:= "http://www.univ-paris1.fr"
        for $titre in html:parse(fetch:text($url))//h1
        return
          <titre>{$titre/text()}</titre>
      }
</resultat>
```

###Instructions

Compte tenu que les URLs de wiktionary sont faites ainsi: `https://fr.wiktionary.org/wiki/plaquebière`, le début de la requête pourra ressembler à ceci

```
{
  let $url:= "https://fr.wiktionary.org"
  for $titre in html:parse(fetch:text($url))//h1
  return
  <titre>{$titre/text()}</titre>
}
```

Il manque:

* la partie où l'on accède le fichier et on itère cette requête ligne par ligne
* la partie où l'on récupère les éléments de la page demandée qui nous intéressent (dont les mots dans les autres langues)
  Pour les récupérer, il faut aller chercher les liens dans la section `<h3 id="p-lang-label">Autres langues</h3>`: dans la liste on peut trouver le nom de la langue, se rendre sur la page liée et puis y trouver le mot.
  Par contre le nom de la langue est donné dans la langue de déstination (donc "Italiano" et non pas "Italien", contrairement à ce qui est montré dans l'aperçu).
* la partie où on se sert de ce qu'on a récupéré pour en faire une entrée, à écrire à la suite des autres, dans le fichier `dixml.xml` (ou semblable)



###Questions

## Étape 3

En utilisant le script de la question précédente, construire un dictionnaire dont la taille ne doit pas être inférieure à 100 mots.
Si nécessaire, ne pas hésiter à modifier manuellement le résultat.

###Instructions
###Questions

## Étape 4

En vous inspirant du code donné ci après, interfacez votre dictionnaire via le serveur web de basex.

— Placer le script dans le dossier webapp du dossier basex ; — lancer le serveur (basexhttp ou basexhttp.bat) ;
— dans un navigateur taper l’URL : `http://localhost:8984/rest?run=testparam.xq&mot=coucou&method=html`

Avec le fichier testparam.xq suivant :
```
declare variable $mot as xs:string external;
<html>
<head>
<title>test</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
</head>
<body>
<ul>
mot : {$mot}
</ul>
</body>
</html>
```

###Instructions
###Questions

## Étape 5

Ajouter une page HTML avec un formulaire afin d’offrir une interface d’interrogation de votre dictionnaire semblable à ce qui est présenté [ici](./apercu.png).

###Instructions

Quelque chose dans ce genre:
```
<input name="" maxlength="" placeholder="Terme à chercher" type="search"></input>
<button type="submit">Rechercher</button>
```

Comment ça fonctionne?
Probablement lors du POST, le serveur de baseX récupère la valeur saisie (on va la nommer `$valeur`)et renvoie l'utilisateur vers
```
http://localhost:8984/rest?run=testparam.xq&mot=valeur&method=html
```

###Questions

* Si la valeur saisie n'est pas la bonne (pas présente dans le dictionnaire), que se passe-t-il, le serveur renvoie-t-il une erreur 404? Faut-il dans ce cas personnaliser la page?
* Songer à la conversion: l'utilisateur saisit en UTF-8, l'espace de nommage de HTML est plus restreint. Est-ce que baseX s'en charge?
