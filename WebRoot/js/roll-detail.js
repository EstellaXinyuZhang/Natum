window.onload = function() {
    document.querySelector("#detail").onclick = function() {
        document.querySelector(".BG2-container").scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"}); //底部齐平
    };
    document.querySelector("#comment").onclick = function() {
        document.querySelector(".BG3-container").scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"});
    };
    document.querySelector("#parameters").onclick = function() {
        document.querySelector(".BG4-container").scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"});
    };
}