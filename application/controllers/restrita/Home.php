<?php

defined('BASEPATH') OR exit('Ação não permitida');

class Home extends CI_Controller {

    public function __construct() {
        parent::__construct();

        //Existe uma sessão?
        if (!$this->ion_auth->logged_in()) {
            redirect('restrita/login');
        }
    }

    public function index() {

        $data = array(
            'titulo' => 'Home área administrativa',
            'vendas_concluidas' => $this->core_model->count_all_results('transacoes', array('transacao_status' => 3)),
            'vendas_canceladas' => $this->core_model->count_all_results('transacoes', array('transacao_status' => 7)),
            'total_clientes' => $this->core_model->count_all_results('clientes'),
            'total_vendas' => $this->home_model->get_soma_total_vendas(),
            
            
            'pagamentos_cartao' => $this->core_model->count_all_results('transacoes', array('transacao_tipo_metodo_pagamento' => 1)),
            'pagamentos_boleto' => $this->core_model->count_all_results('transacoes', array('transacao_tipo_metodo_pagamento' => 2)),
            'pagamentos_transferencia' => $this->core_model->count_all_results('transacoes', array('transacao_tipo_metodo_pagamento' => 3)),
            
           
        );

//        echo '<pre>';
//        print_r($data);
//        exit();


        $this->load->view('restrita/layout/header', $data);
        $this->load->view('restrita/home/index');
        $this->load->view('restrita/layout/footer');
    }

}
