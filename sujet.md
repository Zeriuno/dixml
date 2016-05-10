# XML : Dictionnaire

L’objectif de se devoir est de construire un ressource dictionnairique multilingue sur un sujet précis (un sport, une discipline, …) que vous choisirez. Ce travail est à rendre pour le 14 Mai.

* [x] Étape 1
* [x] Étape 2
* [x] Étape 3
* [ ] Étape 4
* [ ] Étape 5

## Étape 1

Écrire la DTD (dictionnaire.dtd) permettant de représenter le dictionnaire. L’entrée (la vedette) du dictionnaire est un terme ou un mot en français, à chaque vedette on associe une catégorie grammaticale et une liste d’équivalents dans d’autres langues.

### Instructions

cf `dic.dtd`

## Étape 2

À partir d’une liste de mots en français stockés dans un fichier écrire un script XQuery qui permet de construire automatiquement un dictionnaire tel que décrit par la DTD de la question précédente à partir du site web : http://fr.wiktionary.org.

### Aide

L’instruction XQuery suivante `html:parse(fetch:text(url))` permet de télécharger une page HTML et de la transformer en XML valide. Par exemple le code suivant permet de récupérer les titre de la page d’accueil du site de l’université Paris 1 :
```
<resultat> {
        let $url:= "http://www.univ-paris1.fr"
        for $titre in html:parse(fetch:text($url))//h1
        return
          <titre>{$titre/text()}</titre>
      }
</resultat>
```

### Instructions


1. Avoir un fichier de input. Ici `input-list.xml`
  On peut le constituer par une requête à une catégorie du wiktionary. Type ça (cf. `get-input-list.xq`):
  ```
  <input>
{
let $url:= "https://fr.wiktionary.org/wiki/Cat%C3%A9gorie:Outils_en_fran%C3%A7ais"
for $mot in html:parse(fetch:text($url))//a
return
<item>{$mot/text()}</item>
}
</input>
  ```
2. ```
<html lang="fr">
  <head>
    <title>Dictionnaire</title>
    <meta charset="utf-8" />
  </head>
  <body>
    <h1>Dictionnaire</h1>
    {
    for $e in //entry
    where starts-with($e//orth/text(), "A")
    order by $e ascending
    return
      <article>
      <h2>{$e/form/orth/text()}</h2>
      <i>{$e//gram[@type="pos"]/text()}</i>
      <p>{$e//def/text()}</p>
      </article>
    }
  </body>
</html>
```

## Étape 3

En utilisant le script de la question précédente, construire un dictionnaire dont la taille ne doit pas être inférieure à 100 mots.
Si nécessaire, ne pas hésiter à modifier manuellement le résultat.

### Instructions
### Questions

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

### Instructions
### Questions

## Étape 5

Ajouter une page HTML avec un formulaire afin d’offrir une interface d’interrogation de votre dictionnaire semblable à ce qui est présenté [ici](./apercu.png).

### Instructions

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

### Questions

* Si la valeur saisie n'est pas la bonne (pas présente dans le dictionnaire), que se passe-t-il, le serveur renvoie-t-il une erreur 404? Faut-il dans ce cas personnaliser la page?
* Songer à la conversion: l'utilisateur saisit en UTF-8, l'espace de nommage de HTML est plus restreint. Est-ce que baseX s'en charge?
