
//Script che mostra a ripetizione per 8 secondi ciascuna le 3 immagini nello slideshow
//con la possibilità di andare avanti e indietro tra le immagini

    var slideIndex = 1;
    var t=0;  //variabile per il timer
    showSlides(slideIndex);

    function plusSlides(n)
    {
        clearTimeout(t);  //resetta il timer per non aggiungere timer di continuo e velocizzare la slideshow
        showSlides(slideIndex += n,true);
    }

    function showSlides(n,next)
    {
        var i;
        var slides = document.getElementsByClassName("mySlides");

        if(next==undefined)   //se il pulsante avanti non è premuto allora la slideshow continua in automatico
          slideIndex++;

        if(n > slides.length)
          slideIndex = 1;

        if(n < 1)
          slideIndex = slides.length;

        for (i = 0; i < slides.length; i++)
        {
          slides[i].style.display = "none";
        }

        if(slideIndex>slides.length)
          slideIndex=1;

        slides[slideIndex - 1].style.display = "block";

        t = setTimeout(showSlides,6000);  //mostra l'immagine per 8 secondi tramite un timeout
    }

    //Evidenziamento del prodotto al passaggio del mouse
    $(function() {
        $(".productElement").hover(function () {
            this.style.boxShadow="0 4px 8px 0 rgb(255 255 255 / 30%), 0 6px 20px 0 rgb(255 255 255 / 30%)";
        }).mouseleave(function (){
            this.style.boxShadow="none";
        });

    });

