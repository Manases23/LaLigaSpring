package laliga.modelo.repositorios;

import java.util.List;
import java.util.Set;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import laliga.modelo.entidades.Equipo;
import laliga.modelo.entidades.Jugador;

@Repository
public interface JugadorRepositorio extends CrudRepository<Jugador, Long> {

	Set<Jugador> findAllByEquipo(Equipo equipo);

	List<Jugador> findByNombreIgnoreCaseContaining(String buscar);
}
