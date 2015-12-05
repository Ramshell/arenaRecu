package recuperatorio_dominio.unq.encuesta

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Carrera {
	
	private String nombre
	private List<Materia> materias
	
	new(String nombre){
		this.nombre=nombre
		materias = newArrayList
	}
	
	new(String nombre, List<Materia> materias){
		this.nombre = nombre
		this.materias = materias
	}
	
	def agregarMateria(Materia materia){
		materias.add(materia)
	}
	
}