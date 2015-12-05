package recuperatorio_dominio.unq.encuesta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Materia {
	private String descripcion
	
	new(String descripcion){
		this.descripcion = descripcion
	}
	
}