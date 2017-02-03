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
		
		
		
		$('.btn-borrar').on('click', function(){
			var id = $(this).parents('tr').data('id');
			
			$.ajax({
				url : "equipos/"+id,
				type: 'DELETE',
			    success: function(result) {
			    	$('tr[data-id="'+id+'"]').remove();
					var equipos = parseInt( $('#cantidad-equipos').text() );
			    	$('#cantidad-equipos').text(equipos - 1);
			    }
			});
			
		});
		
	});
	