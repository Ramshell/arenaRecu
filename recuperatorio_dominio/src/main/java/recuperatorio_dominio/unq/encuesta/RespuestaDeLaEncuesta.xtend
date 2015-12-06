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
			materiasACursar.add(new IntencionDeCursada(materia,turno))
			firePropertyChanged(this,"esValida",esValida)
			
		}
		else
			throw new UserException("Debe elegir materia y turno")
	}
	
	def isEsValida(){
		return carrera !=null && validarCantidadDeCarreras() && añoDeIngreso != null && mailValido(mailDelEncuestado)
	}
	
	def private validarCantidadDeCarreras() {
		materiasACursar.size() > 1
	}
	
	def private mailValido(String email) {
		var Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
		var Matcher matcher = VALID_EMAIL_ADDRESS_REGEX .matcher(email);
		matcher.find()
	}
	
	def handleErrors() {
		if(!mailValido(mailDelEncuestado)) throw new UserException("Verifique que el mail sea correcto")
		if(añoDeIngreso.after(new Date())) throw new UserException("La fecha no puede ser posterior al dia de hoy")
	
	}
	
	
	
}