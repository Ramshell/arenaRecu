package recuperatorio_dominio.unq.appModel

import java.util.List
import recuperatorio_dominio.unq.encuesta.Carrera
import org.eclipse.xtend.lib.annotations.Accessors
import recuperatorio_dominio.unq.encuesta.Turno
import recuperatorio_dominio.unq.encuesta.Materia
import recuperatorio_dominio.unq.encuesta.RespuestaDeLaEncuesta
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors
class EncuestasAppModel {
	
	//public static final EncuestasAppModel instance = new EncuestasAppModel();
	
	private List<Carrera> carreras
	private Carrera carreraSeleccionada
	private Turno turnoSeleccionado
	private Materia materiaSeleccionada
	private RespuestaDeLaEncuesta respuestaDeLaEncuesta
	private List<RespuestaDeLaEncuesta> encuestasRealizadas
	
	new(){
		this.carreras = newArrayList
		respuestaDeLaEncuesta = new RespuestaDeLaEncuesta()
		encuestasRealizadas = newArrayList
		
	}
	
	new(List<Carrera> carreras){
		this.carreras = carreras
		respuestaDeLaEncuesta = new RespuestaDeLaEncuesta()
		encuestasRealizadas = newArrayList
		
	}
	
	def agregarCarrera(Carrera carrera){
		carreras.add(carrera)
	}
	
	def agregarMateria(){
		respuestaDeLaEncuesta.agregarMateriaACursar(materiaSeleccionada,turnoSeleccionado)
	}
	
	def setCarreraSeleccionada(){
		this.carreraSeleccionada = carreraSeleccionada
		respuestaDeLaEncuesta = new RespuestaDeLaEncuesta()
		respuestaDeLaEncuesta.carrera = carreraSeleccionada
	}
	
	def setMateriaSeleccionada(Materia materia){
		materiaSeleccionada = materia
		firePropertyChanged(this,"puedeAgregarMateria",puedeAgregarMateria)
	}
	
	def setTurnoSeleccionado(Turno turno){
		turnoSeleccionado = turno
		firePropertyChanged(this,"puedeAgregarMateria",puedeAgregarMateria)
	}
	
	def getTurnosPosibles(){
		Turno.values.toList
	}
	
	
	def isPuedeAgregarMateria(){
		materiaSeleccionada != null && turnoSeleccionado !=null
	}
	
	def enviarEncuesta(){
		respuestaDeLaEncuesta.handleErrors()
		encuestasRealizadas.add(respuestaDeLaEncuesta)
		respuestaDeLaEncuesta = new RespuestaDeLaEncuesta()
	}
	
}