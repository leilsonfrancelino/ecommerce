<?php $this->load->view('restrita/layout/navbar'); ?>
<?php $this->load->view('restrita/layout/sidebar'); ?>
    
     
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-body">
		  
            <!-- add content here -->
			
			<div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4><?php echo $titulo; ?></h4>
                  </div>
				  
				  <?php
					$atributos = array(
						'name' => 'form_core',
					);				  
				  
					if(isset($categoria)) {
						$categoria_id = $categoria->categoria_id;
					}else{
						$categoria_id = '';
					}
					?>						
				  
				  <?php echo form_open('restrita/categorias/core/'.$categoria_id, $atributos); ?>				  
				  
                  <div class="card-body">
					<div class="form-row">
                      <div class="form-group col-md-3">
                        <label>Nome da subcategoria</label>
                        <input type="text" name="categoria_nome" class="form-control" value="<?php echo (isset($categoria) ? $categoria->categoria_nome : set_value('categoria_nome')); ?>">
                        <?php echo form_error('categoria_nome', '<div class="text-danger">', '</div>'); ?>
					  </div>  	
					  
						<div class="form-group col-md-3">
							<label>Categoria</label>
							<select name="categoria_pai_id" class="form-control">
							
							<?php foreach($masters as $pai): ?>
							
								<?php if(isset($categoria)): ?>
									  <option value="<?php echo $pai->categoria_pai_id; ?>" <?php echo ($pai->categoria_pai_id == $categoria->categoria_pai_id  ? 'selected' : '') ?>><?php echo $pai->categoria_pai_nome; ?></option>
								
								<?php else: ?>
									  <option value="<?php echo $pai->categoria_pai_id; ?>"><?php echo $pai->categoria_pai_nome; ?></option>
								
								 <?php endif; ?>
							<?php endforeach; ?>	 
							</select>
						  </div>
					
						<div class="form-group col-md-2">
							<label>Ativa</label>
							<select name="categoria_ativa" class="form-control">
								<?php if(isset($categoria)): ?>
									  <option value="1" <?php echo ($categoria->categoria_ativa == 1 ? 'selected' : ''); ?>>Sim</option>
									  <option value="0" <?php echo ($categoria->categoria_ativa == 0 ? 'selected' : ''); ?>>N??o</option>
								 <?php else: ?>
									  <option value="1">Sim</option>
									  <option value="0">N??o</option>
								 <?php endif; ?>
							</select>
						  </div>						  
						  						  
						  <?php if(isset($categoria)): ?> 
						  <div class="form-group col-md-4">
							<label>Metalink da Subcategoria</label>
							<input type="text" name="categoria_meta_link" class="form-control border-0" value="<?php echo $categoria->categoria_meta_link; ?>" readonly="">
						  </div>  
						  <?php endif; ?>
						  <?php if(isset($categoria)): ?>
							<input type="hidden" name="categoria_id" value="<?php echo $categoria->categoria_id; ?>">
						  <?php endif; ?>
					</div>                  
                    
                  <div class="card-footer">
                    <button class="btn btn-primary mr-2">Salvar</button> 
					<a class="btn btn-dark" href="<?php echo base_url('restrita/categorias'); ?>">Voltar</a>
                  </div>	
				  
				 <?php echo form_close(); ?>
				  
                </div>
              </div>
            </div>
          </div>
        </section>
		<?php $this->load->view('restrita/layout/sidebar_settings'); ?>       
      </div>
      