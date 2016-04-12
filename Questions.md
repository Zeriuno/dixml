## Viviane
Pour la question 2 je ne vois pas comment tu comptes faire,
car normalement il faudrait avoir un fichier où on aura saisi les mots de notre discipline choisi.
Pour chaque mot saisi du fichier, il faudra aller le retrouver sur wiktionnary.
Dans ton exemple, je ne vois pas où tu fais ce lien là (et personnellement je ne vois pas du tout comment le faire...)



## Daniele

Oui, tu as tout à fait raison dans la description des actions. Si on l'écrivait en pseudo-code cela donnerait ceci, je pense:

```
ouvrir(liste.txt, texte, lire)
tantque !FinDeFichier faire
  lire(liste.txt, mot)
  -->
fintantque
```

Et c'est au niveau de la flèche qu'on insère la requête de la page du wiktionary.


## Viviane
Au niveau de l'étape 3, cela signifierai qu'on ait sur notre fichier au moins 100 mots (?)

## Daniele

Oui.

## Viviane
Concernant ta DTD, je suis plutôt d'accord sauf que pour moi 1 mot peut avoir plusieurs sens différents et du coup, plusieurs traduction (selon le sens).
cependant comme on doit faire un dictionnaire sur un thème précis, c'est vrai que l'on peut faire l'hypothèse que l'on récupère que "le bon sens" proposé dans wiktionnary

## Daniele
Je suis de cet avis. Ou bien on garde plusieurs définitions qui vont génériquement dans l'élément "definition", en mélangeant les sens différents.

## Viviane
(mais du coup, comment ajouter la condition lors de tes requêtes Xpath ? Je ne pense pas que "les sens" sont "normalisés" selon la thématique que tu auras choisi)  

## Daniele

1. Attention, ce sont des requêtes XQuery (Xpath sert à écrire du SVG).
2. La question est tout à fait valide. Une première réponse est "on modifie à la main", comme il est autorisé. Ou bien on trouve une alternative, mais il me semble difficile d'y répondre sans des exemples concrets. Si on arrive à dérouler l'exercice jusqu'ici je crois qu'on pourra mieux s'orienter.
