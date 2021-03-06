<!-- Begin Header Area -->
<header>
	<!-- Begin Header Top Area -->
	<div class="header-top" style="background: #1cd578">
		<div class="container">
			<div class="row" style="color: #fff">
				<!-- Begin Header Top Left Area -->
				<div class="col-lg-3 col-md-4">
					<div class="header-top-left">
						<ul class="phone-wrap" style="width: 274px">
							<?php $sistema = info_header_footer(); ?>
							<li><span style="color: #fff">Telefones: </span><?php echo $sistema->sistema_telefone_fixo . ' - ' . $sistema->sistema_telefone_movel;?></li>
						</ul>
					</div>
				</div>
				<!-- Header Top Left Area End Here -->
				<!-- Begin Header Top Right Area -->
				<div class="col-lg-9 col-md-8">
					<div class="header-top-right">
						<ul class="ht-menu">
							<!-- Begin Setting Area -->
							<li>
								<div class="ht-setting-trigger"><span>Grandes Marcas</span></div>
								<div class="setting ht-setting" style="border-top: 2px solid #266daf">
									<ul class="ht-setting-list">
										<?php $grandes_marcas = grandes_marcas_navbar(); ?>

										<?php foreach ($grandes_marcas as $marca): ?>

											<li><a href="<?php echo base_url('marca/' . $marca->marca_meta_link); ?>"><?php echo $marca->marca_nome; ?></a></li>

										<?php endforeach; ?>

									</ul>
								</div>
							</li>
							<!-- Setting Area End Here -->
							 <li>
						   <?php $cliente_logado = $this->ion_auth->logged_in(); ?>

							 <div class="ht-currency-trigger"><span><?php echo (!$cliente_logado ? 'Entre ou registre-se' : 'Olá, ' . $this->session->userdata('cliente_nome_completo')); ?></span></div>
                               <div class="currency ht-currency" style="border-top: 2px solid rgb(38, 109, 175)">
								<ul class="ht-currency-list">
									<?php if(!$cliente_logado): ?>
										<li><a href="<?php echo base_url('login'); ?>">Entrar</a> </li>

									<?php else: ?>
										<li><a href="<?php echo base_url('perfil'); ?>"> Perfil </a> </li>
										<li class="active"><a href="<?php echo base_url('pedidos'); ?>">Pedidos </a></li>
										<li ><a href="<?php echo base_url('login/logout'); ?>">Sair </a></li>
								<?php endif; ?>

								</ul>
							</div>
						</li>

					</ul>
				</div>
			</div>
				<!-- Header Top Right Area End Here -->
			</div>
		</div>
	</div>
	<!-- Header Top Area End Here -->
	<!-- Begin Header Middle Area -->
	<div class="header-middle pl-sm-0 pr-sm-0 pl-xs-0 pr-xs-0" style="background: #eeeeee; padding: 20px">
		<div class="container">
			<div class="row">
				<!-- Begin Header Logo Area -->
				<div class="col-lg-3">
					<div class="logo pb-sm-30 pb-xs-30" style="text-align: center">
						<a href="<?php echo base_url('/');?>">
							<img src="<?php echo base_url('public/web/images/menu/logo/logo.png'); ?>" alt="">
						</a>
					</div>
				</div>
				<!-- Header Logo Area End Here -->
				<!-- Begin Header Middle Right Area -->
				<div class="col-lg-9 pl-0 ml-sm-15 ml-xs-15">

					<?php                     
						$atributos = array(
							'class' => 'hm-searchbox',
						);									
					?>

					<!-- Begin Header Middle Searchbox Area -->
					<?php echo form_open('busca', $atributos); ?>                       

						<input type="text" name="busca" placeholder="Qual produto você está procurando?">										
						<button class="li-btn" type="submit" style="background: #266daf"><i class="fa fa-search"></i></button>

						<?php echo form_close(); ?>

					<!-- Header Middle Searchbox Area End Here -->
					<!-- Begin Header Middle Right Area -->
					<div class="header-middle-right">
						<ul class="hm-menu">											
							<!-- Begin Header Mini Cart Area -->
							<li class="hm-minicart">
								<div id="top-cart" class="hm-minicart-trigger" style="background: #17af62">
									<span class="item-icon"></span>
									<span class="item-text"><?php echo ($this->carrinho_compras->get_total() > '0,00' ? 'R$&nbsp' .$this->carrinho_compras->get_total() : '0,00' ); ?>
								<?php if($this->carrinho_compras->get_total_itens() > 0 ): ?>
									<span class="cart-item-count" style="background: #266daf"><?php echo $this->carrinho_compras->get_total_itens(); ?></span>
								<?php endif; ?>
									</span>
								</div>
								<span></span>
								<div id="list-itens" class="minicart">
									<ul class="minicart-product-list">
									<?php if($this->carrinho_compras->get_total_itens() > 0 ): ?>

										<?php $carrinho = $this->carrinho_compras->get_all(); ?>

										<?php foreach ($carrinho as $produto): ?>

											<li>
												<a href="<?php echo base_url('produto/'.$produto['produto_meta_link']); ?>" class="minicart-product-image">
													<img src="<?php echo base_url('uploads/produtos/small/' . $produto['produto_foto']); ?>" alt="<?php echo $produto['produto_nome']; ?>">
												</a>
												<div class="minicart-product-details">
													<h6><a href="<?php echo base_url('produto/'.$produto['produto_meta_link']); ?>"><?php echo word_limiter($produto['produto_nome'], 2); ?></a></h6>
													<span>R$&nbsp<?php echo number_format($produto['produto_valor'], 2, ',', '.'); ?> x <?php echo $produto['produto_quantidade']; ?>  </span>
												</div>

											</li>
										<?php endforeach; ?>    
									<?php endif; ?>
								</ul>
								<?php if($this->carrinho_compras->get_total_itens() > 0 ): ?>
								<p class="minicart-total">SUBTOTAL: <span><?php echo ($this->carrinho_compras->get_total() > '0,00' ? 'R$&nbsp' .$this->carrinho_compras->get_total() : '0,00' ); ?></span></p>
								<div class="minicart-button">

									<a href="<?php echo base_url('carrinho'); ?>" class="li-button li-button-fullwidth li-button-dark">
										<span>Ver Carrinho</span>
									</a>
									<a  href="<?php echo base_url('checkout'); ?>" class="li-button li-button-fullwidth">
										<span>Finalizar Compra</span>
									</a>
								<?php else: ?>
									<p class="minicart-total">SUBTOTAL R$:&nbsp <span><span class="item-text"> <?php echo ($this->carrinho_compras->get_total() > '0,00' ? $this->carrinho_compras->get_total() : '0,00' ); ?></span></p>
									<a href="<?php echo base_url('carrinho'); ?>" class="li-button li-button-fullwidth li-button-dark">

										<span>Carrinho Vazio</span>
									</a>
								<?php endif; ?>
								</div>
							</div>
						</li>
							<!-- Header Mini Cart Area End Here -->
						</ul>
					</div>
					<!-- Header Middle Right Area End Here -->
				</div>
				<!-- Header Middle Right Area End Here -->
			</div>
		</div>
	</div>
	<!-- Header Middle Area End Here -->
	<!-- Begin Header Bottom Area -->
	<div class="header-bottom header-sticky d-none d-lg-block d-xl-block mb-0" style="background: #17af62">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Begin Header Bottom Menu Area -->
					<div class="hb-menu" style="text-align: center">
						<nav>
							<ul>
								<li class="dropdown-holder"><a href="<?php echo base_url('/');?>">Home</a>                                               
								</li>

								<?php $categorias_pai = categorias_pai_navbar(); ?>

								<?php foreach ($categorias_pai as $cat_pai): ?>

								<?php $categorias_filhas = categorias_filhas_navbar($cat_pai->categoria_pai_id); ?>

								<li class="dropdown-holder" style="text-align: left"><a href="<?php echo base_url('master/'.$cat_pai->categoria_pai_meta_link); ?>"><?php echo $cat_pai->categoria_pai_nome; ?></a>
									<ul class="hb-dropdown">
										<?php foreach ($categorias_filhas as $cat_filha): ?>													
										<li class="active"><a href="<?php echo base_url('categoria/'.$cat_filha->categoria_meta_link); ?>"><?php echo $cat_filha->categoria_nome; ?></a></li>
										<?php endforeach; ?>
									</ul>
								</li>

								<?php endforeach; ?>

								 </ul>
						</nav>
					</div>
					<!-- Header Bottom Menu Area End Here -->
				</div>
			</div>
		</div>
	</div>
	<!-- Header Bottom Area End Here -->
	<!-- Begin Mobile Menu Area -->
	<div class="mobile-menu-area d-lg-none d-xl-none col-12">
		<div class="container"> 
			<div class="row">
				<div class="mobile-menu">
				</div>
			</div>
		</div>
	</div>
	<!-- Mobile Menu Area End Here -->
</header>
<!-- Header Area End Here -->
