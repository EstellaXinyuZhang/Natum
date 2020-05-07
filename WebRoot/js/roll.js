window.onload = function() {
    document.querySelector("#roll-to-general").onclick = function() {
        document.querySelector("#type-top").scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"}); //底部齐平
    };
    document.querySelector("#roll-to-general-type").onclick = function() {
        document.querySelector("#type-top").scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"}); //底部齐平
    };
    document.querySelector("#roll-to-home").onclick = function() {
        document.querySelector("#home-top").scrollIntoView({behavior: "smooth", block: "top", inline: "nearest"});
    };
    document.querySelector("#roll-to-company").onclick = function() {
        document.querySelector("#company-top").scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"}); //底部齐平
    };
    document.querySelector("#roll-to-community").onclick = function() {
        document.querySelector("#community-top").scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"}); //底部齐平
    };
    document.querySelector("#roll-to-contact").onclick = function() {
        document.querySelector("#contact-top").scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"}); //底部齐平
    };
}