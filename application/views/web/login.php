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
 
 <!-- Begin Login Content Area -->
 <div class="page-section mb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mb-30">
                        <?php if($msg = $this->session->flashdata('sucesso')): ?>
                            <div class="alert alert-success bg-success alert-dismissible show fade">
                            <div class="alert-body">
                                <button class="close" data-dismiss="alert">
                                <span>&times;</span>
                                </button>
                                <?php echo $msg; ?>
                            </div>
                            </div>
                        <?php endif; ?>

                        <?php if($msg = $this->session->flashdata('erro')): ?>
                            <div class="alert alert-danger alert-dismissible show fade">
                            <div class="alert-body">
                                <button class="close" data-dismiss="alert">
                                <span>&times;</span>
                                </button>
                                <?php echo $msg; ?>
                            </div>
                            </div>
                        <?php endif; ?>


                            <!-- Login Form s-->
                           <?php echo form_open('login/auth'); ?>
                                <div class="login-form">
                                    <h4 class="login-title">Login</h4>
                                    <div class="row">
                                        <div class="col-md-12 col-12 mb-20">
                                            <label>Seu Email*</label>
                                            <input class="mb-0" type="email" name="email"  >
                                        </div>
                                        <div class="col-12 mb-20">
                                            <label>Senha</label>
                                            <input class="mb-0" type="password" name="password" >
                                        </div>
                                        <div class="col-md-8">
                                            <div class="check-box d-inline-block ml-0 ml-md-2 mt-10">
                                                <input type="checkbox" name="remember" id="remember_me">
                                                <label for="remember_me">Manter conectado</label>
                                            </div>
                                        </div>
                                        <input type="hidden" name="login" value="login">
                                        <div class="col-md-4 mt-10 mb-20 text-left text-md-right">
                                            <a href="<?php echo base_url('perfil'); ?>"> Criar uma Conta </a>
                                        </div>
                                        <div class="col-md-12">
                                            <button type="submit" class="register-button mt-0">Entrar</button>
                                        </div>
                                    </div>
                                </div>
                            <?php echo form_close(); ?>
                        </div>
                       <!-- <div class="col-sm-12 col-md-12 col-lg-6 col-xs-12"> 
                            <form action="#">
                                <div class="login-form">
                                    <h4 class="login-title">Register</h4>
                                    <div class="row">
                                        <div class="col-md-6 col-12 mb-20">
                                            <label>First Name</label>
                                            <input class="mb-0" type="text" placeholder="First Name">
                                        </div>
                                        <div class="col-md-6 col-12 mb-20">
                                            <label>Last Name</label>
                                            <input class="mb-0" type="text" placeholder="Last Name">
                                        </div>
                                        <div class="col-md-12 mb-20">
                                            <label>Email Address*</label>
                                            <input class="mb-0" type="email" placeholder="Email Address">
                                        </div>
                                        <div class="col-md-6 mb-20">
                                            <label>Password</label>
                                            <input class="mb-0" type="password" placeholder="Password">
                                        </div>
                                        <div class="col-md-6 mb-20">
                                            <label>Confirm Password</label>
                                            <input class="mb-0" type="password" placeholder="Confirm Password">
                                        </div>
                                        <div class="col-12">
                                            <button class="register-button mt-0">Register</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div> -->
            <!-- Login Content Area End Here -->