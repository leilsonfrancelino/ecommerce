  <!-- Begin Footer Area -->
  <div class="footer">
                <!-- Begin Footer Static Top Area -->
                <div class="footer-static-top">
                    <div class="container">
                        <!-- Begin Footer Shipping Area -->
                        <div class="footer-shipping pt-60 pb-55 pb-xs-25">
                            <div class="row">
                                <!-- Begin Li's Shipping Inner Box Area -->
                                <div class="col-lg-3 col-md-6 col-sm-6 pb-sm-55 pb-xs-55">
                                    <div class="li-shipping-inner-box">
                                        <div class="shipping-icon">
                                            <img src="<?php echo base_url('public/web/images/shipping-icon/1.png')?>" alt="Shipping Icon">
                                        </div>
                                        <div class="shipping-text">
                                            <h2>Entrega Grátis</h2>
                                            <p>Consulte as regras.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Li's Shipping Inner Box Area End Here -->
                                <!-- Begin Li's Shipping Inner Box Area -->
                                <div class="col-lg-3 col-md-6 col-sm-6 pb-sm-55 pb-xs-55">
                                    <div class="li-shipping-inner-box">
                                        <div class="shipping-icon">
                                            <img src="<?php echo base_url('public/web/images/shipping-icon/2.pn')?>g" alt="Shipping Icon">
                                        </div>
                                        <div class="shipping-text">
                                            <h2>Pagamento Seguro</h2>
                                            <p>Pague com as formas de pagamento mais populares e seguros.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Li's Shipping Inner Box Area End Here -->
                                <!-- Begin Li's Shipping Inner Box Area -->
                                <div class="col-lg-3 col-md-6 col-sm-6 pb-xs-30">
                                    <div class="li-shipping-inner-box">
                                        <div class="shipping-icon">
                                            <img src="<?php echo base_url('public/web/images/shipping-icon/3.png')?>" alt="Shipping Icon">
                                        </div>
                                        <div class="shipping-text">
                                            <h2>Compra Segura</h2>
                                            <p>Proteção ao comprador, cobre sua compra desde o clique até a entrega.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Li's Shipping Inner Box Area End Here -->
                                <!-- Begin Li's Shipping Inner Box Area -->
                                <div class="col-lg-3 col-md-6 col-sm-6 pb-xs-30">
                                    <div class="li-shipping-inner-box">
                                        <div class="shipping-icon">
                                            <img src="<?php echo base_url('public/web/images/shipping-icon/4.png')?>" alt="Shipping Icon">
                                        </div>
                                        <div class="shipping-text">
                                            <h2>Central de Ajuda</h2>
                                            <p>Ligue para nossos atendentes ou converse online.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Li's Shipping Inner Box Area End Here -->
                            </div>
                        </div>
                        <!-- Footer Shipping Area End Here -->
                    </div>
                </div>
                <!-- Footer Static Top Area End Here -->
                <!-- Begin Footer Static Middle Area -->
                <div class="footer-static-middle">
                    <div class="container">
                        <div class="footer-logo-wrap pt-50 pb-35">
                            <div class="row">
                                <!-- Begin Footer Logo Area -->
                                <div class="col-lg-4 col-md-6">
                                    <div class="footer-logo">
                                        <img src="<?php echo base_url('public/web/images/menu/logo/1.jpg')?>" alt="Footer Logo">
                                        <p class="info">
                                            We are a team of designers and developers that create high quality HTML Template & Woocommerce, Shopify Theme.
                                        </p>
                                    </div>
                                    <?php $sistema = info_header_footer(); ?>
                                    <ul class="des">
                                        <li>
                                            <span>Endereço: </span><br/>
                                           <?php echo  $sistema->sistema_endereco . ' ' .$sistema->sistema_numero . ' <br/> '. $sistema->sistema_cidade . ' - ' . $sistema->sistema_estado . '<br/>' . 'CEP: ' . $sistema->sistema_cep   ?>
                                        </li>
                                        <li>
                                            <span>Telefone: </span>
                                            <a href="#"><?php echo $sistema->sistema_telefone_fixo; ?></a>
                                        </li>
                                        <li>
                                            <span>Email: </span>
                                            <a href="mailto://info@yourdomain.com"><?php echo $sistema->sistema_email; ?></a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- Footer Logo Area End Here -->
                                <!-- Begin Footer Block Area -->
                                <div class="col-lg-2 col-md-3 col-sm-6">
                                    <div class="footer-block">
                                        <h3 class="footer-block-title">Departamentos</h3>
                                        <ul>
                                            <li><a href="<?php echo base_url('master/eletronicos'); ?>">Eletrônicos</a></li>
                                            <li><a href="<?php echo base_url('master/games'); ?>">Games</a></li>
                                            <li><a href="<?php echo base_url('master/hardware'); ?>">Hardware</a></li>
                                            <li><a href="<?php echo base_url('master/informatica'); ?>">Informática</a></li>
											<li><a href="<?php echo base_url('master/perifericos'); ?>">Periféricos</a></li>
                                            <li><a href="<?php echo base_url('master/telefonia'); ?>">Telefonia</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- Footer Block Area End Here -->
                                <!-- Begin Footer Block Area -->
                                <div class="col-lg-2 col-md-3 col-sm-6">
                                    <div class="footer-block">
                                        <h3 class="footer-block-title">Nossa Empresa</h3>
                                        <ul>
                                            <li><a href="#">Entrega</a></li>
                                            <li><a href="#">Política e Privacidade</a></li>
                                            <li><a href="#">Sobre</a></li>
                                            <li><a href="#">Contato</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- Footer Block Area End Here -->
                                <!-- Begin Footer Block Area -->
                                <div class="col-lg-4">
                                    <div class="footer-block">
                                        <h3 class="footer-block-title">Siga-nos</h3>
                                        <ul class="social-link">
                                            <li class="twitter">
                                                <a href="https://twitter.com/" data-toggle="tooltip" target="_blank" title="Twitter">
                                                    <i class="fa fa-twitter"></i>
                                                </a>
                                            </li>
                                            <li class="rss">
                                                <a href="https://rss.com/" data-toggle="tooltip" target="_blank" title="RSS">
                                                    <i class="fa fa-rss"></i>
                                                </a>
                                            </li>
                                            <li class="google-plus">
                                                <a href="https://www.plus.google.com/discover" data-toggle="tooltip" target="_blank" title="Google Plus">
                                                    <i class="fa fa-google-plus"></i>
                                                </a>
                                            </li>
                                            <li class="facebook">
                                                <a href="https://www.facebook.com/" data-toggle="tooltip" target="_blank" title="Facebook">
                                                    <i class="fa fa-facebook"></i>
                                                </a>
                                            </li>
                                            <li class="youtube">
                                                <a href="https://www.youtube.com/" data-toggle="tooltip" target="_blank" title="Youtube">
                                                    <i class="fa fa-youtube"></i>
                                                </a>
                                            </li>
                                            <li class="instagram">
                                                <a href="https://www.instagram.com/" data-toggle="tooltip" target="_blank" title="Instagram">
                                                    <i class="fa fa-instagram"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- Begin Footer Newsletter Area -->
                                    <div class="footer-newsletter">
                                        <h4>Inscreva-se em nossa Newsletter</h4>
                                        <form action="#" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="footer-subscribe-form validate" target="_blank" novalidate>
                                           <div id="mc_embed_signup_scroll">
                                              <div id="mc-form" class="mc-form subscribe-form form-group" >
                                                <input id="mc-email" type="email" autocomplete="off" placeholder="Digite seu email" />
                                                <button  class="btn" id="mc-submit">Inscrever-se</button>
                                              </div>
                                           </div>
                                        </form>
                                    </div>
                                    <!-- Footer Newsletter Area End Here -->
                                </div>
                                <!-- Footer Block Area End Here -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer Static Middle Area End Here -->
                <!-- Begin Footer Static Bottom Area -->
                <div class="footer-static-bottom pt-55 pb-55">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <!-- Begin Footer Links Area -->
                                <div class="footer-links">
                                    <ul>
                                        <li><a href="#">Online Shopping</a></li>
                                        <li><a href="#">Promotions</a></li>
                                        <li><a href="#">My Orders</a></li>
                                        <li><a href="#">Help</a></li>
                                        <li><a href="#">Customer Service</a></li>
                                        <li><a href="#">Support</a></li>
                                        <li><a href="#">Most Populars</a></li>
                                        <li><a href="#">New Arrivals</a></li>
                                        <li><a href="#">Special Products</a></li>
                                        <li><a href="#">Manufacturers</a></li>
                                        <li><a href="#">Our Stores</a></li>
                                        <li><a href="#">Shipping</a></li>
                                        <li><a href="#">Payments</a></li>
                                        <li><a href="#">Warantee</a></li>
                                        <li><a href="#">Refunds</a></li>
                                        <li><a href="#">Checkout</a></li>
                                        <li><a href="#">Discount</a></li>
                                        <li><a href="#">Refunds</a></li>
                                        <li><a href="#">Policy Shipping</a></li>
                                    </ul>
                                </div>
                                <!-- Footer Links Area End Here -->
                                <!-- Begin Footer Payment Area -->
                                <div class="copyright text-center">
                                    <a href="#">
                                        <img src="<?php echo base_url('public/web/images/payment/1.png')?>" alt="">
                                    </a>
                                </div>
                                <!-- Footer Payment Area End Here -->
                                <!-- Begin Copyright Area -->
                                <div class="copyright text-center pt-25">
                                    <span><a target="_blank" href="https://www.templateshub.net">Templates Hub</a></span>
                                </div>
                                <!-- Copyright Area End Here -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer Static Bottom Area End Here -->
            </div>
            <!-- Footer Area End Here -->           
        </div>
        <!-- Body Wrapper End Here -->
        <!-- jQuery-V1.12.4 -->
        <script src="<?php echo base_url('public/web/js/vendor/jquery-1.12.4.min.js')?>"></script>
        <!-- Popper js -->
        <script src="<?php echo base_url('public/web/js/vendor/popper.min.js')?>"></script>
        <!-- Bootstrap V4.1.3 Fremwork js -->
        <script src="<?php echo base_url('public/web/js/bootstrap.min.js')?>"></script>
        <!-- Ajax Mail js -->
        <script src="<?php echo base_url('public/web/js/ajax-mail.js')?>"></script>
        <!-- Meanmenu js -->
        <script src="<?php echo base_url('public/web/js/jquery.meanmenu.min.js')?>"></script>
        <!-- Wow.min js -->
        <script src="<?php echo base_url('public/web/js/wow.min.js')?>"></script>
        <!-- Slick Carousel js -->
        <script src="<?php echo base_url('public/web/js/slick.min.js')?>"></script>
        <!-- Owl Carousel-2 js -->
        <script src="<?php echo base_url('public/web/js/owl.carousel.min.js')?>"></script>
        <!-- Magnific popup js -->
        <script src="<?php echo base_url('public/web/js/jquery.magnific-popup.min.js')?>"></script>
        <!-- Isotope js -->
        <script src="<?php echo base_url('public/web/js/isotope.pkgd.min.js')?>"></script>
        <!-- Imagesloaded js -->
        <script src="<?php echo base_url('public/web/js/imagesloaded.pkgd.min.js')?>"></script>
        <!-- Mixitup js -->
        <script src="<?php echo base_url('public/web/js/jquery.mixitup.min.js')?>"></script>
        <!-- Countdown -->
        <script src="<?php echo base_url('public/web/js/jquery.countdown.min.js')?>"></script>
        <!-- Counterup -->
        <script src="<?php echo base_url('public/web/js/jquery.counterup.min.js')?>"></script>
        <!-- Waypoints -->
        <script src="<?php echo base_url('public/web/js/waypoints.min.js')?>"></script>
        <!-- Barrating -->
        <script src="<?php echo base_url('public/web/js/jquery.barrating.min.js')?>"></script>
        <!-- Jquery-ui -->
        <script src="<?php echo base_url('public/web/js/jquery-ui.min.js')?>"></script>
        <!-- Venobox -->
        <script src="<?php echo base_url('public/web/js/venobox.min.js')?>"></script>
        <!-- Nice Select js -->
        <script src="<?php echo base_url('public/web/js/jquery.nice-select.min.js')?>"></script>
        <!-- ScrollUp js -->
        <script src="<?php echo base_url('public/web/js/scrollUp.min.js')?>"></script>
        <!-- Main/Activator js -->
        <script src="<?php echo base_url('public/web/js/main.js')?>"></script>
         <!-- Util JS File -->
        <script src="<?php echo base_url('public/assets/js/util.js'); ?>"></script>
        <!-- scripts secundários -->
        <?php if(isset($scripts)): ?>
            <?php foreach ($scripts as $script): ?>
            <script src="<?php echo base_url('public/assets/'.$script); ?>"></script>
            <?php endforeach; ?>
        <?php endif; ?>
    </body>

<!-- index30:23-->
</html>
