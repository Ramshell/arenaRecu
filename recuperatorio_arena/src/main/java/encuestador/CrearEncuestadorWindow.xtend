package encuestador

import componentes.LabelYEditTextVertical
import componentes.LabelYSelectorVertical
import extra.DateTextFilter
import org.uqbar.arena.bindings.DateAdapter
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import recuperatorio_dominio.unq.appModel.EncuestasAppModel
import recuperatorio_dominio.unq.encuesta.Carrera
import recuperatorio_dominio.unq.encuesta.IntencionDeCursada
import recuperatorio_dominio.unq.encuesta.Materia
import recuperatorio_dominio.unq.encuesta.Turno
import org.uqbar.arena.widgets.Button

class CrearEncuestadorWindow extends SimpleWindow<EncuestasAppModel>{
	
	new(WindowOwner parent, EncuestasAppModel model) {
		super(parent, model)
		title = "Intención de cursada"
	}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
	}
	
	override createMainTemplate(Panel mainPanel){
		
		mainPanel.layout = new VerticalLayout 
		
		crearInicioDeEncuesta(mainPanel)
		val panelDeAgregarMateria = new Panel(mainPanel)
		panelDeAgregarMateria.setLayout(new ColumnLayout(2))
		val verticalDeAgregarMateria = new Panel(panelDeAgregarMateria)
		verticalDeAgregarMateria.setLayout(new VerticalLayout)
		val verticalDeTablaDeMateria = new Panel(panelDeAgregarMateria)
		verticalDeTablaDeMateria.setLayout(new VerticalLayout)
		crearSeleccionDeMateria(verticalDeAgregarMateria)
		crearTablaDeMaterias(verticalDeTablaDeMateria)
		
		var botonDeEnvio = new Button(mainPanel) => [
			caption = "Enviar encuesta"
			bindEnabledToProperty = "respuestaDeLaEncuesta.esValida"
		]
		botonDeEnvio.onClick([|modelObject.enviarEncuesta()])	
	}
	
	def crearSeleccionDeMateria(Panel mainPanel) {
		
		new LabelYSelectorVertical(mainPanel,"Materia que estás pensando cursar","respuestaDeLaEncuesta.carrera.materias",Materia,"descripcion","materiaSeleccionada")
		new LabelYSelectorVertical(mainPanel,"Turno","turnosPosibles",String,null,"turnoSeleccionado")
		
		
		var botonDeAgregarMateria = new Button(mainPanel) => [
			caption = "Agregar materia"
			bindEnabledToProperty = "puedeAgregarMateria"
		]
		botonDeAgregarMateria.onClick([|modelObject.agregarMateria()])	
		
		
		mainPanel
	}
	
	def crearInicioDeEncuesta(Panel mainPanel) {
		new LabelYSelectorVertical(mainPanel,"Seleccioná una carrera","carreras",Carrera,"nombre","respuestaDeLaEncuesta.carrera")
		
		new LabelYEditTextVertical(mainPanel,"Año en el que ingresaste a la facu","respuestaDeLaEncuesta.añoDeIngreso",new DateTextFilter,new DateAdapter)
		new LabelYEditTextVertical(mainPanel,"¿Cuantos finales aprobaste?","respuestaDeLaEncuesta.finalesAprobados",null,null)
		new LabelYEditTextVertical(mainPanel,"¿Cuantos finales desaprobaste?","respuestaDeLaEncuesta.finalesDesaprobados",null,null)
		new LabelYEditTextVertical(mainPanel,"¿Cuantos cursadas aprobaste?","respuestaDeLaEncuesta.cursadasAprobadas",null,null)
		new LabelYEditTextVertical(mainPanel,"Ingresa tu e-mail","respuestaDeLaEncuesta.mailDelEncuestado",null,null)
	}
	
	def private crearTablaDeMaterias(Panel verticalDeTablaDeMateria) {
		val table = new Table<IntencionDeCursada>(verticalDeTablaDeMateria, typeof(IntencionDeCursada)) => [
			bindItemsToProperty("respuestaDeLaEncuesta.materiasACursar")
		]
		
		new Column<IntencionDeCursada>(table) => [
			title = "Materia"
			fixedSize = 200
			bindContentsToProperty("materia.descripcion")
			]
		new Column<IntencionDeCursada>(table) => [
			title = "Turno"
			fixedSize = 200
			bindContentsToProperty("turno")
			]
	}
	
}