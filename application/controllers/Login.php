<?php

defined('BASEPATH') OR exit('Ação não permitida');

class Login extends CI_Controller {

    public function index() {

        $data = array(
            'titulo' => 'Login na loja virtual',
        );


        $this->load->view('web/layout/header', $data);
        $this->load->view('web/login');
        $this->load->view('web/layout/footer');
    }

    public function auth() {

        /*
         * Array ( [email] => jessica@gmail.com [password] => 123456 [login] => checkout [remember] => on )
         */

        /*
         * Array ( [email] => jessica@gmail.com [password] => 123456 [remember] => on [login] => login )
         */


        $identity = $this->input->post('email');
        $password = $this->input->post('password');
        $remember = ($this->input->post('remember' ? TRUE : FALSE));

        //Para definir o redirect em caso de sucesso, ou seja, Home ou Checkout
        $login = $this->input->post('login');


        if ($this->ion_auth->login($identity, $password, $remember)) {

            if ($this->ion_auth->is_admin()) {
                redirect('restrita');
            } else {

                //Logou com sucesso.... Agora jogamos na sessão o ID do cliente logado
                //Esse ID será usado no controller 'Pagar' para processar o pagamento de um cliente logado (existente)
                $cliente = $this->core_model->get_by_id('clientes', array('cliente_email' => $identity));

                $this->session->set_userdata('cliente_user_id', $cliente->cliente_id);
                $this->session->set_userdata('cliente_nome_completo', $cliente->cliente_nome . ' ' . $cliente->cliente_sobrenome);

                if ($login == 'login') {
                    redirect('/');
                } else {
                    redirect('checkout');
                }
            }
        } else {
            $this->session->set_flashdata('erro', 'Por favor verifique suas credenciais de acesso');

            if ($login == 'login') {
                redirect('login');
            } else {
                redirect('checkout');
            }
        }
    }

    public function logout() {

        $this->ion_auth->logout();
        redirect('/');
    }

}
