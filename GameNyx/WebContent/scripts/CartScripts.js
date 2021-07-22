/**
 * 
 */
 
 function checkQuantity(quantity)
 {
 	var obj=document.getElementById("quantitaAcquistabile");
 	if(obj.value>quantity)
 	{
 		obj.value=quantity;
 		alert("Solo "+quantity+" scorte disponibili!");
 	}
 }
 