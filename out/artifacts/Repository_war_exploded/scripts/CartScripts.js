
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
 


function formValidationSpedizione()
{
    var indirizzo = document.checkoutForm.indirizzo;
    var numeroCivico = document.checkoutForm.numeroCivico;
    var cap = document.checkoutForm.cap;
    var citta = document.checkoutForm.citta;
    var provincia = document.checkoutForm.provincia;
    var intestatario = document.checkoutForm.intestatario;
    var numeroCarta = document.checkoutForm.numeroCarta;
    var meseScadenza = document.checkoutForm.meseScadenza;
    var annoScadenza = document.checkoutForm.annoScadenza;
    var cvv = document.checkoutForm.cvv;



    if(indirizzoValidation(indirizzo,10,200))
        if(numeroCivicoValidation(numeroCivico,1,4))
            if(capValidation(cap))
                if(cittaValidation(citta,3,60))
                    if(provinciaValidation(provincia,5,20))
                        if(intestatarioValidation(intestatario,10,50))
                            if(numeroCartaValidation(numeroCarta))
                                if(meseValidation(meseScadenza))
                                    if(annoValidation(annoScadenza))
                                        if(cvvValidation(cvv))
                                            return true;


    return false;
}


//Funzioni composte
function indirizzoValidation(indirizzo,min,max)
{

    if(indirizzo.value=="")
    {
        return setBackgroundColorError(indirizzo);
    }
    else if(!(addressRegex(indirizzo)))
    {
        return setErrorMessage(indirizzo,"L'indirizzo deve contenere solo numeri e lettere")
    }
    else if(indirizzo.value.length<min || indirizzo.value.length>max)
    {
        return setErrorMessage(indirizzo,"L'indirizzo deve contenere almeno "+min+" caratteri e massimo "+max)
    }
    else
        return setFieldCorrect(indirizzo);
}

function numeroCivicoValidation(numeroCivico,min,max)
{

    if(numeroCivico.value=="")
    {
        return setBackgroundColorError(numeroCivico);
    }
    else if(numeroCivico.value.length<min || numeroCivico.value.length>max)
    {
        return setErrorMessage(numeroCivico,"Il numero civico deve contenere almeno "+min+" numeri e massimo "+max)
    }
    else if(!(allnumeric(numeroCivico)))
    {
        return setErrorMessage(numeroCivico,"Deve contenere solo numeri");
    }
    else
        return setFieldCorrect(numeroCivico);
}

function capValidation(cap)
{

    if(cap.value=="")
    {
        return setBackgroundColorError(cap);
    }
    else if(cap.value.length<5 || cap.value.length>5)
    {
        return setErrorMessage(cap,"Il cap deve essere lungo 5 numeri")
    }
    else if(!(allnumeric(cap)))
    {
        return setErrorMessage(cap,"Il cap deve contenere solo numeri");
    }
    else
        return setFieldCorrect(cap);
}

function cittaValidation(citta,min,max)
{
    if(citta.value=="")
        return setBackgroundColorError(citta);
    else if(!(allLetter(citta)))
    {
        return setErrorMessage(citta,"Inserire solo lettere")
    }
    else if(citta.value.length<min || citta.value.length>max)
    {
        return setErrorMessage(citta,"Il nome della città deve contenere almeno "+min+" caratteri e massimo "+max)
    }
    return setFieldCorrect(citta);
}

function provinciaValidation(provincia,min,max)
{
    if(provincia.value=="")
        return setBackgroundColorError(provincia);
    else if(!(allLetter(provincia)))
    {
        return setErrorMessage(provincia,"Inserire solo lettere")
    }
    else if(provincia.value.length<min || provincia.value.length>max)
    {
        return setErrorMessage(provincia,"Il nome della provincia deve contenere almeno "+min+" caratteri e massimo "+max)
    }
    else
        return setFieldCorrect(provincia);
}


