# XML : Dictionnaire

L’objectif de se devoir est de construire un ressource dictionnairique multi- lingue sur un sujet précis (un sport, une discipline, … ) que vous choisirez. Ce travail est à rendre pour le 30 avril.

## Étape 1

Écrire la DTD (dictionnaire.dtd) permettant de représenter le dictionnaire. L’entrée (la vedette) du dictionnaire est un terme ou un mot en français, à chaque vedette on associe une catégorie grammaticale et une liste d’équivalents dans d’autres langues.

###Instructions
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
###Questions


## Étape 3

En utilisant le script de la question précédente, construire un dictionnaire dont la taille ne doit pas être inférieure à 100 mots.
Si nécessaire, ne pas hésiter à modifier manuellement le résultat.

###Instructions
###Questions

## Étape 4

En vous inspirant du code donné ci après, interfacez votre dictionnaire via le serveur web de basex.

— Placer le script dans le dossier webapp du dossier basex ; — lancer le serveur (basexhttp ou basexhttp.bat) ;
— dans un navigateur taper l’URL :
      http://localhost:8984/rest?run=testparam.xq&mot=coucou&method=html

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
## Étape 5

Ajouter une page HTML avec un formulaire afin d’offrir une interface d’interrogation de votre dictionnaire semblable à ce qui est présenté [ici](./apercu.png).

###Instructions
###Questions
