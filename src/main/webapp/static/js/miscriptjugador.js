$(document).ready(function(){
		
		aplicarListeners();
		limpiarModal();		
		
	});

	var limpiarModal = function(){
		$('#id').val('');
		$('#nombre').val('');
		$('#edad').val('');
		$('#goles').val('');
		$('#equipo').val('');
		$('#posicion').val('');
		$('#federacion').val('');
	};

	var aplicarListeners = function () {
	
			$('.btn-editar').on('click', function(){
				var id = $(this).parents('tr').data('id');
				var url = 'jugadores/'+id;
				
				$.get(url)
					.done(function(jugadores){
						$('#id').val(jugadores.id);
						$('#nombre').val(jugadores.nombre);
						$('#edad').val(jugadores.edad);
						$('#goles').val(jugadores.goles);
						$('#equipo').val(jugadores.equipo);
						$('#posicion').val(jugadores.posicion);
						$('#form-jugadores .modal-title').text("Editando jugadores...")
						
						$('#modal-jugadores').modal('show');
					});
		});
		
		$('.btn-borrar').on('click', function(){
			var id = $(this).parents('tr').data('id');
			
			
			$.ajax({
				url : "jugadores/"+id,
				type: 'DELETE',
			    success: function(result) {
			    	$('tr[data-id="'+id+'"]').remove();
					var jugadores = parseInt( $('#cantidad-jugadores').text() );
			    	$('#cantidad-jugadores').text(jugadores - 1);
			    }
			});
			
		});	
			
	} 