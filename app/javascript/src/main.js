$(document).ready(function() {
  $('.search_pre_registration').on("keyup", () => {
    if($('.search_pre_registration').val().length == 14) {
      $.get("/search_pre_registration?cpf=" + $('.search_pre_registration').val(), function (data) {
        console.log(data)
        if(data.error){
          $('.search_error').removeClass('d-none')
          $('.search_cpf').val('')
          $('.search_ap').val('')
          $('.search_bloc').val('')
          $('.search_id').val('')
        }
        else {
          $('.search_error').addClass('d-none')
          $('.search_cpf').val(data.cpf)
          $('.search_ap').val(data.ap)
          $('.search_bloc').val(data.bloc)
          $('.search_id').val(data.id)
        }
      }) 
     }
   })
})

$(document).ready(function () {
  $('.btn-open-close').click(function() {
    let id = $(this).attr('id').split('-')[1]
    $.ajax({
      url: `/admin/assemblies/${id}/open_close_state`,
      method: 'put'
    }).done(function (data) {
      if (data['success']) {
        if (data['state'] == 'open') {
          $('#assembly-' + id).removeClass('btn-outline-success')
          $('#assembly-' + id).addClass('btn-outline-danger')
          $('#assembly-' + id).text('Fechar')

          $('#badge-' + id).removeClass('badge-danger badge-warning')
          $('#badge-' + id).addClass('badge-success')
          $('#badge-' + id).text('Ativa')
        } else {
          $('#assembly-' + id).removeClass('btn-outline-danger')
          $('#assembly-' + id).addClass('btn-outline-success')
          $('#assembly-' + id).text('Abrir')

          $('#badge-' + id).removeClass('badge-success')
          $('#badge-' + id).addClass('badge-danger')
          $('#badge-' + id).text('Finalizado')
        }
      } else {
        alert('Algo deu errado')
      }
    })
  })
});

$(document).ready(function () {
  $('.button-history-votes').click(function () {
    $('.modal-title').html("Histórico de votos")
    $('.votes-list').html("Carregando..")
  })
})

$(document).ready(function () {
  $('.new-user-admin').on( "click" ,function () {
    let id = $('.new-user-admin').val()
    $.get('/new_user_admin?id=' + id, function(data) {
      $('.search_cpf').val(data.cpf)
      $('.search_ap').val(data.ap)
      $('.search_bloc').val(data.bloc)
    })
  })
})
