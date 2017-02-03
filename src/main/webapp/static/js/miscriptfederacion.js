	$(document).ready(function(){
		
		$('.btn-editar').on('click', function(){
				var id = $(this).parents('tr').data('id');
				var url = 'federaciones/'+id;
				
				$.get(url)
					.done(function(federacion){
						$('#id').val(federacion.id);
						$('#nombre').val(federacion.nombre);
						$('#edad').val(federacion.pais);
						$('#form-federaciones .modal-title').text("Editando federaciones...")
						
						$('#modal-federaciones').modal('show');
					});
		});
		

		$('.btn-borrar-mostrar-modal').on('click', function(){
			var id = $(this).parents('tr').data('id');
			$('#idborrar').val(id);
			$('#modal-federacionesborrar').modal('show');
		});	
		
		
		$('#btn-borrar').on('click', function(){
			var id = $('#idborrar').val();  
			var csrf = $('#csrf').val();
				$.ajax({
					url : "federaciones/"+id,
					type: 'DELETE',
					headers: {'X-CSRF-TOKEN': csrf},
				    success: function(result) {
				    	$('tr[data-id="'+id+'"]').remove();
						var federaciones = parseInt( $('#cantidad-federaciones').text() );
				    	$('#cantidad-federaciones').text(federaciones - 1);				    	
				    },
				    error: function (error) {
				    	console.log(error);
				    }
			});
			
		
		});	
	
});