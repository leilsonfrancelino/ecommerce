<?php
defined('BASEPATH') OR exit('Ação não permitida');

class Produtos extends CI_Controller {
	
	
	public function __construct() {
		parent::__construct();			
		$this->load->model('Produtos_model','produtos_model');
		if(!$this->ion_auth->logged_in()) {
				redirect('restrita/login');
		}
	}
	public function index() {
		$data = array(
			'titulo' => 'Produtos cadastrados',
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
			'produtos' => $this->produtos_model->get_all(),
		);			
		 
		$this->load->view('restrita/layout/header', $data);
		$this->load->view('restrita/produtos/index');
		$this->load->view('restrita/layout/footer');
	}
	
	public function core($produto_id = NULL) {
		
		$produto_id = (int) $produto_id;
		
		if(!$produto_id) {
			//cadastrando
				
	
				$this->form_validation->set_rules('produto_nome', 'Nome do Produto', 'trim|required|min_length[5]|max_length[240]|callback_valida_nome_produto');
				$this->form_validation->set_rules('produto_categoria_pai_id', 'Categoria do Produto', 'trim|required');				
				$this->form_validation->set_rules('produto_categoria_id', 'Subcategoria do Produto', 'trim|required');
				$this->form_validation->set_rules('produto_marca_id', 'Marca do Produto', 'trim|required');       			
       			$this->form_validation->set_rules('produto_valor', 'Valor de venda do produto', 'trim|required');       			
       			$this->form_validation->set_rules('produto_peso', 'Peso do Produto', 'trim|required|integer');       			
       			$this->form_validation->set_rules('produto_altura', 'Altura do Produto', 'trim|required|integer');
       			$this->form_validation->set_rules('produto_largura', 'Largura do Produto', 'trim|required|integer');       			
       			$this->form_validation->set_rules('produto_comprimento', 'Comprimento do Produto', 'trim|required|integer');       			
       			$this->form_validation->set_rules('produto_quantidade_estoque', 'Quantidade em Estoque', 'trim|required|integer');       			
       			$this->form_validation->set_rules('produto_descricao', 'Descrição do Produto', 'trim|min_length[10]|max_length[15000]');	
				
				$fotos_produtos = $this->input->post('fotos_produtos');
       			if(!$fotos_produtos){
					$this->form_validation->set_rules('fotos_produtos', 'Imagens do produto', 'trim|required');
       			}
				
				if($this->form_validation->run()) {
	
					$data = elements(
       					array(
       						'produto_nome',
							'produto_categoria_pai_id',
       						'produto_categoria_id',							
       						'produto_marca_id',
       						'produto_valor',
       						'produto_peso',
       						'produto_peso',
       						'produto_altura',
       						'produto_largura',
       						'produto_comprimento',
       						'produto_ativo',
       						'produto_quantidade_estoque',
       						'produto_destaque',
       						'produto_controlar_estoque',
       						'produto_descricao',
       					), $this->input->post()
       				);
					
					/* Remove virgula do valor */
       				$data['produto_valor'] = str_replace(',', '', $data['produto_valor']);

       				//criando metalink do produto //
       				$data['produto_meta_link '] = url_amigavel($data['produto_nome']);

       				//Código gerado no cadastro de produtos//
       				$data['produto_codigo'] = $this->input->post('produto_codigo');

       				$data = html_escape($data);

       				$this->core_model->insert('produtos', $data, TRUE);

       				//Recupera últimos id inserido 
       				$produto_id = $this->session->userdata('last_id');
       				
       				//Recuperar do post se veio fotos
       				$fotos_produtos = $this->input->post('fotos_produtos');					
					
					if($fotos_produtos){
       				 	$total_fotos = count($fotos_produtos);

						for($i = 0; $i < $total_fotos; $i++){
							$data = array(
								'foto_produto_id' => $produto_id,
								'foto_caminho' => $fotos_produtos[$i],
							);

							//insere a foto do produtos na tabela produtos_fotos
							$this->core_model->insert('produtos_fotos', $data);
						}
					}
					redirect('restrita/produtos');
					 
				}else{
					//erro de validacao
					
					$data = array(
						'titulo' => 'Cadastrar produto',				
						'styles' =>array(
							'jquery-upload-file/css/uploadfile.css',					
						),

						'scripts' =>array(
							'jquery-upload-file/js/jquery.uploadfile.min.js',
							'js/page/sweetalert2.all.min.js',
							'jquery-upload-file/js/produtos.js',
							'js/page/jquery.mask.min.js',
							'js/page/custom.js'
						),
						//'sistemas' =>  $this->core_model->get_by_id('sistema', array('sistema_id' => 1)); // get all users
			
						'codigo_gerado' => $this->core_model->generate_unique_code('produtos', 'numeric', 8, 'produto_codigo'),
						'categorias' =>  $this->core_model->get_all('categorias', array('categoria_ativa' => 1)),// get a
						'master' =>  $this->core_model->get_all('categorias_pai', array('categoria_pai_ativa' => 1)),// get a
						'marcas' =>  $this->core_model->get_all('marcas', array('marca_ativa' => 1)),// get a
					);
			 					 
					$this->load->view('restrita/layout/header', $data);
					$this->load->view('restrita/produtos/core');
					$this->load->view('restrita/layout/footer');						
						
				}
		}else{
			if(!$produto = $this->core_model->get_by_id('produtos', array('produto_id' => $produto_id))) {
				$this->session->set_flashdata('erro', 'Produto não encontrado');
				redirect('restrita/produtos');
			}else{
				//editando
				$this->form_validation->set_rules('produto_nome', 'Nome do Produto', 'trim|required|min_length[5]|max_length[240]|callback_valida_nome_produto');
				$this->form_validation->set_rules('produto_categoria_pai_id', 'Categoria do Produto', 'trim|required');					
				$this->form_validation->set_rules('produto_categoria_id', 'Subcategoria do Produto', 'trim|required');
				$this->form_validation->set_rules('produto_marca_id', 'Marca do Produto', 'trim|required');       			
       			$this->form_validation->set_rules('produto_valor', 'Valor de venda do produto', 'trim|required');       			
       			$this->form_validation->set_rules('produto_peso', 'Peso do Produto', 'trim|required|integer');       			
       			$this->form_validation->set_rules('produto_altura', 'Altura do Produto', 'trim|required|integer');
       			$this->form_validation->set_rules('produto_largura', 'Largura do Produto', 'trim|required|integer');       			
       			$this->form_validation->set_rules('produto_comprimento', 'Comprimento do Produto', 'trim|required|integer');       			
       			$this->form_validation->set_rules('produto_quantidade_estoque', 'Quantidade em Estoque', 'trim|required|integer');       			
       			$this->form_validation->set_rules('produto_descricao', 'Descrição do Produto', 'trim|min_length[10]|max_length[15000]');	
				
				
				
				if($this->form_validation->run()) {
					
					$data = elements(
       					array(
       						'produto_nome',
							'produto_categoria_pai_id',
       						'produto_categoria_id',
       						'produto_marca_id',
       						'produto_valor',
       						'produto_peso',       						
       						'produto_altura',
       						'produto_largura',
       						'produto_comprimento',
       						'produto_ativo',
       						'produto_quantidade_estoque',
       						'produto_destaque',
       						'produto_controlar_estoque',
       						'produto_descricao',
       					), $this->input->post()
       				);
					
					// Remove virgula do valor 
       				$data['produto_valor'] = str_replace(',', '', $data['produto_valor']);

       				//criando metalink do produto 
       				$data['produto_meta_link'] = url_amigavel($data['produto_nome']);

       				//Código gerado no cadastro de produtos//
       				//$data['produto_codigo'] = $this->input->post('produto_codigo');

       				$data = html_escape($data);

       				$this->core_model->update('produtos', $data, array('produto_id' => $produto_id));
					
					//exclui as imagens antigas do produto
					$this->core_model->delete('produtos_fotos', array('foto_produto_id' => $produto_id));
					
       				//Recupera últimos id inserido //
       				//$produto_id = $this->session->userdata('last_id');
       				
       				//Recuperar do post se veio fotos
       				$fotos_produtos = $this->input->post('fotos_produtos');
					
					if($fotos_produtos) {				   
       				 	$total_fotos = count($fotos_produtos);

						for($i = 0; $i < $total_fotos; $i++){
							$data = array(
								'foto_produto_id' => $produto_id,
								'foto_caminho' => $fotos_produtos[$i],
							);

							//insere a foto do produtos na tabela produtos_fotos
							$this->core_model->insert('produtos_fotos', $data);
						}
					}
					redirect('restrita/produtos');
					 
				}else{
					//erro de validacao
					
					$data = array(
						'titulo' => 'Editar Produto',
						'styles' => array(
							'jquery-upload-file/css/uploadfile.css',							
						),						
						'scripts' => array (
							'sweetalert2/sweetalert2.all.min.js',
							'jquery-upload-file/js/jquery.uploadfile.min.js',
							'jquery-upload-file/js/produtos.js',
							'mask/jquery.mask.min.js',
							'mask/custom.js',							
						),
						'produto' => $produto,
						'fotos_produto' => $this->core_model->get_all('produtos_fotos', array('foto_produto_id' => $produto_id)),
						'categorias' => $this->core_model->get_all('categorias', array('categoria_ativa' => 1)),
						'master' =>  $this->core_model->get_all('categorias_pai', array('categoria_pai_ativa' => 1)),// get a
						'marcas' => $this->core_model->get_all('marcas', array('marca_ativa' => 1)),
						'codigo_gerado' => $this->core_model->generate_unique_code('produtos', 'numeric', 8, 'produto_codigo'),
					);
			 	 	 
				
					 
					$this->load->view('restrita/layout/header', $data);
					$this->load->view('restrita/produtos/core');
					$this->load->view('restrita/layout/footer');						
						
				}
			}
		
		}
	}
	
