package recuperatorio_dominio.unq.encuesta

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class IntencionDeCursada {
	
	private Materia materia
	private Turno turno
	
	new(Materia materia, Turno turno){
		this.materia = materia
		this.turno = turno
	}
	
}