package encuestador

import org.uqbar.arena.Application
import recuperatorio_dominio.unq.appModel.EncuestasAppModel
import recuperatorio_dominio.unq.encuesta.Carrera
import recuperatorio_dominio.unq.encuesta.Materia

class Encuestador extends Application{
	
	override protected createMainWindow() {
		var carreras = crearCarreras()
		new CrearEncuestadorWindow(this,new EncuestasAppModel(carreras))
	}
	
	def static main(String[] args) {
		new Encuestador().start
	}
	
	private def crearCarreras() {
		var interfaces = new Materia("Construcción de Interfaces de Usuario")
		var estructuras = new Materia("Estructuras de Datos")
		var persistencia = new Materia("Persistencia")
		var corteYConfexion = new Materia("Corte y Confexión")
		var pensamientoCientifico = new Materia("Pensamiento Cieníifico")
		var sociedadYEstado = new Materia("Sociedad y Estado")
		var tpi = new Carrera("Tecnicatura en Programación Informatica")
		var podologia = new Carrera("Podología")
		tpi.agregarMateria(interfaces)
		tpi.agregarMateria(estructuras)
		tpi.agregarMateria(persistencia)
		podologia.agregarMateria(corteYConfexion)
		podologia.agregarMateria(pensamientoCientifico)
		podologia.agregarMateria(sociedadYEstado)
		
		var carreras = newArrayList
		carreras.add(tpi)
		carreras.add(podologia)
		carreras
	}
	
}