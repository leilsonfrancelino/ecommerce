<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Subcat_model extends CI_Model{

     public function get_categorias_filha($categoria_pai_id = NULL)
    {
        $this->db->select([
            'categorias.*',
            'categoria_id.categoria_pai_id',

        ]);

        $this->db->where('categorias.categoria_pai_id', $categoria_pai_id);

        $this->db->where('categorias.categoria_ativa', 1);          

        return $this->db->get('categorias')->result();
    }