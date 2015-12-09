package componentes

import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector

class LabelYSelectorVertical extends Panel {
	
	
	new(Panel container,String textLabel, String nombreDeLaListaDelSelector,Class claseDelSelector,String propiedadAMostrar,String propiedadABindear) {
		super(container)
		
			
			new Label(container) =>[
				text = textLabel
			]
			new Selector(container) => [
				allowNull = false
				if (propiedadAMostrar != null)
					bindItemsToProperty(nombreDeLaListaDelSelector).adapter = new PropertyAdapter(claseDelSelector, propiedadAMostrar)
				else
					bindItemsToProperty(nombreDeLaListaDelSelector)
				bindValueToProperty(propiedadABindear)
			]
		
		
	}
	
	
}