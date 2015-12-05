package recuperatorio_dominio.unq.encuesta


import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Materia {
	private String descripcion
	
	new(String descripcion){
		this.descripcion = descripcion
	}
	
}