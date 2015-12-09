package componentes

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.bindings.Transformer
import org.uqbar.arena.widgets.TextFilter

class LabelYEditTextVertical extends Panel {
	
	
	new(Panel container,String textLabel, String nombreDeLaPropiedad,TextFilter filter,Transformer transformer) {
		super(container)

		
			new Label(container) => [
				text = textLabel
			]
			new TextBox(container) => [
				if(filter != null) withFilter(filter)
				var bind =bindValueToProperty(nombreDeLaPropiedad)
				if(transformer != null) bind.transformer = transformer
			]
		
	}
	
	
}