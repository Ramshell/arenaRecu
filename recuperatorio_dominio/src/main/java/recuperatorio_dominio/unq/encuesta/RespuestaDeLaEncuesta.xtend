package recuperatorio_dominio.unq.encuesta

import java.util.Date
import java.util.List
import java.util.regex.Matcher
import java.util.regex.Pattern
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors
class RespuestaDeLaEncuesta {
	
	private Carrera carrera
	private List<IntencionDeCursada> materiasACursar
	private Date añoDeIngreso
	private Integer finalesAprobados
	private Integer finalesDesaprobados
	private Integer cursadasAprobadas
	private String mailDelEncuestado
	
	new(){
		materiasACursar = newArrayList
	}
	
	def setCarrera(Carrera carrera){
		this.carrera = carrera
		materiasACursar.clear()
		firePropertyChanged(this,"carrera",carrera)
		firePropertyChanged(this,"materiasACursar",materiasACursar)
	}
	
	def setAñoDeIngreso(Date añoDeIngreso){
		this.añoDeIngreso= añoDeIngreso
		firePropertyChanged(this,"esValida",esValida)
	}
	
	def setMailDelEncuestado(String mail){
		this.mailDelEncuestado= mail
		firePropertyChanged(this,"esValida",esValida)
	}
	
	def agregarMateriaACursar(Materia materia, Turno turno){
		if(materia != null && turno != null){
			val intencionDeCursada = new IntencionDeCursada(materia,turno)
			agregarIntencionDeCursadaPosible(intencionDeCursada)
		}		
		else
			throw new UserException("Debe elegir materia y turno")
	}
	
	
	
	def isEsValida(){
		return carrera !=null && validarCantidadDeMaterias() && añoDeIngreso != null
	}
	
	def handleErrors() {
		if(!mailValido()) throw new UserException("Verifique que el mail sea correcto")
		if(añoDeIngreso.after(new Date())) throw new UserException("La fecha no puede ser posterior al dia de hoy")
	
	}
	
	def private agregarIntencionDeCursadaPosible(IntencionDeCursada intencionDeCursada) {
		if(!materiasACursar.contains(intencionDeCursada)) {
			materiasACursar.add(intencionDeCursada)
			firePropertyChanged(this,"esValida",esValida)
		}
		else throw new UserException("No se puede agregar una materia ya elegida")
	}
	
	def mailValido() {
		if(mailDelEncuestado != null){
			var Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
			var Matcher matcher = VALID_EMAIL_ADDRESS_REGEX .matcher(mailDelEncuestado);
			matcher.find()
		}else false
	}
	
	def private validarCantidadDeMaterias() {
		materiasACursar.size() > 1
	}
	
	
	
}