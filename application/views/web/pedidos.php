<?php $this->load->view('web/layout/navbar'); ?>


<!-- Begin Li's Breadcrumb Area -->
<div class="breadcrumb-area">
    <div class="container">
        <div class="breadcrumb-content">
            <ul>
                <li><a href="<?php echo base_url('/'); ?>">Home</a></li>
                
                <li class="active"><?php echo $titulo; ?></a></li>

            </ul>
        </div>
    </div>
</div>

   <!-- Begin Frequently Area -->
   <div class="frequently-area pt-60 pb-50">
                <div class="container">
                    <div class="row">

                    <?php if(isset($pedidos) && !empty($pedidos) ): ?>
                      <div class="col-md-12">
                            <div class="frequently-content">
                                <div class="frequently-desc">
                                    <h3>Olá, <?php echo  $this->session->userdata('cliente_nome'); ?></h3>
                                    <p>Listando os seus pedidos.</p>
                                </div>
                            </div>
                            <?php $i = 1; ?>

                            <?php foreach($pedidos as $pedido):?>
                            <!-- Begin Frequently Accordin -->
                            <div class="frequently-accordion">
                                <div id="accordion-<?php echo $i; ?>">

                                  <div class="card actives">
                                    <div class="card-header" id="heading-<?php echo $i; ?>">
                                      <h5 class="mb-0">
                                        <a class="" data-toggle="collapse" data-target="#collapse-<?php echo $i; ?>" aria-expanded="true" aria-controls="collapseOne">
                                         <i class="fa fa-shopping-basket"></i> Pedido:  &nbsp;<?php echo $pedido->pedido_codigo; ?> - <?php echo formata_data_banco_com_hora($pedido->pedido_data_cadastro); ?>
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="collapse-<?php echo $i; ?>" class="collapse " aria-labelledby="headingOne" data-parent="#accordion-<?php echo $i; ?>">
                                      <div class="card-body">
                                        
                                      <div class="table-content table-responsive">
                                      <table class="table">
                                        <thead>
                                            <tr>
                                                
                                                <th class="li-product-thumbnail">Imagens</th>                 
                                                <th class="cart-product-name">Produto</th>
                                                <th class="li-product-price">Situação</th>
                                                <th class="li-product-subtotal">Total</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            <tr>
                                            <?php foreach ($pedido->pedidos_produtos as $produto): ?>
                                                <td class="li-product-thumbnail"><img width="50" src="<?php echo base_url('uploads/produtos/small/' . $pedido->foto_caminho); ?>" alt="<?php echo $pedido->foto_caminho; ?>"></a></td>
                                                <td class="li-product-name">
                                               
                                                  <a href="<?php echo base_url('produto/'.$pedido->produto_meta_link); ?>"><?php echo word_limiter ($produto->produto_nome, 5); ?></a>
                                                
                                                </td>
                                                <td class="li-product-status">

                                                  <?php  switch($pedido->pedido_status){
                                                    case 1:
                                                      echo 'Aguardando Pagamento';
                                                      break;
                                                    case 2:
                                                      echo 'Em Analise';
                                                      break;
                                                    case 3:
                                                      echo 'Pago';
                                                      break;
                                                    case 4:
                                                      echo 'Disponível';
                                                      break;
                                                    case 5:
                                                      echo 'Em Disputa';
                                                      break;
                                                    case 6:
                                                      echo 'Devolvido';
                                                      break;
                                                    case 7:
                                                        echo 'Cancelada';
                                                        break;
                                                    case 8:
                                                        echo 'Debitado';
                                                        break;
                                                    case 9:
                                                        echo 'Retenção Temporário';
                                                        break;
                                                  } 
                                                   ?>
                                               
                                                </td>
                                                
                                               
                                                <td class="product-subtotal"><span class="amount">R$:&nbsp<?php echo number_format($pedido->pedido_valor_final, 2); ?></span></td>
                                                <?php endforeach; ?>
                                            </tr>
                                       
                                        </tbody>

                                    </table>
                                </div>

                                      </div>
                                    </div>
                                  </div>


                                </div>
                            </div>
                            <!--Frequently Accordin End Here -->
                            <?php $i++; ?>
                            <?php endforeach; ?>
                        </div>

                    <?php else: ?>

                      <div class="col-12 pt-10">
                        <h4 class="mb-10" style="text-align: center">Você não fez nenhuma compra ainda...</h4>
                        <div class="coupon-all">
                      
                            <div class="coupon">
                            <a href="<?php echo base_url('/'); ?>" class="button"><input class="button" style="width:260px" value="que tal comprar agora ?" > </a>
                            </div>
                                                
                        </div>                        
                      </div>
                    <?php endif; ?>
                       
                    </div>
                </div>
            </div>
            <!--Frequently Area End Here -->