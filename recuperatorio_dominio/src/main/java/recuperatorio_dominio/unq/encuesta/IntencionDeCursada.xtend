package recuperatorio_dominio.unq.encuesta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class IntencionDeCursada {
	
	private Materia materia
	private Turno turno
	
	new(Materia materia, Turno turno){
		this.materia = materia
		this.turno = turno
	}
	
}