	public function valida_nome_produto($produto_nome){
         $produto_id = $this->input->post('produto_id');
         if (!$produto_id) {

         	//cadastrando..
         	if ($this->core_model->get_by_id('produtos', array('produto_nome' => $produto_nome))) {				
				$this->form_validation->set_message('valida_nome_produto', 'Esse nome de produto já existe!');
         		return false;         		
         	}else{
         		return true;
         	}
         	
         }else{

            //Editando ...
         	if ($this->core_model->get_by_id('produtos', array('produto_nome' => $produto_nome, 'produto_id !=' => $produto_id))) {				
				$this->form_validation->set_message('valida_nome_produto', 'Esse nome de produto já existe!');
         		return false;         		
         	}else{
         		return true;
         	}
         }
	}
	
	public function upload() {
		$config['upload_path'] = './uploads/produtos/';
			$config['allowed_types'] = 'jpg|png|jpeg';
			$config['max_size']      = 2048; //max 2mb
			$config['max_width']     = 1000;
			$config['max_height']    = 1000;
			$config['max_filename']  = 200;
			$config['encrypt_name']  = TRUE;
			$config['file_ext_tolower']    = TRUE;
			
			$this->load->library('upload', $config);
			
			if($this->upload->do_upload('foto_produto')) {
				$data = array(
					'uploaded_data' => $this->upload->data(),
					'menssagem' => 'Imagem enviada com sucesso',
					'foto_caminho' => $this->upload->data('file_name'),
					'erro' => 0,
				);
				
				//resize image configuration
				$config['image-library'] = 'gd2';
				$config['source_image']  = './uploads/produtos/'.$this->upload->data('file_name');
				$config['new_image']     = './uploads/produtos/small/'.$this->upload->data('file_name');				
				$config['width']         = 300;
				$config['heigth']        = 300;			
				
				//chama a biblioteca
				$this->load->library('image_lib', $config);	

				//faz o resize
				//$this->image_lib->resize();
				
				if(!$this->image_lib->resize()) {
					$data['erro'] = $this->image_lib->display_errors();
				}
				
			}else{
				$data = array(
					'menssagem' => $this->upload->display_errors(),
					'erro' => 5,
				);
			}
			echo json_encode($data);
	}
	
