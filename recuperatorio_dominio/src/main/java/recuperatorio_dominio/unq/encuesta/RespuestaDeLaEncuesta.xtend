package recuperatorio_dominio.unq.encuesta

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List
import java.util.Date
import org.uqbar.commons.model.UserException

@Observable
@Accessors
class RespuestaDeLaEncuesta {
	
	private Carrera carrera
	private List<IntencionDeCursada> materiasACursar
	private Date añoDeIngreso
	private Integer finalesAprobados
	private Integer finalesDesaprobados
	private String mailDelEncuestado
	
	new(){
		materiasACursar = newArrayList
	}
	
	def agregarMateriaACursar(Materia materia, Turno turno){
		if(materia != null && turno != null)
			materiasACursar.add(new IntencionDeCursada(materia,turno))
		else
			throw new UserException("Debe elegir materia y turno")
	}
	
	
	
}