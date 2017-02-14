$(document).ready(function(){
		
		$('.btn-editar').on('click', function(){
				var id = $(this).parents('tr').data('id');
				var url = 'equipos/'+id;
				
				$.get(url)
					.done(function(equipo){
						$('#id').val(equipo.id);
						$('#estadio').val(equipo.estadio);
						$('#nombre').val(equipo.nombre);
						$('#presupuesto').val(equipo.presupuesto);
						$('#division').val(equipo.division);
						$('#imagen').val(equipo.imagen);
					console.log(equipo);
					$('#form-equipos .modal-title').text("Editando equipos...")
						
						$('#modal-equipos').modal('show');
					});
		});
		
		
		
		$('.btn-borrar-mostrar-modal').on('click', function(){
			var id = $(this).parents('tr').data('id');
			$('#idborrar').val(id);
			$('#modal-equiposborrar').modal('show');
		});	
		
		
		$('#btn-borrar').on('click', function(){
			
			var id = $('#idborrar').val();  
			var csrf = $('#csrf').val();
			$.ajax({
					url : "equipos/"+id,
					type: 'DELETE',
					headers: {'X-CSRF-TOKEN': csrf},
				    success: function(result) {
				    	$('tr[data-id="'+id+'"]').remove();
						var equipos = parseInt( $('#cantidad-equipos').text() );
				    	$('#cantidad-equipos').text(equipos - 1);	
				    	$('#modal-equiposborrar').modal('hide');
				    },
				    error: function (error) {
				    	console.log(error);
				    }
			});
			
		
		});	
	
});