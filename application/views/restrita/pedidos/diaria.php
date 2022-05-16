


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
                
                   <?php if(isset($pedidos)): ?>
                    <div class="table-responsive">
                      <table class="table table-striped data-table"  id="table-1">
                        <thead>
                          <tr>
                            <th class="text-center">
                             Codigo
                            </th>
                            <th>Data do pedido</th>
                            <th>Nome Cliente</th>
                            <th>Frete</th>
                            <th>Status</th>
                            <th >Valor do Produto</th>
                            <th >Valor do Frete</th>
                            <th >Valor Total</th>

                           
                          </tr>
                        </thead>
                        <tbody>
                            <?php 
                                $grand_total_fretes = 0;
                                $grand_total_pedidos = 0;
                            ?>
                          <tr>
                          <?php foreach($pedidos as $pedido): ?>
                            <?php

                             $grand_total_fretes += $pedido->pedido_valor_frete;
                             $grand_total_pedidos += $pedido->pedido_valor_produtos;
                            
                            ?>
                            <td>
                             <?php echo $pedido->pedido_codigo ?>
                            </td>
                            <td><?php echo formata_data_banco_com_hora($pedido->pedido_data_cadastro) ;  ?></td>
                            <td><?php echo $pedido->pedido_cliente_nome ;  ?></td>
                            <td><?php echo ($pedido->pedido_forma_envio == 1 ? 'Sedex' : 'PAC'); ?></td>
                            <td>
                            <?php  switch($pedido->pedido_status){
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
                            </td>
                            <td><?php echo 'R$: '. number_format($pedido->pedido_valor_produtos, 2) ;  ?></td>
                         
                            <td><?php echo 'R$: '. number_format( $pedido->pedido_valor_frete, 2) ;  ?></td>
                            <td><?php echo 'R$: '. number_format( $pedido->pedido_valor_final, 2) ;  ?></td>
                          
                          </tr> 
                          
                         
                        </tbody>

                        <?php endforeach; ?>
                        <tr>
                            <th colspan="3" class="text-right">
                              Valores totais
                            </th>
                            <td>Frete: <?php echo 'R$: '. number_format( $grand_total_fretes, 2) ;  ?></td>
                            <td>Vendas: <?php echo 'R$: '. number_format( $grand_total_pedidos, 2) ;  ?></td>
                          </tr>
                      </table>
                      
                    </div>
                    <?php else: ?>
                        <h5>Nenhuma venda feita hoje!</h5>
                    <?php endif; ?>
                  </div>
                </div>
              </div>
              
            </div>
          </div>
        </section>

   
      </div>

     