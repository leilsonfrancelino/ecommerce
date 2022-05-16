<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pedido extends CI_Controller {


    public function __construct()
	{
		parent::__construct();
        $this->load->helper('text');
        if(!$this->ion_auth->logged_in()){
            redirect('login');
        }
		
	}

    public function index(){
        $cliente_user_id = $this->session->userdata('cliente_user_id');      

        if($cliente_user_id){
            $data = array(
                'titulo' => 'Meus Pedidos',
                'pedidos' => $this->pedidos_model->get_all_pedidos_by_cliente($cliente_user_id),
            );
        }

        foreach ($data['pedidos'] as $key => $pedido) {
            $data['pedidos'][$key]->pedidos_produtos = $this->core_model->get_all('pedidos_produtos', array('pedido_id' => $pedido->pedido_id));
        }

        /* echo '<pre>';
        print_r($data);
        exit(); */

            $this->load->view('web/layout/header', $data);
            $this->load->view('web/pedidos');
            $this->load->view('web/layout/footer');
        
    }
}