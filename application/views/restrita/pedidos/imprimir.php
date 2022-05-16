


<!-- Main Content -->
    <div class="container" style="margin-top: 3rem;">
        <section class="section">
          <div class="section-body">
            <!-- add content here -->
            <div class="row">
              <div class="col-12">
                <div class="card">
               
                  <div class="card-header">
                  <h4><?php echo $titulo ?></h4>
                   
                  </div>

                  <div class="card-body">
                  <h5>Dados do Cliente</h5>
                  <p class="mt-2"> Cliente :  <?php echo $pedidos->pedido_cliente_nome; ?></p>
                  <p> CPF :  <?php echo $pedidos->cliente_cpf; ?></p>
                  <p> Telefone :  <?php echo $pedidos->cliente_telefone_movel; ?></p>
                  <p> Email :  <?php echo $pedidos->cliente_email ?></p>
                  <hr>
                  <h5>Dados do Pedido</h5>
                  <?php  switch($pedidos->pedido_status){
                                                    case 1:
                                                      echo '<div class="badge badge-secondary badge-shadow">Aguardando Pagamento</div>';
                                                      break;
                                                    case 2:
                                                      echo '<div class="badge badge-info badge-shadow">Em  Análise</div>';
                                                      break;
                                                    case 3:
                                                      echo '<div class="badge badge-success badge-shadow">Pago</div>';
                                                      break;
                                                    case 4:
                                                      echo '<div class="badge badge-light badge-shadow">Disponível</div>';
                                                      break;
                                                    case 5:
                                                      echo '<div class="badge badge-warning badge-shadow">Em Disputa</div>';
                                                      break;
                                                    case 6:
                                                      echo '<div class="badge badge-danger badge-shadow">Devolvido</div>';
                                                      break;
                                                    case 7:
                                                        echo '<div class="badge badge-danger badge-shadow">Cancelada</div>';
                                                        break;
                                                    case 8:
                                                        echo '<div class="badge badge-success badge-shadow">Debitado</div>';
                                                        break;
                                                    case 9:
                                                        echo '<div class="badge badge-info badge-shadow">Retenção Temporário</div>';
                                                        break;
                                                  } 
                                                   ?>
                <hr>  
                <h5>Endereço de Entrega</h5>                             
                <p class="mt-2"> CEP :  <?php echo $pedidos->cliente_cep; ?></p>
                <p> Rua :  <?php echo $pedidos->cliente_endereco; ?> - Nº: <?php echo $pedidos->cliente_numero_endereco; ?> -   Bairro:  <?php echo $pedidos->cliente_bairro; ?></p>
               
                <p> Cidade :  <?php echo $pedidos->cliente_cidade ?> - <?php echo $pedidos->cliente_estado; ?></p>
                <p> Forma de envio :  <?php echo ($pedidos->pedido_forma_envio == 1 ? 'Sedex' : 'PAC'); ?> </p>
                <hr>
                <h5>Produtos do Pedido</h5>  
                

                    <div class="table-responsive">
                      <table class="table table-striped data-table"  id="table-1">
                        <thead>
                          <tr>
                            <th class="text-center">
                             Produto
                            </th>
                            <th>Quantidade</th>
                            <th>Valor Unitário</th>
                            <th>Valor Total</th>
                           
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                          <?php foreach($pedido_produtos as $produto): ?>
                            <td>
                             <?php echo word_limiter($produto->produto_nome, 5); ?>
                            </td>
                            <td><?php echo $produto->produto_quantidade ;  ?></td>
                            
                            <td><?php echo 'R$: '. number_format($produto->produto_valor_unitario, 2) ;  ?></td>
                         
                            <td><?php echo 'R$: '. number_format( $produto->produto_valor_total, 2) ;  ?></td>
                          
                          </tr> 
                          <tr>
                            <th colspan="3" class="text-right">
                              Valor do Frete: 
                            </th>
                            <td><?php echo 'R$: '. number_format( $pedidos->pedido_valor_frete, 2) ;  ?></td>
                          </tr>
                          <tr>
                            <th colspan="3" class="text-right">
                              Valor Total: 
                            </th>
                            <td><?php echo 'R$: '. number_format( $pedidos->pedido_valor_final, 2) ;  ?></td>
                          </tr>
                        </tbody>

                        <?php endforeach; ?>
                      </table>
                      
                    </div>
                  </div>
                </div>
              </div>
              
            </div>
          </div>
        </section>

   
      </div>

     