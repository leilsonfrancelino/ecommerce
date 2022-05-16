


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
                             Nome do Produto
                            </th>
                            <th class="text-center" >Valor do Produto</th>
                            <th class="text-center">Quantidade de Vendas</th>
                           
                           
                          </tr>
                        </thead>
                        <tbody>
                            
                          <tr>
                          <?php foreach($pedidos as $pedido): ?>
                           
                           
                            
                            <td class="text-center"><?php echo word_limiter($pedido->produto_nome, 5) ;  ?></td>
                            <td class="text-center"><?php echo 'R$: '. number_format($pedido->produto_valor_unitario, 2); ?></td>
                            <td class="text-center"><?php echo '<div class="badge badge-info badge-shadow">'. $pedido->vendidos.'</div>' ?></td>
                            
                          
                          </tr> 
                          
                         
                        </tbody>

                        <?php endforeach; ?>
                        
                      </table>
                      
                    </div>
                    <?php else: ?>
                        <h5>Não foi encontrado ainda os produtos mais vendido!</h5>
                    <?php endif; ?>
                  </div>
                </div>
              </div>
              
            </div>
          </div>
        </section>

   
      </div>

     