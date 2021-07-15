/**
 * 
 */
 
 	/*Questa funziona setta il valore di default del select in ProdottoAdmin.jsp
 		Esso sarà uguale al genere di default del prodotto*/
	function changeSelected(defaultValue, id)
	{
		var temp = defaultValue;
		var mySelect = document.getElementById(id);
		
		for(var i, j = 0; i = mySelect.options[j]; j++) {
		    if(i.value == temp) {
		        mySelect.selectedIndex = j;
		        break;
		    }
		}
	}
	
	function checkBoxes(Array, name)
	{
		var j;
		for(j=0; j<Array.length; j++)
		{
			var x = document.getElementsByName(name);
			var i;
			for (i = 0; i < x.length; i++) 
			{
			  if (x[i].value == Array[j].trim()) //trim() rimuove gli spazi bianchi dall'inizio e dalla fine della stringa 
			  {
			    x[i].checked = true;
			  }
			}
		}
	}
	
	function changePrice() 
	{
		var price=document.getElementById("priceForAdmin").value;
		var iva=document.getElementById("ivaForAdmin").value; 
		var fullPrice = document.getElementById("totalPriceForAdmin");
		
		var n=(price*iva)/100;
		var fullPriceValue=Number(price) + Number(n);
		var truncated = Math.floor(fullPriceValue * 100) / 100;
		
		
		fullPrice.innerText=truncated;
	}