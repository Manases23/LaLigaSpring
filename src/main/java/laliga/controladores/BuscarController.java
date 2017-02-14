package laliga.controladores;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import laliga.modelo.repositorios.EquipoRepositorio;
import laliga.modelo.repositorios.FederacionRepositorio;
import laliga.modelo.repositorios.JugadorRepositorio;

@Controller
@RequestMapping ("/buscar")
public class BuscarController {
	
	@Autowired
	private FederacionRepositorio federacionRepo;
	
	@Autowired
	private EquipoRepositorio equipoRepo;
	
	@Autowired
	private JugadorRepositorio jugadorRepo;
	
	@RequestMapping (method=RequestMethod.GET)
	public String inicio(Model model){
		return "busqueda";
	}

	@RequestMapping (method=RequestMethod.POST)
	public String buscar(@RequestParam String busqueda, Model model){
		
		busqueda = "%"+busqueda+"%";
		
	       model.addAttribute("tituloBus", "TU BUSQUEDA");
	       
	        model.addAttribute("tituloJug", "jugador");
	        model.addAttribute("tituloEqui", "equipo");
	        model.addAttribute("tituloFed", "Federaciones");
	        
	        model.addAttribute("jugadores", jugadorRepo.findByNombreIgnoreCaseContaining(busqueda));
	        model.addAttribute("equipos", equipoRepo.findByNombreIgnoreCaseContaining(busqueda));
	        model.addAttribute("federaciones", federacionRepo.findByNombreIgnoreCaseContaining(busqueda));
		
		
		return "busqueda";
	}
	
}
