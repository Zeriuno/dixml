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

###Questions

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

Script qui fait un dictionnaire en HTML.
```
(:
Requête XQuery pour faire de chaque entry dans le dictionnaire.
De M. Issac
:)

<html lang="fr">
  <head>
    <title>Index</title>
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

Il manque:

* la partie où l'on accède le fichier et on itère cette requête ligne par ligne
* la partie où l'on récupère les éléments de la page demandée qui nous intéressent (dont les mots dans les autres langues)
  Pour les récupérer, il faut aller chercher les liens dans la section `<h3 id="p-lang-label">Autres langues</h3>`: dans la liste on peut trouver le nom de la langue, se rendre sur la page liée et puis y trouver le mot.
  Par contre le nom de la langue est donné dans la langue de déstination (donc "Italiano" et non pas "Italien", contrairement à ce qui est montré dans l'aperçu).
* la partie où on se sert de ce qu'on a récupéré pour en faire une entrée, à écrire à la suite des autres, dans le fichier `dixml.xml` (ou semblable)



### Questions

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
