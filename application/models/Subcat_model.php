<?php
	defined('BASEPATH') OR exit('Ação não permitida');

	class Subcat_model extends CI_Model {
		
		public function get_all() {
			$this->db->select([
				'categorias.categoria_id',
				'categorias.categoria_nome',
				'categorias.categoria_ativa',	
				'categorias.categoria_meta_link',	
				'categorias.categoria_data_criacao',
				'categorias_pai.categoria_pai_id',
				'categorias_pai.categoria_pai_nome',						
			]);
			
			$this->db->join('categorias_pai', 'categorias.categoria_pai_id = categorias_pai.categoria_pai_id', 'LEFT');			
			
			return $this->db->get('categorias')->result();
		}		
	}	
