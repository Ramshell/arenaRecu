package recuperatorio_dominio

import java.util.Calendar
import java.util.Date
import org.junit.Before
import org.junit.Test
import org.uqbar.commons.model.UserException
import recuperatorio_dominio.unq.encuesta.Carrera
import recuperatorio_dominio.unq.encuesta.IntencionDeCursada
import recuperatorio_dominio.unq.encuesta.Materia
import recuperatorio_dominio.unq.encuesta.RespuestaDeLaEncuesta
import recuperatorio_dominio.unq.encuesta.Turno

import static org.junit.Assert.*

class RespuestaDeLaEncuestaTestCase {
	
	RespuestaDeLaEncuesta systemUnderTest;
	Carrera carreraAuxiliar;
	Materia interfaces;Materia persistencia;Materia estructuras
	
	@Before
	def setup(){
		
		interfaces = new Materia("interfaces")
		persistencia = new Materia("persistencia")
		estructuras = new Materia("estructuras")
		val materias = newArrayList
		materias.add(interfaces);materias.add(persistencia);materias.add(estructuras)
		carreraAuxiliar = new Carrera("Enfermería",materias)
		
		systemUnderTest = new RespuestaDeLaEncuesta()
		systemUnderTest.setCarrera(carreraAuxiliar)
	}
	
	@Test
	def test_mailIncorrecto_retorna_false(){
		systemUnderTest.mailDelEncuestado = "mail invalido"
		assertFalse(systemUnderTest.mailValido())
	}
	
	@Test
	def test_mailCorrecto_retorna_true(){
		systemUnderTest.mailDelEncuestado = "mail@valido.com"
		assertTrue(systemUnderTest.mailValido())
	}
	
	
	@Test
	def test_setCarrera_borra_las_materias_seleccionadas(){
		val otraCarrera = new Carrera("OtraCarrera")
		systemUnderTest.agregarMateriaACursar(interfaces,Turno.Mañana)
		systemUnderTest.setCarrera(otraCarrera)
		assertTrue(systemUnderTest.materiasACursar.empty)
	}
	
	@Test(expected = UserException)
	def test_agregar_una_materia_ya_agregada_tira_user_exception(){
		systemUnderTest.agregarMateriaACursar(interfaces,Turno.Mañana)
		systemUnderTest.agregarMateriaACursar(interfaces,Turno.Tarde)
		fail("no tiro exepción")
	}
	
	@Test(expected = UserException)
	def test_handleErrors_mail_valido_pero_con_fecha_invalida_tira_exception(){
		systemUnderTest.mailDelEncuestado = "mail@valido.com"
		val date = diaDeHoyMasUno()
		systemUnderTest.añoDeIngreso  = date
		systemUnderTest.handleErrors()
		fail("no tiro exepción")
	}
	
	def private diaDeHoyMasUno() {
		val Calendar cal = Calendar.getInstance();
		        cal.setTime(new Date());
		        cal.add(Calendar.DATE, 1);
		        val date = cal.getTime()
		date
	}
	
}