/**
 * 
 */
  
	$(document).ready(function()
	{
	 	var x = document.getElementById("liInserisci");
	 	x.className='';
	 	x.classList.add("active");
	});

	//TODO Inserire ulteriori validazioni --> da decidere

	function formValidation()
	{
		var copertina = document.inserisciProdotto.copertina;
		var nomeVideogioco = document.inserisciProdotto.titolo;
		var descrizione = document.inserisciProdotto.descrizione;
		var softwareHouse = document.inserisciProdotto.casaProduttrice;
		var dataPubblicazione = document.inserisciProdotto.data;
		var prezzo = document.inserisciProdotto.prezzo;
		var IVA = document.inserisciProdotto.IVA;
		var quantitaNegozio = document.inserisciProdotto.quantitaNegozio;
		var lingue = document.inserisciProdotto.lingua;
		var sottotitoli = document.inserisciProdotto.sottotitolo;


		var arrayFlags = new Array(10);

		//inserire altre validazioni

		arrayFlags[0] = copertinaValidation(copertina);
		arrayFlags[1] = inputValidation(nomeVideogioco);
		arrayFlags[2] = inputValidation(descrizione);
		arrayFlags[3] = inputValidation(softwareHouse);
		arrayFlags[4] = inputValidation(dataPubblicazione);
		arrayFlags[5] = inputValidation(prezzo);
		arrayFlags[6] = inputValidation(IVA);
		arrayFlags[7] = inputValidation(quantitaNegozio);
		arrayFlags[8] = atLeastOneChecked(lingue,"lingua");
		arrayFlags[9] = atLeastOneChecked(sottotitoli,"sottotitoli");


		for(var i=0;i<arrayFlags.length;i++)
		{
			if(!arrayFlags[i])
				return false;
		}

		return true;

	}


	//funzioni validazioni composte per gli input field
	function copertinaValidation(copertina)
	{
		if(copertina.value!="")
		{
			idxDot = copertina.value.lastIndexOf(".") + 1,
			extFile = copertina.value.substr(idxDot, copertina.length).toLowerCase();

			if (extFile == "jpg")
				return setBackgroundColorCorrect(copertina);
			else
			{
				copertina.focus();
				return setBackgroundColorError(copertina);
			}
		}
		else {
			copertina.focus();
			return setBackgroundColorError(copertina);
		}
	}


	//validazione del form al mancato inserimento di input
	function inputValidation(inputField)
	{
		if(inputField.value=="" || inputField==null)
		{
			inputField.focus();
			return setBackgroundColorError(inputField);
		}
		else
			return setBackgroundColorCorrect(inputField);
	}

	function atLeastOneChecked(checkBoxes,checkBoxParentDiv)
	{
		let div = document.getElementById(checkBoxParentDiv);

		for (var i = 0; i < checkBoxes.length; i++) {
			if (checkBoxes[i].checked) {
				div.style.backgroundColor = "white";
				div.removeChild(div.lastChild);
				return true;
			}
		}

		if(div.childElementCount<2) {
			let p = document.createElement("p");
			p.append("Selezionare almeno una lingua!");
			div.append(p);
			div.style.backgroundColor = "rgba(255, 0, 0, 0.3)";
		}

		return false;
	}

	//funzione che prende come parametro il campo di input dove si è verificato l'errore
	//e evidenzia il bordo di rosso e fa comparire il messagio di errore inviato come parametro
	//al di sotto del campo di input
	function setErrorMessage(inputField,errorMessage)
	{
		let formValidation = inputField.parentElement; //div del rispettivo inputField con class formValidation a cui inserire il figlio
		setBackgroundColorError(inputField);

		if(formValidation.childElementCount<2) //controllo per fare comparire al massimo un messaggio di errore
		{
			let p = document.createElement("p");
			p.append(errorMessage);
			formValidation.append(p);
		}

		return false;
	}


	//Setta il Bordo dell'input field preso come argomento di rosso
	function setBackgroundColorError(inputField)
	{
		let formValidation = inputField.parentElement; //div del rispettivo inputField con class formValidation a cui inserire il figlio
		inputField.style.backgroundColor = "rgba(255, 0, 0, 0.3)";
		return false;
	}

	//Setta il Bordo dell'input field preso come argomento di verde
	function setBackgroundColorCorrect(inputField)
	{
		let formValidation = inputField.parentElement; //div del rispettivo inputField con class formValidation a cui inserire il figlio
		inputField.style.backgroundColor = "white";
		return true;
	}
 