	public function delete($produto_id = NULL){
		$produto_id = (int) $produto_id;

		if(!$produto_id || !$this->core_model->get_by_id('produtos', array('produto_id' => $produto_id))){
			$this->session->set_flashdata('erro', 'Produto não encontrado!');
			redirect('restrita/produtos');
	    }

		if($this->core_model->get_by_id('produtos', array('produto_id' => $produto_id, 'produto_ativo' => 1))){
			$this->session->set_flashdata('erro', 'Não é permitido excluir um produto ativo!');
			redirect('restrita/produtos');
	   }
   
	   //recuperação de fotos produto antes da exclusão do banco de dados //
	   $fotos_produto = $this->core_model->get_all('produtos_fotos', array('foto_produto_id' => $produto_id));

	   //Excluir produtos//
	   $this->core_model->delete('produtos', array('produto_id' => $produto_id));

	   //Elimina a fotos do produtos 
	   if($fotos_produto){
			foreach ($fotos_produto as $foto) {				

				$foto_grande = FCPATH .'uploads/produtos/'. $foto->foto_caminho;
				$foto_pequena = FCPATH .'uploads/produtos/small'. $foto->foto_caminho;

				//Excluir as imagens
				if(file_exists($foto_grande) && file_exists($foto_pequena)) {

					//unlink função nativa do php para exlusão//
					unlink($foto_grande);
					unlink($foto_pequena);
				}
		
		    }

        }

		redirect('restrita/produtos','refresh');

	}
	
		function get_sub_category(){
			$category_id = $this->input->post('id',TRUE);
			$data = $this->produtos_model->get_sub_category($category_id)->result();
			echo json_encode($data);
		
	}
}