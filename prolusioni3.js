//Hamburger menu
const hamburger = document.querySelector("#hamburger");

hamburger.addEventListener("click", () => { 
    const navbar = document.querySelector(".navbar"); 
    navbar.classList.toggle("block"); 
})

//Slide
function slideSetting(index){
    foto[index].classList.add("show");
    testoFoto.innerText = listaFoto[index];
}

let index = 0;
const listaFoto = ["f4_Prol3", "p4_retro", "f5_Prol3"];
const foto = document.querySelectorAll(".foto");
const testoFoto = document.querySelector("#testo_foto");

slideSetting(index);

const avanti = document.querySelector("#avanti"); //Avanti

avanti.addEventListener("click", () => {
    foto[index].classList.remove("show");
    index+=1;

    if(index === foto.length){
        index = 0;
    }

    slideSetting(index);
})

const indietro = document.querySelector("#indietro"); //Indietro

indietro.addEventListener("click", () => {
    foto[index].classList.remove("show");
    index-=1;

    if(index === -1){
        index = listaFoto.length-1;
    }

    slideSetting(index);
})

//Mappatura immagine
const area = document.querySelectorAll("area");
const b = document.querySelectorAll(".numero");

area.forEach( riga => {
    riga.addEventListener("click", () => {
        const verifica = `#${riga.attributes[2].value}`;
        b.forEach( numero => {
            numero.style.backgroundColor = "inherit";
            numero.style.color = "inherit";

            if(numero.attributes[0].value === verifica){
                numero.style.backgroundColor = "#7e4a35";
                numero.style.color = "#fff";
            }

        })
    })
})

//Seleziona correzioni
const correzioni = document.querySelector("#correzioni");
const abbr = document.querySelectorAll(".abbr");
const expan = document.querySelectorAll(".expan");

correzioni.addEventListener("click", () => { 
    abbr.forEach(abbreviazione => abbreviazione.classList.toggle("none"));
    expan.forEach(esp => esp.classList.toggle("inline_block")); 
})

//Seleziona terminologia
const terminologia = document.querySelector("#terminologia");
const termini = document.querySelectorAll(".terms");

terminologia.addEventListener("click", () => termini.forEach( termine => termine.classList.toggle("yellow")));

//Seleziona aggiunte
const aggiunte = document.querySelector("#aggiunte");
const add = document.querySelectorAll(".add");

aggiunte.addEventListener("click", () => add.forEach( agg => agg.classList.toggle("acquamarine")));

//Seleziona cancellature
const cancella = document.querySelector("#cancella");
const del = document.querySelectorAll(".del");

cancella.addEventListener("click", () => del.forEach( canc => canc.classList.toggle("line_through")));

//Seleziona glottonimi
const lang = document.querySelectorAll(".lang");
const glott = document.querySelector("#glottonimi");

glott.addEventListener("click", () => lang.forEach( gl => gl.classList.toggle("purple")));

//Seleziona toponimi
const toponimo = document.querySelector("#toponimi");
const tops = document.querySelectorAll(".top");

toponimo.addEventListener("click", () => tops.forEach( topo => topo.classList.toggle("light_coral")));

//Seleziona date
const data =  document.querySelector("#date");
const date = document.querySelectorAll(".date");

data.addEventListener("click", () => date.forEach( evento => evento.classList.toggle("light_green")));