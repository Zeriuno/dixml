declare variable $mot as xs:string external;
<html>
<head>
<title>Recherche dictionnaire {$mot}</title> 
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
</head>
<body>
<div style="float:left">
  <form action ="" method="get">
    <h1>Dictionnaire multilingue</h1>
    <table>
			<tr>
				<td> <label for="mot">Terme choisi : </label></td>
        <td> <input type="hidden" name="run" value="testparam1.xq" /></td>
				<td> <input type="text" size="35" name="mot" id="mot" placeholder="Saisir le mot" /></td>
	      <td> <input type="hidden" name="method" value="html" /></td>
				<td> <input type="submit" /></td>
			</tr>
    </table>
  </form>
</div>
<div style="float:right; padding:10px; border-left: 1px solid">
  <h2>Résultats</h2>
  <h3>{$mot}</h3>
{
  let $fichier := "dico.xml"
  for $entree in doc($fichier)//mot
  where $entree/text() = $mot
  return
    <div>
      <h3>Catégorie grammaticale : {$entree/../catgram}</h3>
      
      {for $traduction in $entree/../traduction
      return    
      <ul>
      <li>{$traduction/langue} : {$traduction/trad}</li>
      </ul>}  
 </div>
}
</div>
</body>
</html>