function intestatarioValidation(nome,min,max)
{

    var nomeCognome = /^[a-z ,.'-]+$/i;

    if(nome.value=="")
    {
        return setBackgroundColorError(nome);
    }
    else if(!(nome.value.match(nomeCognome)))
    {
        return setErrorMessage(nome,"Nome e cognome non validi")
    }
    else if(nome.value.length<min || nome.value.length>max)
    {
        return setErrorMessage(nome,"Il nome dell'intestatario deve contenere almeno "+min+" caratteri e massimo "+max)
    }
    else
        return setFieldCorrect(nome);
}

function numeroCartaValidation(numeroCarta)
{

    if(numeroCarta.value=="")
    {
        return setBackgroundColorError(numeroCarta);
    }
    else if(numeroCarta.value.length<16 || numeroCarta.value.length>16)
    {
        return setErrorMessage(numeroCarta,"Il numero della carta deve essere lungo 16 numeri")
    }
    else if(!(allnumeric(numeroCarta)))
    {
        return setErrorMessage(numeroCarta,"Deve contenere solo numeri");
    }
    else
        return setFieldCorrect(numeroCarta);
}

function meseValidation(meseScadenza)
{

    if(meseScadenza.value=="")
    {
        return setBackgroundColorError(meseScadenza);
    }
    else if(meseScadenza.value<1 || meseScadenza.value>12)
    {
        return setErrorMessage(meseScadenza,"Mese non valido")
    }
    else if(!(allnumeric(meseScadenza)))
    {
        return setErrorMessage(meseScadenza,"Il mese deve essere un numero");
    }
    else
        return setFieldCorrect(meseScadenza);
}

function annoValidation(annoScadenza)
{

    if(annoScadenza.value=="")
    {
        return  setBackgroundColorError(annoScadenza);
    }

    else if(annoScadenza.value<2021 || annoScadenza.value>2050)
    {
        return setErrorMessage(annoScadenza,"Anno non valido o carta scaduta")
    }

    else if(!(allnumeric(annoScadenza)))
    {
        return setErrorMessage(annoScadenza,"L'anno deve essere un numero");
    }
    else
        return setFieldCorrect(annoScadenza);
}

function cvvValidation(cvv)
{

    if(cvv.value=="")
    {
        return  setBackgroundColorError(cvv);
    }

    else if(cvv.value.length<3 || cvv.value.length>3)
    {
        return setErrorMessage(cvv,"Il cvv deve essere lungo 3 numeri")
    }

    else if(!(allnumeric(cvv)))
    {
        return setErrorMessage(cvv,"Il cvv deve essere un numero");
    }
    else
        return setFieldCorrect(cvv);
}

function cittaValidation(citta,min,max)
{
    if(citta.value=="")
        return setBackgroundColorError(citta);
    else if(!(allLetter(citta)))
    {
        return setErrorMessage(citta,"Inserire solo lettere")
    }
    else if(citta.value.length<min || citta.value.length>max)
    {
        return setErrorMessage(citta,"Il nome della città deve contenere almeno "+min+" caratteri e massimo "+max)
    }
    return setFieldCorrect(citta);
}

function provinciaValidation(provincia,min,max)
{
    if(provincia.value=="")
        return setBackgroundColorError(provincia);
    else if(!(allLetter(provincia)))
    {
        return setErrorMessage(provincia,"Inserire solo lettere")
    }
    else if(provincia.value.length<min || provincia.value.length>max)
    {
        return setErrorMessage(provincia,"Il nome della provincia deve contenere almeno "+min+" caratteri e massimo "+max)
    }
    else
        return setFieldCorrect(provincia);
}

//Funzioni base
function setBackgroundColorError(inputField)
{
    inputField.focus();
    inputField.style.backgroundColor = "#FF9494";
    return false;
}

//Resetta il field di input se l'input è giusto ed era settato come errato
function setFieldCorrect(inputField)
{
    let formValidation = inputField.parentElement; //div del rispettivo inputField con class formValidation a cui inserire il figlio

    let pastError = formValidation.querySelector('small');
    if(pastError)
    {
        inputField.style.backgroundColor = "white";
        pastError.remove();
    }

    return true;
}

function setErrorMessage(inputField,message)
{
    inputField.focus();
    setBackgroundColorError(inputField);
    let formField = inputField.parentElement;
    let error = formField.querySelector('small');
    error.textContent = message;
    return false;
}

function addressRegex(input) {
    var address = "[A-Za-z0-9'\.\-\s\,]";

    if (input.value.match(address)) {
        return true;
    } else {
        return false;
    }
}

function allLetter(input) {
    var letters = /^[A-Za-z]+$/;
    if (input.value.match(letters))
        return true;
    else
        return false;
}

function allnumeric(input)
{
    var numbers = /^[0-9]+$/;
    if(input.value.match(numbers))
        return true;
    else
        return false;
}

function resetField(e)
{
    document.getElementsByName(e)[0].style.backgroundColor="white";
}

