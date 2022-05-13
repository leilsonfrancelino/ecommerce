var App_carrinho = function(){
    
    var del_item_cart = function(){
        $('.btn-del-item').on('click', function(){
           var produto_id = $(this).attr('data-id');
         

           //alert(produto_id );

           $.ajax({
            type: 'post',
            url: BASE_URL + 'carrinho/delete',
            dataType: 'json',
            data: {
                produto_id: produto_id, 
            },
           }).then(function(response){
              
            if(response.erro === 0 ) {
                $(this).parent().parent().remove();
                window.location.href = BASE_URL + 'carrinho';
            }else{
                alert('Não foi possivel excluir o produto!');
            }
                console.log(response);
           });
        });
    }

    var altera_quantidade_carrinho = function(){

        $('.btn-altera-quantidade').on('click', function(){
           var produto_id = $(this).attr('data-id');
           var produto_quantidade = $("#produto_" + produto_id).val();
         
            if(produto_quantidade == "" || produto_quantidade < 1){
               // alert("informe a quantidade do produto");
                $('#mensagem').html('<div class="alert alert-success alert-dismissible fade show mt-2" role="alert"> A quantidade não pode ser zero <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');

            }else{
                $.ajax({
                    type: 'post',
                    url: BASE_URL + 'carrinho/update',
                    dataType: 'json',
                    data: {
                        produto_id: produto_id, 
                        produto_quantidade: produto_quantidade,
                    },
                   }).then(function(response){
                      
                    if(response.erro === 0 ) {
                     
                        window.location.href = BASE_URL + 'carrinho';
                        
                   }else{

                    $('#mensagem').html('<div class="alert alert-success alert-dismissible fade show mt-2" role="alert"> ' + response.mensagem + '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');

                    }
                        console.log(response);
                  }); 
            }

         
        });
    }

    var limpa_carrinho = function(){

        $('.btn-limpa-carrinho').on('click', function(){
            $.ajax({
                type: 'post',
                url: BASE_URL + 'carrinho/clean',
                dataType: 'json',
                data: {
                    clean: true, 
                    
                },
               }).then(function(response){
                  
                if(response.erro === 0 ) {
                 
                    window.location.href = BASE_URL + 'carrinho';
                    
               }else{
                alert('Houve um erro ao limpar o carrinho');
               // $('#mensagem').html('<div class="alert alert-success alert-dismissible fade show mt-2" role="alert"> ' + response.mensagem + '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');

                }
                    console.log(response);
              }); 

         
        });
    }

    var calcula_frete = function(){
        $('#btn-calcula-frete-carrinho').on('click', function(){

           var cep = $('#cep').val();
         

          // alert(cep);

           $.ajax({
            type: 'post',
            url: BASE_URL + 'carrinho/calcula_frete',
            dataType: 'json',
            data: {
               cep: cep, 
            },
           }).then(function(response){
              
            if(response.erro === 0 ) {
                $('#retorno-frete').html(response.retorno_endereco);
                get_opcao_frete_carrinho();
            }else{
                $('#retorno-frete').html(response.retorno_endereco);
            }
                console.log(response);
           });
        });
    }

    var get_opcao_frete_carrinho = function(){
        $('[name="opcao_frete_carrinho"]').on('click', function(){
            var opcao_frete_escolhido = $(this).attr('data-valor_frete');
            var total_final_carrinho = $(this).attr('data-valor_final_carrinho');

            $('#opcao_frete_escolhido').html('R$&nbsp;'+ opcao_frete_escolhido);
            $('#total_final_carrinho').html('R$&nbsp;'+ total_final_carrinho);
        });
    }


    return {
        init:function(){
           
            del_item_cart();
            altera_quantidade_carrinho();
            limpa_carrinho();
            calcula_frete();
        }
    }
}();//Inicializa ao carregar

jQuery(document).ready(function(){
    $(window).keydown(function(event){
        if(event.keyCode == 13){
            event.preventDefault();
            return false;
        }
    });

    App_carrinho.init();
});