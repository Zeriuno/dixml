declare variable $mot as xs:string external;
<html>
<head>
<title>Rechercher dans dictionnaire : {$mot}</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
</head>
<body style="margin: auto; padding: 10px; font-family: Cambria, serif; font-size: 0.85em; width: 640px;">
<form action ="" method="get" style="padding: 5px; border: 1px solid black; width: 480px;">
    <h1 style="color: orange;">Rechercher</h1>
    <table>
			<tr>
				<td><label for="mot">Mot : </label></td>
        <td> <input type="hidden" name="run" value="traductionMots.xq" /></td>
				<td> <input type="text" size="35" name="mot" id="mot" placeholder="Taper un mot ..." /></td>
	      <td> <input type="hidden" name="method" value="html" /></td>
				<td> <input type="submit" /></td>
			</tr>
    </table>
</form>
<h2 style="color: blue;">Resultat de recherche : </h2>
<h3><u>Mot</u> : {$mot}</h3>
{
let $fichier := "dictionnaire.xml"
for $entree in doc($fichier)//Mot
where $entree/text() = $mot
return
  <div>
  <h3><u>Catégorie grammaticale</u> : {$entree/../CategorieGram}</h3>
  <table>
    <tr>
      <th style="width: 160px; text-align: left; color: white; background-color: green;">Langue</th>
      <th style="width: 160px; text-align: left; color: white; background-color: green;">Traduction</th>
    </tr>
    {
      for $traduction in $entree/../Traductions/T
      return
      <tr><td style="border-top: 1px solid green; border-right: 1px solid green;"><em>{$traduction/Langue}</em></td><td style="border-top: 1px solid green;">{$traduction/MotTraduit}</td></tr>
    }
  </table>
  </div>
}
</body>
</html>