<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Welcome extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {

        $sistema = info_header_footer();

        $data = array(
            'titulo' => 'Seja muito bem vindo(a) à Loja virtual ' . $sistema->sistema_nome_fantasia,
            'produtos_destaques' => $this->loja_model->get_produtos_destaques($sistema->sistema_produtos_destaques),
            'produtos_lateral_direita' => $this->loja_model->get_produtos_lateral(),
            'produtos_mais_vendidos' => $this->loja_model->get_produtos_mais_vendidos(),
            'produtos_mais_categoria_periferico' => $this->loja_model->get_produtos_categoria_perifericos(),
        );

//        echo '<pre>';
//        print_r($data['produtos_mais_categoria_periferico']);
//        exit();

        $this->load->view('web/layout/header', $data);
        $this->load->view('web/loja');
        $this->load->view('web/layout/footer');
    }

}
