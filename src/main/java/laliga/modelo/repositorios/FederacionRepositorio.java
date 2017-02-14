package laliga.modelo.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import laliga.modelo.entidades.Federacion;

@Repository
public interface FederacionRepositorio extends JpaRepository<Federacion, Long> {


	List<Federacion> findByNombreIgnoreCaseContaining(String buscar);

}
