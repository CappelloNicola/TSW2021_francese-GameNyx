
    //algoritmo calcolo livello --> da decidere
    function avanzamentoBarraEsperienza(quantity)
    {
        let nGiochiAcquistati = quantity;
        let xpAttuale=0;
        let barraInterna = document.getElementById("barraEspInterna");

         while(nGiochiAcquistati>0)
         {
            if(nGiochiAcquistati>6)
            xpAttuale+=20;
            if(nGiochiAcquistati<=6 && nGiochiAcquistati>3)
            xpAttuale+=40;
            if(nGiochiAcquistati<=3 && nGiochiAcquistati>1)
            xpAttuale+=80;

            nGiochiAcquistati--;
         }

        barraInterna.style.width=xpAttuale%100+"%";

        livelloAttuale = Math.trunc(xpAttuale/100);

        livello.innerText="Livello "+livelloAttuale;

        //TODO IMPLEMENTARE SCONTI IN BASE AL LIVELLO

    }






