
	<?php $this->load->view('web/layout/navbar'); ?>
	
            <!-- Begin Slider With Banner Area -->
            <div class="slider-with-banner">
                <div class="container">
                    <div class="row">
                        <!-- Begin Slider Area -->
                        <div class="col-lg-8 col-md-8">
                            <div class="slider-area">
                                <div class="slider-active owl-carousel">
								
								<?php foreach ($produtos_destaques as $produto): ?>
                                    <!-- Begin Single Slide Area -->
                                    <div class="single-slide align-center-left animation-style-01 bg-1">
									
										<img style="width: 50%" src="<?php echo base_url('uploads/produtos/' .$produto->foto_caminho); ?>">
										
                                        <div class="slider-progress"></div>
                                        <div class="slider-content" style="padding-left: 0; position: relative">
                                            <h5>Oferta <span>-20% Off</span> esta semana</h5>
                                            <h2><?php echo word_limiter($produto->produto_nome, 2)?></h2>
                                            <h3>Compre por: <span><?php echo 'R$&nbsp;'. number_format($produto->produto_valor, 2, ',', '.')?></span></h3>
                                            <div class="default-btn slide-btn">
                                                <a class="links" href="<?php echo base_url('produto/'.$produto->produto_meta_link)?>">Compre Agora</a>
                                            </div>
                                        </div>
										
                                    </div>

                                    <!-- Single Slide Area End Here --> 
									<?php endforeach; ?>
                                </div>
                            </div>
                        </div>
                        <!-- Slider Area End Here -->
                        <!-- Begin Li Banner Area -->
                        <div class="col-lg-4 col-md-4 text-center pt-xs-30">
                            <div class="li-banner">
                                <a href="#">
                                    <img src="<?php echo base_url ('public/web/images/banner/1_1.jpg'); ?>" alt="">
                                </a>
                            </div>
                            <div class="li-banner mt-15 mt-sm-30 mt-xs-30">
                                <a href="#">
                                    <img src="<?php echo base_url ('public/web/images/banner/1_4.jpg'); ?>" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- Li Banner Area End Here -->
                    </div>
                </div>
            </div>
            <!-- Slider With Banner Area End Here -->
            <!-- Begin Product Area -->
            <div class="product-area pt-60 pb-50">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="li-product-tab">
                                <ul class="nav li-product-menu">
                                   <li><a class="active" data-toggle="tab" href="#li-new-product"><span>Destaques</span></a></li>
                                </ul>               
                            </div>
                            <!-- Begin Li's Tab Menu Content Area -->
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="li-new-product" class="tab-pane active show" role="tabpanel">
                            <div class="row">
                                <div class="product-active owl-carousel">
								
									<?php foreach ($produtos_destaques as $produto):  ?>
								
										<div class="col-lg-12">
											<!-- single-product-wrap start -->
											<div class="single-product-wrap">
												<div class="product-image">
													<a href="<?php echo base_url('produto/'.$produto->produto_meta_link); ?>">
														<img src="<?php echo base_url ('uploads/produtos/'.$produto->foto_caminho); ?>" alt="<?php echo word_limiter($produto->produto_nome, 7);?>">
													</a>
													<span class="sticker">Novo</span>
												</div>
												<div class="product_desc">
													<div class="product_desc_info">
														<div class="product-review">
															<h5 class="manufacturer">
																<a href="shop-left-sidebar.html">Avaliações</a>
															</h5>
															<div class="rating-box">
																<ul class="rating">
																	<li><i class="fa fa-star-o"></i></li>
																	<li><i class="fa fa-star-o"></i></li>
																	<li><i class="fa fa-star-o"></i></li>
																	<li class="no-star"><i class="fa fa-star-o"></i></li>
																	<li class="no-star"><i class="fa fa-star-o"></i></li>
																</ul>
															</div>
														</div>
														<h4><a class="product_name" href="<?php echo base_url('produto/'.$produto->produto_meta_link); ?>"><?php echo word_limiter($produto->produto_nome, 7);?></a></h4>
														<div class="price-box">
															<span class="new-price"><?php echo 'R$&nbsp'.number_format($produto->produto_valor, 2, ',', '.'); ?></span>
														</div>
														
													</div>
													<div class="add-actions">
														<ul class="add-actions-link">
															<li class="add-cart active"><a href="<?php echo base_url('produto/'.$produto->produto_meta_link); ?>">Visualizar</a></li>
														</ul>
													</div>
												</div>
											</div>
											<!-- single-product-wrap end -->
										</div>     

									<?php endforeach; ?>
                                </div>
                            </div>
                        </div>				
                       
                        
                </div>
            </div>
            <!-- Product Area End Here -->
            
            <!-- Begin Li's Laptop Product Area 
            <section class="product-area li-laptop-product pt-60 pb-45">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Section Area 
                        <div class="col-lg-12">
                            <div class="li-section-title">
                                <h2>
                                    <span>Produtos mais Vendidos</span>
                                </h2>                               
                            </div>
                            <div class="row">
                                <div class="product-active owl-carousel">
                                
								<?php foreach ($produtos_mais_vendidos as $produto):  ?>
								
										<div class="col-lg-12">
											<!-- single-product-wrap start 
											<div class="single-product-wrap">
												<div class="product-image">
													<a href="<?php echo base_url('produto/'.$produto->produto_meta_link); ?>">
														<img src="<?php echo base_url ('uploads/produtos/'.$produto->foto_caminho); ?>" alt="<?php echo word_limiter($produto->produto_nome, 7);?>">
													</a>
													<span class="sticker">Novo</span>
												</div>
												<div class="product_desc">
													<div class="product_desc_info">
														<div class="product-review">
															<h5 class="manufacturer">
																<a href="shop-left-sidebar.html">Avaliações</a>
															</h5>
															<div class="rating-box">
																<ul class="rating">
																	<li><i class="fa fa-star-o"></i></li>
																	<li><i class="fa fa-star-o"></i></li>
																	<li><i class="fa fa-star-o"></i></li>
																	<li class="no-star"><i class="fa fa-star-o"></i></li>
																	<li class="no-star"><i class="fa fa-star-o"></i></li>
																</ul>
															</div>
														</div>
														<h4><a class="product_name" href="<?php echo base_url('produto/'.$produto->produto_meta_link); ?>"><?php echo word_limiter($produto->produto_nome, 7);?></a></h4>
														<div class="price-box">
															<span class="new-price"><?php echo 'R$&nbsp'.number_format($produto->produto_valor, 2, ',', '.'); ?></span>
														</div>
														
													</div>
													<div class="add-actions">
														<ul class="add-actions-link">
															<li class="add-cart active"><a href="<?php echo base_url('produto/'.$produto->produto_meta_link); ?>">Visualizar</a></li>
														</ul>
													</div>
												</div>
											</div>
											<!-- single-product-wrap end 
										</div>     

									<?php endforeach; ?>							  
								  
                                </div>
                            </div>
                        </div>
                        <!-- Li's Section Area End Here 
                    </div>
                </div>
            </section>
            <!-- Li's Laptop Product Area End Here -->
           
           
           
            