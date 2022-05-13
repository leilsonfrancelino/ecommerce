<?php
defined('BASEPATH') OR exit('Ação não permitida');

class Carrinho_model extends CI_Model{
    public function get_by_id($produto_id = null){
        if($produto_id){
            $this->db->select([
                'produtos.produto_id',
                'produtos.produto_nome',                
                'produtos.produto_valor',
                'produtos.produto_meta_link',
                'produtos.produto_quantidade_estoque',
                'produtos.produto_descricao',                
                'produto_peso',
                'produto_largura',
                'produto_altura',
                'produto_comprimento',
                'produtos_fotos.foto_caminho',
            ]);
            $this->db->where('produtos.produto_id', $produto_id);
            $this->db->where('produtos.produto_ativo', 1);
            $this->db->limit(1);
            $this->db->join('produtos_fotos', 'produtos_fotos.foto_produto_id = produtos.produto_id', 'LEFT');
            return $this->db->get('produtos')->row();
        }
    }
    public function get_id($produto_id = NULL){//resolver depois
        $this->db->select([
            'produtos.produto_id',
            'produtos.produto_codigo',
            'produtos.produto_nome',
            'produtos.produto_categoria_id',
            'produtos.produto_marca_id',
            'produtos.produto_valor',
            'produtos.produto_meta_link',
            'produtos.produto_quantidade_estoque',
            'produtos.produto_ativo',
            'produtos.produto_destaque',
            'produtos.produto_control_stock',
            'produtos.produto_descricao',
            'categorias_pai.categoria_pai_id',
            'categorias_pai.categorias_pai_nome',
            'categorias_pai.categorias_pai_meta_link',
            'categorias.categoria_id',
            'categorias.categoria_nome',
            'categorias.categoria_meta_link',
            'marcas.marca_id',
            'marcas.marca_nome',
            'marcas.marca_meta_link',
        ]);
        $this->db->where('produtos.produto_id', $produto_id);
        $this->db->join('marcas','marcas.marca_id = produtos.produto_marca_id');
        $this->db->join('categorias', 'categorias.categoria_id = produtos.produto_categoria_id');
        $this->db->join('categorias_pai', 'categorias_pai.categoria_pai_id = categorias.categoria_pai_id');
        return $this->db->get('produtos')->row();
    } 
}