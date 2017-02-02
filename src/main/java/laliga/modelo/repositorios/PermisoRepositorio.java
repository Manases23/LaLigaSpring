package laliga.modelo.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import laliga.modelo.entidades.Permiso;

@Repository
public interface PermisoRepositorio extends CrudRepository<Permiso, Long> {

}
