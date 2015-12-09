package extra

import org.uqbar.arena.widgets.TextFilter
import org.uqbar.arena.widgets.TextInputEvent

class NumberTextFilter implements TextFilter {
	
	override accept(TextInputEvent event){
		event.potentialTextResult.matches("[0-9]*")
	}
	
}