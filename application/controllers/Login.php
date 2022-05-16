<?php   

defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller
{
   
    public function index()
    {
        $data = array(
            'titulo' => 'Login Cliente',
        );
      
        $this->load->view('web/layout/header', $data);
        $this->load->view('web/login');
        $this->load->view('web/layout/footer');
    }

    public function auth()
    {
        //print_r($this->input->post());
        //exit();

        $identity = $this->input->post('email');
        $password = $this->input->post('password');
        $remember = ($this->input->post('remember' ? TRUE : FALSE));

        $login = $this->input->post('login');

        if($this->ion_auth->login($identity, $password, $remember)){
           // $this->session->set_flashdata('sucesso', 'Bem Vindo(a)!');
           if($this->ion_auth->is_admin()){
            redirect('restrita');
           }else{

               // Colocar na sessão o usuário logado

                $cliente = $this->core_model->get_by_id('clientes', array('cliente_email' => $identity));

                $this->session->set_userdata('cliente_user_id', $cliente->cliente_id);
                $this->session->set_userdata('cliente_nome', $cliente->cliente_nome .' '. $cliente->cliente_sobrenome);

                

               if($login == 'login'){
                redirect('/'); 
               }else{
                redirect('checkout');
               }
            
           }
           
        }else{
            $this->session->set_flashdata('erro', 'Senha ou Email inválidos !');
            if($login == 'login'){
                redirect('login'); 
               }else{
                redirect('checkout');
               }
            
        }
    }

    public function logout()
    {
        $this->ion_auth->logout();
       
        redirect('/');
       
      
    }
}