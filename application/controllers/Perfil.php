<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Perfil extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {

        $cliente_id = (int) $this->session->userdata('cliente_user_id');


        /* Se não houver cliente logado ou não achar o cliente no banco de dados, irá criar um novo cliente */
        if(!$cliente_id || !$cliente = $this->core_model->get_by_id('clientes', array('cliente_id' => $cliente_id))){
            //Cadastrar Cliente
           
          $this->form_validation->set_rules('cliente_nome', 'Nome', 'trim|required|min_length[4]|max_length[40]');
          $this->form_validation->set_rules('cliente_sobrenome', 'Sobrenome', 'trim|required|min_length[4]|max_length[140]');
          $this->form_validation->set_rules('cliente_data_nascimento', 'Data de Nascimento', 'trim|required');
          $this->form_validation->set_rules('cliente_cpf', 'CPF do cliente', 'trim|required|exact_length[14]|callback_valida_cpf');
          $this->form_validation->set_rules('cliente_email', 'Email', 'trim|required|valid_email|callback_valida_email');

          $cliente_telefone_fixo = $this->input->post('cliente_telefone_fixo');

          if($cliente_telefone_fixo){
              $this->form_validation->set_rules('cliente_telefone_fixo', 'Telefone fixo/residencial', 'trim|exact_length[15]|callback_valida_telefone_fixo');
           }

          $this->form_validation->set_rules('cliente_telefone_movel', 'Telefone celular', 'trim|required|callback_valida_telefone_movel');
          $this->form_validation->set_rules('cliente_cep', 'CEP', 'trim|required');
          $this->form_validation->set_rules('cliente_endereco', 'Logradouro', 'trim|required');
          $this->form_validation->set_rules('cliente_numero_endereco', 'Número', 'trim|required');
          $this->form_validation->set_rules('cliente_bairro', 'Bairro', 'trim|required');
          $this->form_validation->set_rules('cliente_cidade', 'Cidade', 'trim|required');
          $this->form_validation->set_rules('cliente_estado', 'Estado', 'trim|required');
          $this->form_validation->set_rules('cliente_complemento', 'Complemento', 'trim');

          $this->form_validation->set_rules('password', 'Senha', 'trim|min_length[6]|max_length[200]');
          $this->form_validation->set_rules('confirma', 'Confirma', 'trim|matches[password]');

          if($this->form_validation->run()){
              //Validou
             $data = elements(
                 array(
                     'cliente_nome',
                     'cliente_sobrenome',
                     'cliente_data_nascimento',
                     'cliente_cpf',
                     'cliente_email',
                     'cliente_telefone_fixo',
                     'cliente_telefone_movel',
                     'cliente_cep',
                     'cliente_endereco',
                     'cliente_numero_endereco',
                     'cliente_bairro',
                     'cliente_cidade',
                     'cliente_estado',
                     'cliente_complemento',
                 ),$this->input->post()
             );

             $data = html_escape($data);

             // echo '<pre>';
             // print_r($data);
             // exit();

             $this->core_model->insert('clientes', $data, TRUE);
             $cliente_user_id = $this->session->userdata('last_id');

             //Incio da criação do Usuário
             $username = $this->input->post('cliente_nome');
             $password = $this->input->post('password');
             $email = $this->input->post('cliente_email');

             $dados_usuario = array(
                 'cliente_user_id' => $cliente_user_id,
                 'first_name' => $this->input->post('cliente_nome'),
                 'last_name' => $this->input->post('cliente_sobrenome'),
                 'phone' => $this->input->post('cliente_telefone_movel'),
                 'active' => 1,
             );
             $group = array('2'); // Add ao grupo como cliente.

             $this->ion_auth->register($username, $password, $email, $dados_usuario, $group);

             $this->session->set_flashdata('sucesso', 'Cliente Cadastrado');
             redirect('login');

          }else{
              
              //Erro ao validar
              $data = array(
                  'titulo' => 'Cadastrar Cliente',
                  'styles' => array(
                      'bundles/datatables/datatables.min.css',
                      'bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css',
                   ),
                   'scripts' => array (
                      
                       'mask/jquery.mask.min.js',
                       'mask/custom.js'   
                   ),
                 
              );
           
             // echo '<pre>';
             // print_r($data['cliente']);
             // exit();
      
              $this->load->view('web/layout/header', $data);
              $this->load->view('web/perfil');
              $this->load->view('web/layout/footer');
          }

        }else{

            //Verifica se o cliente está logado

            if(!$this->ion_auth->logged_in()){
                $this->session->set_flashdata('erro', 'Cliente não encontrado');
                redirect('login');

            }else{

                //Editando o cliente logado
               
                $this->form_validation->set_rules('cliente_nome', 'Nome', 'trim|required|min_length[4]|max_length[40]');
                $this->form_validation->set_rules('cliente_sobrenome', 'Sobrenome', 'trim|required|min_length[4]|max_length[140]');
                $this->form_validation->set_rules('cliente_data_nascimento', 'Data de Nascimento', 'trim|required');
                $this->form_validation->set_rules('cliente_cpf', 'CPF do cliente', 'trim|required|exact_length[14]|callback_valida_cpf');
                $this->form_validation->set_rules('cliente_email', 'Email', 'trim|required|valid_email|callback_valida_email');

                $cliente_telefone_fixo = $this->input->post('cliente_telefone_fixo');

                if($cliente_telefone_fixo){
                    $this->form_validation->set_rules('cliente_telefone_fixo', 'Telefone fixo/residencial', 'trim|exact_length[15]|callback_valida_telefone_fixo');
                 }

                $this->form_validation->set_rules('cliente_telefone_movel', 'Telefone celular', 'trim|required|callback_valida_telefone_movel');
                $this->form_validation->set_rules('cliente_cep', 'CEP', 'trim|required');
                $this->form_validation->set_rules('cliente_endereco', 'Logradouro', 'trim|required');
                $this->form_validation->set_rules('cliente_numero_endereco', 'Número', 'trim|required');
                $this->form_validation->set_rules('cliente_bairro', 'Bairro', 'trim|required');
                $this->form_validation->set_rules('cliente_cidade', 'Cidade', 'trim|required');
                $this->form_validation->set_rules('cliente_estado', 'Estado', 'trim|required');
                $this->form_validation->set_rules('cliente_complemento', 'Complemento', 'trim');

                $this->form_validation->set_rules('password', 'Senha', 'trim|min_length[6]|max_length[200]');
                $this->form_validation->set_rules('confirma', 'Confirma', 'trim|matches[password]');

                if($this->form_validation->run()){
                    //Validou
                   
                   $data = elements(
                       array(
                           'cliente_nome',
                           'cliente_sobrenome',
                           'cliente_data_nascimento',
                           'cliente_cpf',
                           'cliente_email',
                           'cliente_telefone_fixo',
                           'cliente_telefone_movel',
                           'cliente_cep',
                           'cliente_endereco',
                           'cliente_numero_endereco',
                           'cliente_bairro',
                           'cliente_cidade',
                           'cliente_estado',
                           'cliente_complemento',
                       ),$this->input->post()
                   );

                   $data = html_escape($data);

                   // echo '<pre>';
                   // print_r($data);
                   // exit();

                   $this->core_model->update('clientes', $data,  array('cliente_id' => $cliente_id));

                   //Incio da atualização do Usuário
                  
                   $dados_usuario = array(
                       'first_name' => $this->input->post('cliente_nome'),
                       'last_name' => $this->input->post('cliente_sobrenome'),
                       'email' => $this->input->post('cliente_email'),
                   );

                   //Atualiza senha caso seja passada
                   $password = $this->input->post('password');
                   if($password){
                       $dados_usuario['password'] = $password;
                   }

                   $usuario = $this->core_model->get_by_id('users', array('cliente_user_id' => $cliente_id));

                   $dados_usuario = html_escape($dados_usuario);

                   $usurio_id = $usuario->id;
                   $this->ion_auth->update($usurio_id, $dados_usuario);

                   $this->session->set_flashdata('sucesso', 'Cliente Editado');
                   redirect('perfil');

                }else{
                    
                    //Erro ao validar
                    $data = array(
                        'titulo' => 'Atualizar perfil',
                        'styles' => array(
                            'bundles/datatables/datatables.min.css',
                            'bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css',
                         ),
                         'scripts' => array (
                            
                             'mask/jquery.mask.min.js',
                             'mask/custom.js',
                             
                             
                         ),
                        'cliente' => $cliente,
                    );
                 
                  /*   echo '<pre>';
                    print_r($data['cliente']);
                    exit(); */
            
                    $this->load->view('web/layout/header', $data);
                    $this->load->view('web/perfil');
                    $this->load->view('web/layout/footer');
                }
            }
        }

    }

    public function valida_cpf($cpf)
    {

        if ($this->input->post('cliente_id')) {
            //caso exista um cliente
            $cliente_id = $this->input->post('cliente_id');

            if ($this->core_model->get_by_id('clientes', array('cliente_id !=' => $cliente_id, 'cliente_cpf' => $cpf))) {
                $this->form_validation->set_message('valida_cpf', 'O campo {field} já existe, ele deve ser único');
                return FALSE;
            }
        }else{
            //caso não exista um cliente
            if ($this->core_model->get_by_id('clientes', array('cliente_cpf' => $cpf))) {
                $this->form_validation->set_message('valida_cpf', 'O campo {field} já existe, ele deve ser único');
                return FALSE;
            }
        }

        $cpf = str_pad(preg_replace('/[^0-9]/', '', $cpf), 11, '0', STR_PAD_LEFT);
        // Verifica se nenhuma das sequências abaixo foi digitada, caso seja, retorna falso
        if (strlen($cpf) != 11 || $cpf == '00000000000' || $cpf == '11111111111' || $cpf == '22222222222' || $cpf == '33333333333' || $cpf == '44444444444' || $cpf == '55555555555' || $cpf == '66666666666' || $cpf == '77777777777' || $cpf == '88888888888' || $cpf == '99999999999') {

            $this->form_validation->set_message('valida_cpf', 'Por favor digite um CPF válido');
            return FALSE;
        } else {
            // Calcula os números para verificar se o CPF é verdadeiro
            for ($t = 9; $t < 11; $t++) {
                for ($d = 0, $c = 0; $c < $t; $c++) {
                    $d += $cpf[$c] * (($t + 1) - $c); //Se PHP version < 7.4, $cpf{$c}
                }
                $d = ((10 * $d) % 11) % 10;
                if ($cpf[$c] != $d) { //Se PHP version < 7.4, $cpf{$c}
                    $this->form_validation->set_message('valida_cpf', 'Por favor digite um CPF válido');
                    return FALSE;
                }
            }
            return TRUE;
        }
    }

    public function valida_telefone_fixo($cliente_telefone_fixo)
    {
        $cliente_id = $this->input->post('cliente_id');

        if(!$cliente_id){
            //Cadastrar

            if($this->core_model->get_by_id('clientes', array('cliente_telefone_fixo' => $cliente_telefone_fixo))){
                
                $this->form_validation->set_message('cliente_telefone_fixo', 'Esse número de telefone já está sendo utilizado');

                return FALSE;
            }else{
                return true;
            }
            
        }else{
            //Editar
            if($this->core_model->get_by_id('clientes', array('cliente_telefone_fixo' => $cliente_telefone_fixo, 'cliente_id !=' => $cliente_id))){
                
                $this->form_validation->set_message('cliente_telefone_fixo', 'Esse número de telefone já está sendo utilizado');

                return FALSE;
            }else{
                return true;
            }
        }
    }

    public function valida_telefone_movel($cliente_telefone_movel)
    {
        $cliente_id = $this->input->post('cliente_id');

        if(!$cliente_id){
            //Cadastrar

            if($this->core_model->get_by_id('clientes', array('cliente_telefone_movel' => $cliente_telefone_movel))){
                
                $this->form_validation->set_message('cliente_telefone_movel', 'Esse número de telefone já está sendo utilizado');

                return FALSE;
            }else{
                return true;
            }
            
        }else{
            //Editar
            if($this->core_model->get_by_id('clientes', array('cliente_telefone_movel' => $cliente_telefone_movel, 'cliente_id !=' => $cliente_id))){
                
                $this->form_validation->set_message('cliente_telefone_movel', 'Esse número de telefone já está sendo utilizado');

                return FALSE;
            }else{
                return true;
            }
        }
    }

    public function valida_email($cliente_email)
    {
        $cliente_id = $this->input->post('cliente_id');

        if(!$cliente_id){
            //Cadastrar Usuário
            if($this->core_model->get_by_id('clientes', array('cliente_email' => $cliente_email))){
                $this->form_validation->set_message('valida_email', 'Esse e-mail já existe');
                return false;
            }else{
                return true;
            }
        }else{
            //Editar Usuário
            if($this->core_model->get_by_id('clientes', array('cliente_email' => $cliente_email, 'cliente_id !=' => $cliente_id))){
                $this->form_validation->set_message('valida_email', 'Esse e-mail já existe');
                return false;
            }else{
                return true;
            }
        }
    }

   /*  public function delete($cliente_id = NULL)
    {

        if(!$this->ion_auth->is_admin()){
            $this->session->set_flashdata('erro', 'Só administrador pode deletar o cliente');
            redirect('restrita/cliente');
        }

        if(!$this->core_model->get_by_id('clientes', array('cliente_id' => $cliente_id))){
            $this->session->set_flashdata('erro', 'Cliente não encontrado');
            redirect('restrita/cliente');
        }

        if($this->core_model->get_by_id('users', array('cliente_user_id' => $cliente_id, 'active' => 1))){
            $this->session->set_flashdata('erro', 'Esse cliente não pode ser excluido (ativo)');
            redirect('restrita/cliente');
        }

        $this->core_model->delete('clientes', array('cliente_id' => $cliente_id));
        $this->session->set_flashdata('sucesso', 'Cliente deletado');
        redirect('restrita/cliente');
    } */
}
