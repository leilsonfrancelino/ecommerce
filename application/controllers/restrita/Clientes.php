<?php
defined('BASEPATH') OR exit('Ação não permitida');

class Clientes extends CI_Controller {
	
	
	public function __construct() {
		parent::__construct();		
	
	
		if(!$this->ion_auth->logged_in()) {
				redirect('restrita/login');
		}
	}
	
	public function index() {
		$data = array(
			'titulo' => 'Clientes Cadastrados',
			'styles' => array(
				'bundles/datatables/datatables.min.css',
				'bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css',
			),
			
			'scripts' => array (
				'bundles/datatables/datatables.min.js',
				'bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js',
				'bundles/jquery-ui/jquery-ui.min.js',
				'js/page/datatables.js',
			),
			'clientes' => $this->core_model->get_all('clientes'),
		);
		
	
		
		$this->load->view('restrita/layout/header', $data);
		$this->load->view('restrita/clientes/index');
		$this->load->view('restrita/layout/footer');
	}	
		public function core($cliente_id = NULL) {
			
			$cliente_id = (int) $cliente_id;
			
			if(!$cliente_id) {
				
				//cadastrar
				
					$this->form_validation->set_rules('cliente_nome', 'Nome', 'trim|required|min_length[4]|max_length[40]');
					$this->form_validation->set_rules('cliente_sobrenome', 'Sobrenome', 'trim|required|min_length[4]|max_length[140]');
					$this->form_validation->set_rules('cliente_data_nascimento', 'Data Nascimento', 'trim|required');
					$this->form_validation->set_rules('cliente_cpf', 'CPF', 'trim|required|exact_length[14]|callback_valida_cpf');
					$this->form_validation->set_rules('cliente_email', 'E-mail', 'trim|required|valid_email|min_length[10]|max_length[100]|callback_valida_email');
					$cliente_telefone_fixo = $this->input->post('cliente_telefone_fixo');
				    if($cliente_telefone_fixo){
					  $this->form_validation->set_rules('cliente_telefone_fixo', 'Telefone Fixo', 'trim|exact_length[14]|callback_valida_telefone_fixo');
				    }

					$this->form_validation->set_rules('cliente_telefone_movel', 'Telefone Celular', 'trim|required|min_length[14]|max_length[15]callback_valida_telefone_movel');
					$this->form_validation->set_rules('cliente_cep', 'CEP', 'trim|required|exact_length[9]');
					$this->form_validation->set_rules('cliente_endereco', 'Logradouro', 'trim|required|min_length[4]|max_length[140]');
					$this->form_validation->set_rules('cliente_numero_endereco', 'Número', 'trim|required|max_length[15]');
					$this->form_validation->set_rules('cliente_bairro', 'Bairro', 'trim|required|min_length[3]|max_length[40]');
					$this->form_validation->set_rules('cliente_cidade', 'Cidade', 'trim|required|min_length[4]|max_length[100]');
					$this->form_validation->set_rules('cliente_estado', 'Estado', 'trim|required|exact_length[2]');
					$this->form_validation->set_rules('cliente_complemento', 'Complemento', 'trim|max_length[130]');

					$this->form_validation->set_rules('password', 'Senha', 'trim|min_length[6]|max_length[200]');
                    $this->form_validation->set_rules('confirma', 'Confirma', 'trim|matches[password]');
								
					if($this->form_validation->run()) {
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
				   
				    /* echo '<pre>';
                    print_r($data);
                    exit(); */
					
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

					 
					 redirect('restrita/clientes');
				   
				   }else{
						//erro validacao
						$data = array(
							'titulo' => 'Cadastrar Cliente',
							
							'scripts' => array (
								'mask/jquery.mask.min.js',
								'mask/custom.js',
							),
							
						);					
						
						$this->load->view('restrita/layout/header', $data);
						$this->load->view('restrita/clientes/core');
						$this->load->view('restrita/layout/footer');
						
					}
				
			}else{
				//editando
				if(!$cliente = $this->core_model->get_by_id('clientes', array('cliente_id' => $cliente_id))) {
					$this->session->set_flashdata('erro', 'Cliente não encontrado');
					redirect('restrita/clientes');
				}else{
					//Cliente encontrado
					$this->form_validation->set_rules('cliente_nome', 'Nome', 'trim|required|min_length[4]|max_length[40]');
					$this->form_validation->set_rules('cliente_sobrenome', 'Sobrenome', 'trim|required|min_length[4]|max_length[140]');
					$this->form_validation->set_rules('cliente_data_nascimento', 'Data Nascimento', 'trim|required');
					$this->form_validation->set_rules('cliente_cpf', 'CPF', 'trim|required|exact_length[14]|callback_valida_cpf');
					$this->form_validation->set_rules('cliente_email', 'E-mail', 'trim|required|valid_email|min_length[10]|max_length[100]|callback_valida_email');
					$cliente_telefone_fixo = $this->input->post('cliente_telefone_fixo');
				    if($cliente_telefone_fixo){
					  $this->form_validation->set_rules('cliente_telefone_fixo', 'Telefone Fixo', 'trim|exact_length[14]|callback_valida_telefone_fixo');
				    }

					$this->form_validation->set_rules('cliente_telefone_movel', 'Telefone Celular', 'trim|required|min_length[14]|max_length[15]callback_valida_telefone_movel');
					$this->form_validation->set_rules('cliente_cep', 'CEP', 'trim|required|exact_length[9]');
					$this->form_validation->set_rules('cliente_endereco', 'Logradouro', 'trim|required|min_length[4]|max_length[140]');
					$this->form_validation->set_rules('cliente_numero_endereco', 'Número', 'trim|required|max_length[15]');
					$this->form_validation->set_rules('cliente_bairro', 'Bairro', 'trim|required|min_length[3]|max_length[40]');
					$this->form_validation->set_rules('cliente_cidade', 'Cidade', 'trim|required|min_length[4]|max_length[100]');
					$this->form_validation->set_rules('cliente_estado', 'Estado', 'trim|required|exact_length[2]');
					$this->form_validation->set_rules('cliente_complemento', 'Complemento', 'trim|max_length[130]');

					$this->form_validation->set_rules('password', 'Senha', 'trim|min_length[6]|max_length[200]');
                    $this->form_validation->set_rules('confirma', 'Confirma', 'trim|matches[password]');
								
					if($this->form_validation->run()) {
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
				   
				    /* echo '<pre>';
                    print_r($data);
                    exit(); */
					
				   $this->core_model->update('clientes', $data,  array('cliente_id' => $cliente_id));
				   
				   //Inicio da atualização da tabela de Usuário				   
                   $dados_usuario = array(
                       'first_name' => $this->input->post('cliente_nome'),
                       'last_name' => $this->input->post('cliente_sobrenome'),
                       'email' => $this->input->post('cliente_email'),
                   );			   
				   
                   $password = $this->input->post('password');
				   
				   //Atualiza senha caso seja passada
                   if($password){
                       $dados_usuario['password'] = $password;
                   }

                   $usuario = $this->core_model->get_by_id('users', array('cliente_user_id' => $cliente_id));
				   
				   $dados_usuario = html_escape($dados_usuario);
				   
				   $user_id = $usuario->id;
				   
				   $this->ion_auth->update($user_id, $dados_usuario);				   
				   
				   redirect('restrita/clientes');
				   
				   }else{
						//erro validacao
						$data = array(
							'titulo' => 'Editar Cliente',
							
							'scripts' => array (
								'mask/jquery.mask.min.js',
								'mask/custom.js',
							),
							'cliente' => $cliente,
						);					
						
						$this->load->view('restrita/layout/header', $data);
						$this->load->view('restrita/clientes/core');
						$this->load->view('restrita/layout/footer');
						
					}
				}
			}

	}
	
