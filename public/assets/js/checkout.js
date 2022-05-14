var App_checkout = function(){
    
 /*
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
                $('#mensagem').html('<div class="alert alert-success alert-dismissible fade show mt-2" role="alert"> A quantidade não pode ser Zero(0) <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');

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
*/

    var set_session_payment = function(){
        $.ajax({
            url: BASE_URL + 'pagar/pag_seguro_session_id',
            dataType: 'json',
            success: function(response){
                if(response.erro === 0){
                    var session_id = response.session_id;

                    if(session_id){
                        PagSeguroDirectPayment.setSessionId(session_id);
                    }else{
                        window.location.href = BASE_URL + 'checkout';
                    }
                }else{
                   console.log(response.mensagem);
                }
            },

            error: function(error){
                alert('Não foi possivel conectar o pagseguro');
            }
        });
    }

    var calcula_frete = function(){
        $('#btn-busca-cep').on('click', function(){

          // var cliente_cep = $('#cliente_cep').val();
          var cliente_cep = $("#cliente_cep").val();

          // alert(cliente_cep);
          

           $.ajax({
            type: 'post',
            url: BASE_URL + 'checkout/calcula_frete',
            dataType: 'json',
            data: {
               cliente_cep: cliente_cep, 
            },
            beforeSend: function(){
                $('#erro-frete').html('');
                $('.endereco').addClass('d-none');
                $('#btn-busca-cep').html('<span class="text-black"> <i class="fa fa-cog fa-spin"></i> &nbsp Calculando... </span>');
            },
           }).then(function(response){
              
            if(response.erro === 0 ) {
                $('.endereco').removeClass('d-none');
                $('#btn-busca-cep').html('Calcular Frete');
                $('#retorno-frete').html(response.retorno_endereco);

                $('[name="cliente_endereco"]').val(response.endereco);
                $('[name="cliente_bairro"]').val(response.bairro);
                $('[name="cliente_cidade"]').val(response.cidade);

               
                get_opcao_frete_carrinho();
            }else{
                $('#btn-busca-cep').html('Calcular Frete');
                $('#erro-frete').html(response.retorno_endereco);
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

    
    var pagar_boleto = function(){

        $('#btn-pagar-boleto').on('click', function(){
            
           $('[name="hash_pagamento"]').val(PagSeguroDirectPayment.getSenderHash());

           var form = $('.do-payment');

            $.ajax({
                type: "post",
                url: BASE_URL + 'pagar/boleto',
                dataType: 'json',
                data: form.serialize(),
                beforeSend: function(){
                    //Apagar erros quando houver
                    $('#opcao_boleto').html('<span class="text-black"> <i class="fa fa-cog fa-spin"></i> &nbsp Processando Pagamento... </span>');
                   
                    $('#cliente_nome').html('');
                    $('#cliente_sobrenome').html('');
                    $('#cliente_data_nascimento').html('');
                    $('#cliente_cpf').html('');
                    $('#cliente_email').html('');
                    $('#opcao_frete_carrinho').html('');
                    $('#cliente_telefone_movel').html('');
                    $('#cliente_cep').html('');
                    $('#cliente_endereco').html('');
                    $('#cliente_numero_endereco').html('');
                    $('#cliente_bairro').html('');
                    $('#cliente_cidade').html('');
                    $('#cliente_estado').html('');
                    $('#cliente_senha').html('');
                    $('#cliente_confirmacao').html('');

                },


                success: function(response){
                    if(response.erro === 0){

                      window.location = BASE_URL + 'sucesso';
                      //alert('Sucesso');
                      $('#opcao_boleto').html('');

                    }else{
                        console.log(response.mensagem);
                        $('#opcao_boleto').html('');
                        
                        $('#cliente_nome').html(response.cliente_nome);
                        $('#cliente_sobrenome').html(response.cliente_sobrenome);
                        $('#cliente_data_nascimento').html(response.cliente_data_nascimento);
                        $('#cliente_cpf').html(response.cliente_cpf);
                        $('#cliente_email').html(response.cliente_email);
                        $('#opcao_frete_carrinho').html(response.opcao_frete_carrinho);
                        $('#cliente_telefone_movel').html(response.cliente_telefone_movel);
                        $('#cliente_cep').html(response.cliente_cep);
                        $('#cliente_endereco').html(response.cliente_endereco);
                        $('#cliente_numero_endereco').html(response.cliente_numero_endereco);
                        $('#cliente_bairro').html(response.cliente_bairro);
                        $('#cliente_cidade').html(response.cliente_cidade);
                        $('#cliente_estado').html(response.cliente_estado);
                        $('#cliente_senha').html(response.cliente_senha);
                        $('#cliente_confirmacao').html(response.cliente_confirmacao);

                    }
                },

                error: function(error){
                    alert('Não foi possivel completar a compra');
                }
            });
        });

       
    }

    var pagar_debito_conta = function(){

        $('#btn-debito-conta').on('click', function(){
            
           $('[name="hash_pagamento"]').val(PagSeguroDirectPayment.getSenderHash());

           var form = $('.do-payment');

            $.ajax({
                type: "post",
                url: BASE_URL + 'pagar/debito_conta',
                dataType: 'json',
                data: form.serialize(),
                beforeSend: function(){
                    //Apagar erros quando houver
                    $('#opcao_bnt_debito_conta').html('<span class="text-black"> <i class="fa fa-cog fa-spin"></i> &nbsp Processando Pagamento... </span>');
                   
                    $('#cliente_nome').html('');
                    $('#cliente_sobrenome').html('');
                    $('#cliente_data_nascimento').html('');
                    $('#cliente_cpf').html('');
                    $('#cliente_email').html('');
                    $('#opcao_frete_carrinho').html('');
                    $('#cliente_telefone_movel').html('');
                    $('#cliente_cep').html('');
                    $('#cliente_endereco').html('');
                    $('#cliente_numero_endereco').html('');
                    $('#cliente_bairro').html('');
                    $('#cliente_cidade').html('');
                    $('#cliente_estado').html('');
                    $('#cliente_senha').html('');
                    $('#cliente_confirmacao').html('');
                    $('#opcao_banco').html('');

                },


                success: function(response){
                    if(response.erro === 0){

                      window.location = BASE_URL + 'sucesso';
                      //alert('Sucesso');
                      $('#opcao_bnt_debito_conta').html('');

                    }else{
                        console.log(response.mensagem);
                        $('#opcao_bnt_debito_conta').html('');
                        
                        $('#cliente_nome').html(response.cliente_nome);
                        $('#cliente_sobrenome').html(response.cliente_sobrenome);
                        $('#cliente_data_nascimento').html(response.cliente_data_nascimento);
                        $('#cliente_cpf').html(response.cliente_cpf);
                        $('#cliente_email').html(response.cliente_email);
                        $('#opcao_frete_carrinho').html(response.opcao_frete_carrinho);
                        $('#cliente_telefone_movel').html(response.cliente_telefone_movel);
                        $('#cliente_cep').html(response.cliente_cep);
                        $('#cliente_endereco').html(response.cliente_endereco);
                        $('#cliente_numero_endereco').html(response.cliente_numero_endereco);
                        $('#cliente_bairro').html(response.cliente_bairro);
                        $('#cliente_cidade').html(response.cliente_cidade);
                        $('#cliente_estado').html(response.cliente_estado);
                        $('#cliente_senha').html(response.cliente_senha);
                        $('#cliente_confirmacao').html(response.cliente_confirmacao);
                        $('#opcao_banco').html(response.opcao_banco);

                    }
                },

                error: function(error){
                    alert('Não foi possivel completar a compra');
                }
            });
        });

       
    }

    var pagar_cartao_credito = function(){

        $('#btn-pagar-cartao').on('click', function(){

            gerar_token_pagamento();
            
            $('[name="hash_pagamento"]').val(PagSeguroDirectPayment.getSenderHash());

            var form = $('.do-payment');
 
             $.ajax({
                 type: "post",
                 url: BASE_URL + 'pagar/cartao_credito',
                 dataType: 'json',
                 data: form.serialize(),
                 beforeSend: function(){
                     //Apagar erros quando houver
                     $('#opcao_pagar_cartao').html('<span class="text-black"> <i class="fa fa-cog fa-spin"></i> &nbsp Processando Pagamento... </span>');
                    
                     $('#cliente_nome').html('');
                     $('#cliente_sobrenome').html('');
                     $('#cliente_data_nascimento').html('');
                     $('#cliente_cpf').html('');
                     $('#cliente_email').html('');
                     $('#opcao_frete_carrinho').html('');
                     $('#cliente_telefone_movel').html('');
                     $('#cliente_cep').html('');
                     $('#cliente_endereco').html('');
                     $('#cliente_numero_endereco').html('');
                     $('#cliente_bairro').html('');
                     $('#cliente_cidade').html('');
                     $('#cliente_estado').html('');
                     $('#cliente_senha').html('');
                     $('#cliente_confirmacao').html('');
                     $('#opcao_banco').html('');
 
                 },
 
 
                 success: function(response){
                     if(response.erro === 0){
 
                       window.location = BASE_URL + 'sucesso';
                       //alert('Sucesso');
                      
 
                     }else{

                        if(response.token_pagamento){
                            $("opcao_pagar_cartao").html('<span class="text-danger"> &nbsp Verifique os dados do cartão de credito e tente novamente </span>');
                            gerar_token_pagamento();
                        }
                        

                         $('#cliente_nome').html(response.cliente_nome);
                         $('#cliente_sobrenome').html(response.cliente_sobrenome);
                         $('#cliente_data_nascimento').html(response.cliente_data_nascimento);
                         $('#cliente_cpf').html(response.cliente_cpf);
                         $('#cliente_email').html(response.cliente_email);
                         $('#opcao_frete_carrinho').html(response.opcao_frete_carrinho);
                         $('#cliente_telefone_movel').html(response.cliente_telefone_movel);
                         $('#cliente_cep').html(response.cliente_cep);
                         $('#cliente_endereco').html(response.cliente_endereco);
                         $('#cliente_numero_endereco').html(response.cliente_numero_endereco);
                         $('#cliente_bairro').html(response.cliente_bairro);
                         $('#cliente_cidade').html(response.cliente_cidade);
                         $('#cliente_estado').html(response.cliente_estado);
                         $('#cliente_senha').html(response.cliente_senha);
                         $('#cliente_confirmacao').html(response.cliente_confirmacao);
                         
 
                     }
                 },
 
                 error: function(error){
                     alert('Não foi possivel completar a compra');
                 }
             });
         
        });
        
        function gerar_token_pagamento(){
            var card_titular = $('[name="cliente_nome_titular"]').val();
            if(!card_titular){
                $("#cliente_nome_titular").html("Obrigatório");
                return false;
            }

            var card_number = $('[name="numero_cartao"]').val();
            if(!card_number){
                $("#numero_cartao").html("Obrigatório");
                return false;
            }

            var card_expire = $('[name="validade_cartao"]').val();
            if(!card_expire){
                $("#validade_cartao").html("Obrigatório");
                return false;
            }else{
                card_expire = card_expire.split('/');

                var mes_expire = card_expire[0];
                var ano_expire = card_expire[1];

            }

            var card_cvv = $('[name="codigo_seguranca"]').val();
            if(!card_cvv){
                $("#codigo_seguranca").html("Obrigatório");
                return false;
            }

           var bandeira = "";

           PagSeguroDirectPayment.getBrand({

            cardBin: card_number.replace(" ", ""), //Retira o espaço do número do cartão para validar o cardBin.

            success: function(response){
                bandeira = response.brand['name'];
                
                if(bandeira){
                    //Gerada a Bandeira, Gerar o cardToken
                    PagSeguroDirectPayment.createCardToken({
                        cardNumber: card_number, 
                        brand: bandeira,
                        cvv: card_cvv,
                        expirationMonth:mes_expire,
                        expirationYear:ano_expire,
                      

                        success: function(response){
                            //Caso o token seja gerado.
                            var token_pagamento = response.card.token;
                            
                            if(token_pagamento){
                                $("#token_pagamento").val(token_pagamento);
                            }else{
                                alert('Token de pagamento não foi gerado' + response.message);
                            }

                        },
                        error: function(response){

                            //Caso o token não seja gerado.
                            alert('Erro ao usar o cartão, verifique os dados...' + response.message);
                        }
                    });

                }else{
                    //Não gerou a bandeira 
                    alert('Não foi possivel gerar a bandeira do cartão' + response.statusMessage);
                }
            },
            error: function(response){
                alert(response);
            }


           });
        }
    
       
    }

    
    var forma_pagamento = function(){
        $('.forma_pagamento').on('change', function(){
            var opcao = $(this).val();
            switch (opcao){
                case '1':
                    $('.cartao').removeClass('d-none');
                    $('.opcao_debito_conta').addClass('d-none');
                    $('.opcao-boleto').addClass('d-none');
                    $('.cartao input').prop('disabled', false);
                    $('.opcao_debito_conta select').prop('disabled', true);
                    break ;
                    
                case '2':
                    $('.cartao').addClass('d-none');
                    $('.opcao-boleto').removeClass('d-none');
                    $('.opcao_debito_conta').addClass('d-none');
                    $('.cartao input').prop('disabled', true);
                    $('.opcao_debito_conta select').prop('disabled', true);
                    break ;

                case '3':
                    $('.cartao').addClass('d-none');
                    $('.opcao-boleto').addClass('d-none');
                    $('.opcao_debito_conta').removeClass('d-none');
                    $('.cartao input').prop('disabled', true);
                    $('.opcao_debito_conta select').prop('disabled', false);
                    break ;

               

            }
        });
    }


    return {
        init:function(){
            set_session_payment();
           
            calcula_frete();
            forma_pagamento();
            pagar_boleto();
            pagar_debito_conta();
            pagar_cartao_credito();
          
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

    App_checkout.init();
});