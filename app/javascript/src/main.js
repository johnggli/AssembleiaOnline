/*$(document).ready(function() {
    $('#search_pre_registration').on("keyup", () => {
        if($('#search_pre_registration').val().length == 14) {
            $get("/search_pre_register_cpf?cpf=" + $('#search_pre_registration').val(), function (data) {
                console.log(data)
            }) 
        }
    })
})*/

const { ready } = require("jquery");

/*
$(document).ready(function() {
    $('.search_pre_registration').on("keyup", () => {
        if($('.search_pre_registration').val().length == 14) {
            let params = $('.search_pre_registration').val()
            $.get('/search_pre_registration?cpf=111.111.111-11', function(data){ 
                alert(data); 
            });
        };
    });
});
*/
$.get("/search_pre_registration", () => {
    alert("Deu certo")
})