	public function valida_cpf($cpf) {

        if ($this->input->post('cliente_id')) {

            $cliente_id = $this->input->post('cliente_id');

            if ($this->core_model->get_by_id('clientes', array('cliente_id !=' => $cliente_id, 'cliente_cpf' => $cpf))) {
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
	
	public function valida_telefone_fixo($cliente_telefone_fixo) {
        $cliente_id = $this->input->post('cliente_id');

        if(!$cliente_id){
            //Cadastrar

            if($this->core_model->get_by_id('clientes', array('cliente_telefone_fixo' => $cliente_telefone_fixo))){
                
                $this->form_validation->set_message('valida_telefone_fixo', 'Esse número de telefone já existe');

                return FALSE;
            }else{
                return true;
            }
            
        }else{
            //Editar
            if($this->core_model->get_by_id('clientes', array('cliente_telefone_fixo' => $cliente_telefone_fixo, 'cliente_id !=' => $cliente_id))){
                
                $this->form_validation->set_message('valida_telefone_fixo', 'Esse número de telefone já existe');

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
                
                $this->form_validation->set_message('valida_telefone_movel', 'Esse número de telefone já existe');

                return FALSE;
            }else{
                return true;
            }
            
        }else{
            //Editar
            if($this->core_model->get_by_id('clientes', array('cliente_telefone_movel' => $cliente_telefone_movel, 'cliente_id !=' => $cliente_id))){
                
                $this->form_validation->set_message('valida_telefone_movel', 'Esse número de telefone já existe');

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
	
	public function delete($cliente_id = NULL) {

        if(!$this->ion_auth->is_admin()){
            $this->session->set_flashdata('erro', 'Usuário não tem permissão para acessar este menu');
            redirect('restrita/clientes');
        }

        if(!$this->core_model->get_by_id('clientes', array('cliente_id' => $cliente_id))){
            $this->session->set_flashdata('erro', 'Cliente não encontrado');
            redirect('restrita/clientes');
        }

        if($this->core_model->get_by_id('users', array('cliente_user_id' => $cliente_id, 'active' => 1))){
            $this->session->set_flashdata('erro', 'Cliente com usuário ativo não pode ser excluido');
            redirect('restrita/clientes');
        }

        $this->core_model->delete('clientes', array('cliente_id' => $cliente_id));
        $this->session->set_flashdata('sucesso', 'Cliente deletado');
        redirect('restrita/clientes');
    }
}
