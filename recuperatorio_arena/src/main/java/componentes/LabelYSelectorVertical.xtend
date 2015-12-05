package componentes

import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.bindings.PropertyAdapter

class LabelYSelectorVertical extends Panel {
	
	
	new(Container container,String textLabel, String nombreDeLaListaDelSelector,Class claseDelSelector,String propiedadAMostrar,String propiedadABindear) {
		super(container)
		
		this.layout = new VerticalLayout() =>[
			
			new Label(this) =>[
				text = textLabel
			]
			new Selector(this) => [
				allowNull = false
				if (propiedadAMostrar != null)
					bindItemsToProperty(nombreDeLaListaDelSelector).adapter = new PropertyAdapter(claseDelSelector, propiedadAMostrar)
				else
					bindItemsToProperty(nombreDeLaListaDelSelector)
				bindValueToProperty(propiedadABindear)
			]
		
		
		]
	}
	
	
}