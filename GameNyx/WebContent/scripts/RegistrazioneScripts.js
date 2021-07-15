
function formValidation()
{
    var username = document.registrazione.username;
    var password = document.registrazione.password;
    var email = document.registrazione.email;
    var nome = document.registrazione.nome;
    var cognome = document.registrazione.cognome;
    var dataNascita = document.registrazione.dataNascita;
    var telefono = document.registrazione.telefono;


       if(usernameValidation(username,5,20))
           if(passwordValidation(password,8,20))
               if(emailValidation(email))
                   if(nomeValidation(nome,5,20))
                       if(cognomeValidation(cognome,5,20))
                           if(dataNascitaValidation(dataNascita))
                               if(telefonoValidation(telefono))
                                    return true;


    return false;
}

//Funzioni composte
function usernameValidation(username,min,max)
{
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

    if(username.value=="")
    {
        return setBackgroundColorError(username);
    }
    else if(!(alphanumeric(username)))
    {
        return setErrorMessage(username,"L'username deve contenere solo numeri e lettere")
    }
    else if(username.value.length<min || username.value.length>max)
    {
        return setErrorMessage(username,"L'username deve contenere almeno "+min+" caratteri e massimo "+max)
    }
    else
        return setFieldCorrect(username);
}

function emailValidation(email)
{
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

    if(email.value=="")
    {
        return setBackgroundColorError(email);
    }
    else if(!(email.value.match(mailformat)))
    {
        return setErrorMessage(email,"email errata");
    }
    else
        return setFieldCorrect(email);
}

function passwordValidation(password,min,max)
{
    var passFormat = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;

    if(password.value=="")
    {
        return setBackgroundColorError(password);
    }
    else if(password.value.length<min || password.value.length>max)
    {
        return setErrorMessage(password,"La password deve contenere almeno "+min+" caratteri e massimo "+max)
    }
    else if(!(password.value.match(passFormat)))
    {
        return setErrorMessage(password,"La password deve contenere almeno una lettera maiuscola, un numero e una lettera");
    }
    else
        return setFieldCorrect(password);
}

function nomeValidation(nome,min,max)
{
    if(nome.value=="")
        return setBackgroundColorError(nome);
    else if(!(allLetter(nome)))
    {
        return setErrorMessage(nome,"Inserire solo lettere")
    }
    else if(nome.value.length<min || nome.value.length>max)
    {
        return setErrorMessage(nome,"Il nome deve contenere almeno "+min+" caratteri e massimo "+max)
    }
    return setFieldCorrect(nome);
}

function cognomeValidation(cognome,min,max)
{
    if(cognome.value=="")
        return setBackgroundColorError(cognome);
    else if(!(allLetter(cognome)))
    {
        return setErrorMessage(cognome,"Inserire solo lettere")
    }
    else if(cognome.value.length<min || cognome.value.length>max)
    {
        return setErrorMessage(cognome,"Il nome deve contenere almeno "+min+" caratteri e massimo "+max)
    }
    else
        return setFieldCorrect(cognome);
}

function dataNascitaValidation(data)
{
     var date = new Date(data.value);
     var dataInput = date.getTime();
     var dataMinima = new Date('12/12/1940').getTime();
     var dataMassima = new Date('1/1/2003').getTime();

    if (dataInput < dataMinima || dataInput > dataMassima) {
        return setErrorMessage(data,"Data non valida");
    }
    else if(data.value=="")
        return setBackgroundColorError(data);
    else
        return setFieldCorrect(data);
}

function telefonoValidation(telefono)
{
    if(telefono.value=="")
        return setBackgroundColorError(telefono);
    else if(!(allnumeric(telefono)))
    {
        return setErrorMessage(telefono,"Il numero di telefono deve contenere solo numeri")
    }
    else if(telefono.value.length<10 || telefono.value.length>10)
    {
        return setErrorMessage(telefono,"Il numero di telefono deve contenere 10 numeri");
    }
    else
        return setFieldCorrect(telefono);
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

function alphanumeric(input) {
    var letters = /^[0-9a-zA-Z]+$/;
    if (input.value.match(letters)) {
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
    document.getElementById(e).style.backgroundColor="white";
}