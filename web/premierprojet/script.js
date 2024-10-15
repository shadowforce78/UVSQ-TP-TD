function button(){
    input = document.getElementsByClassName("input")[0].value;

    setInterval(function (){
        let p = document.createElement("p");
        p.innerHTML = input;
        p.style.position = "absolute";
        p.style.top = Math.floor(Math.random() * 100) + "vh";
        p.style.left = Math.floor(Math.random() * 100) + "vw";
        document.body.appendChild(p);
    }, 1000);


}