/**
 * 
 */
 
 	/*Questa funziona setta il valore di default del select in ProdottoAdmin.jsp
 		Esso sarà uguale al genere di default del prodotto*/
	function changeSelected(defaultValue)
	{
		var temp = defaultValue;
		var mySelect = document.getElementById('genreSelect');
		
		for(var i, j = 0; i = mySelect.options[j]; j++) {
		    if(i.value == temp) {
		        mySelect.selectedIndex = j;
		        break;
		    }
		}
	}