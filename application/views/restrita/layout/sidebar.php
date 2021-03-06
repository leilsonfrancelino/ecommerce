 <div class="main-sidebar sidebar-style-2">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
            <a href="index.html"> <img alt="image" src="<?php echo base_url('public/assets/img/logo.png'); ?>" class="header-logo" /> <span
                class="logo-name">Otika</span>
            </a>
          </div>
          <ul class="sidebar-menu">
            <li class="menu-header">Menu</li>
            <li class="dropdown <?php echo $this->router->fetch_class() == 'home' && $this->router->fetch_method() == 'index' ? 'active' : ''; ?>">
              <a href="<?php echo base_url('restrita'); ?>" class="nav-link"><i data-feather="home"></i><span>Home</span></a>
            </li>  
			
			<li class="dropdown <?php echo $this->router->fetch_class() == 'pedidos' && $this->router->fetch_method() == 'index' ? 'active' : ''; ?>">
              <a href="<?php echo base_url('restrita/pedidos'); ?>" class="nav-link"><i data-feather="shopping-cart"></i><span>Pedidos</span></a>
            </li>  
			
			<li class="dropdown <?php echo $this->router->fetch_class() == 'transacoes' && $this->router->fetch_method() == 'index' ? 'active' : ''; ?>">
                <a href="<?php echo base_url('restrita/transacoes'); ?>" class="nav-link"><i data-feather="dollar-sign"></i><span>Transacões</span></a>
            </li>
			
			<li class="dropdown <?php echo $this->router->fetch_class() == 'clientes' && $this->router->fetch_method() == 'index' ? 'active' : ''; ?>">
              <a href="<?php echo base_url('restrita/clientes'); ?>" class="nav-link"><i data-feather="users"></i><span>Clientes</span></a>
            </li>			
						
			<li class="dropdown <?php echo $this->router->fetch_class() == 'usuarios' && $this->router->fetch_method() == 'index' ? 'active' : ''; ?>">
              <a href="<?php echo base_url('restrita/usuarios'); ?>" class="nav-link"><i data-feather="user"></i><span>Usuários</span></a>
            </li>
			
			<li class="dropdown <?php echo $this->router->fetch_class() == 'marcas' && $this->router->fetch_method() == 'index' ? 'active' : ''; ?>">
              <a href="<?php echo base_url('restrita/marcas'); ?>" class="nav-link"><i data-feather="layers"></i><span>Marcas</span></a>
            </li>
			
				<li class="dropdown">
              <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="package"></i><span>Categorias</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="<?php echo base_url('restrita/master'); ?>">Categorias</a></li>                
              </ul>
			  <ul class="dropdown-menu">
                <li><a class="nav-link" href="<?php echo base_url('restrita/categorias'); ?>">Subcategorias</a></li>                
              </ul>
            </li>
			
			<li class="dropdown <?php echo $this->router->fetch_class() == 'produtos' && $this->router->fetch_method() == 'index' ? 'active' : ''; ?>">
              <a href="<?php echo base_url('restrita/produtos'); ?>" class="nav-link"><i data-feather="tag"></i><span>Produtos</span></a>
            </li>
			
			  <li class="dropdown">
              <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="settings"></i><span>Configurações</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="<?php echo base_url('restrita/sistema'); ?>">Sistema</a></li> 
				<li><a class="nav-link" href="<?php echo base_url('restrita/sistema/correios'); ?>">Correios</a></li>	
				<li><a class="nav-link" href="<?php echo base_url('restrita/sistema/pagseguro'); ?>">Pagseguro</a></li>
              </ul>
            </li>
			
          </ul>
        </aside>
      </div>