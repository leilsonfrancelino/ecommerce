<?php
	defined('BASEPATH') OR exit('Ação não permitida');

	class Produtos_model extends CI_Model {
		
		public function get_all() {
			$this->db->select([				
				'produtos.produto_id',
				'produtos.produto_codigo',
				'produtos.produto_nome',
				'produtos.produto_valor',
				'produtos.produto_ativo',
				'categorias.categoria_id',
				'categorias.categoria_nome',
				'categorias_pai.categoria_pai_id',
				'categorias_pai.categoria_pai_nome',
				'marcas.marca_nome',			
			]);			
			
			$this->db->join('categorias', 'categorias.categoria_id = produtos.produto_categoria_id', 'LEFT');
			$this->db->join('marcas', 'marcas.marca_id = produtos.produto_marca_id', 'LEFT');       
			$this->db->join('categorias_pai', 'categorias_pai.categoria_pai_id = categorias.categoria_pai_id', 'LEFT');			
		
			return $this->db->get('produtos')->result();
		}	

		function get_sub_category($category_id){
		$query = $this->db->get_where('categorias', array('categoria_pai_id' => $category_id));
		
		return $query;
	}
		
	}	
	
	
