package encuestador

import org.uqbar.arena.windows.SimpleWindow
import recuperatorio_dominio.unq.appModel.EncuestasAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.bindings.PropertyAdapter
import recuperatorio_dominio.unq.encuesta.Carrera

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
		
		new Label(mainPanel) => [
			text ='''Seleccioná una carrera'''
		]
		new Selector(mainPanel) => [
			allowNull = false
			bindItemsToProperty("carreras").adapter = new PropertyAdapter(Carrera, "nombre")
			bindValueToProperty("carreraSeleccionada")
		]
		
	}
	
}