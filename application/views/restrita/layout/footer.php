<<?php if($this->router->fetch_class() != 'login') : ?>	
	<footer class="main-footer">
        <div class="footer-left">
          <a href="templateshub.net">Templateshub</a></a>
        </div>
        <div class="footer-right">
        </div>
      </footer>
<?php endif; ?>
	  
    </div>
  </div>
  <!-- General JS Scripts -->
  <script src="<?php echo base_url('public/assets/js/app.min.js') ?>"></script>
  <!-- JS Libraies -->
  <!-- Page Specific JS File -->
  <!-- Template JS File -->
  <script src="<?php echo base_url('public/assets/js/scripts.js') ?>"></script>
  
  <script src="<?php echo base_url('public/assets/js/util.js') ?>"></script>
	
	<?php if (isset($scripts)): ?>
	
		<?php foreach ($scripts as $script): ?>
			<script src="<?php echo base_url('public/assets/' .$script); ?>"></script>
		<?php endforeach; ?>
	
	<?php endif; ?>
	
  <!-- Custom JS File -->
  <script src="<?php echo base_url('public/assets/js/custom.js') ?>"></script>
  
  <script>
		$('.delete').on("click", function (event) {
			event.preventDefault();
			var choice = confirm($(this).attr('data-confirm'));
			
			if(choice) {
				window.location.href = $(this).attr('href');
			}			
		});
  </script>
  
 <!-- JS CKEditor -->
  <script src="//cdn.ckeditor.com/4.18.0/full/ckeditor.js"></script>
  <!-- adicionando editor no cadastro e edição de produtos -->	
  <script>CKEDITOR.replace( 'produto_descricao' );</script>  
	
	<!-- JS para preencher select subcategoria de acordo com a escolha da categoria em cadastro de produto -->
	<script type="text/javascript">
		$(document).ready(function(){

			$('#produto_categoria_pai_id').change(function(){ 
				var id=$(this).val();
				
				$.ajax({
					url : "<?php echo site_url('restrita/produtos/get_sub_category');?>",
					method : "POST",
					data : {id: id},
					async : true,
					dataType : 'json',
					success: function(data){
						$('#produto_categoria_id').removeAttr('readonly');
						$('#produto_categoria_id').removeAttr('disabled');
						var html = '';
						var i;
						for(i=0; i<data.length; i++){
							html += '<option value='+data[i].categoria_id+'>'+data[i].categoria_nome+'</option>';
						}
						$('#produto_categoria_id').html(html);
					}
				});
				return false;
			}); 
			
			});
	</script>
  
</body>

<!-- blank.html  21 Nov 2019 03:54:41 GMT -->
</html>
