package recuperatorio_dominio;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.uqbar.commons.model.UserException;

import recuperatorio_dominio.unq.encuesta.Carrera;
import recuperatorio_dominio.unq.encuesta.IntencionDeCursada;
import recuperatorio_dominio.unq.encuesta.Materia;
import recuperatorio_dominio.unq.encuesta.RespuestaDeLaEncuesta;
import recuperatorio_dominio.unq.encuesta.Turno;

@SuppressWarnings("all")
public class RespuestaDeLaEncuestaTestCase {
  private RespuestaDeLaEncuesta systemUnderTest;
  
  private Carrera carreraAuxiliar;
  
  private Materia interfaces;
  
  private Materia persistencia;
  
  private Materia estructuras;
  
  @Before
  public void setup() {
    Materia _materia = new Materia("interfaces");
    this.interfaces = _materia;
    Materia _materia_1 = new Materia("persistencia");
    this.persistencia = _materia_1;
    Materia _materia_2 = new Materia("estructuras");
    this.estructuras = _materia_2;
    final ArrayList<Materia> materias = CollectionLiterals.<Materia>newArrayList();
    materias.add(this.interfaces);
    materias.add(this.persistencia);
    materias.add(this.estructuras);
    Carrera _carrera = new Carrera("Enfermería", materias);
    this.carreraAuxiliar = _carrera;
    RespuestaDeLaEncuesta _respuestaDeLaEncuesta = new RespuestaDeLaEncuesta();
    this.systemUnderTest = _respuestaDeLaEncuesta;
    this.systemUnderTest.setCarrera(this.carreraAuxiliar);
  }
  
  @Test
  public void test_mailIncorrecto_retorna_false() {
    this.systemUnderTest.setMailDelEncuestado("mail invalido");
    boolean _mailValido = this.systemUnderTest.mailValido();
    Assert.assertFalse(_mailValido);
  }
  
  @Test
  public void test_mailCorrecto_retorna_true() {
    this.systemUnderTest.setMailDelEncuestado("mail@valido.com");
    boolean _mailValido = this.systemUnderTest.mailValido();
    Assert.assertTrue(_mailValido);
  }
  
  @Test
  public void test_setCarrera_borra_las_materias_seleccionadas() {
    final Carrera otraCarrera = new Carrera("OtraCarrera");
    this.systemUnderTest.agregarMateriaACursar(this.interfaces, Turno.Mañana);
    this.systemUnderTest.setCarrera(otraCarrera);
    List<IntencionDeCursada> _materiasACursar = this.systemUnderTest.getMateriasACursar();
    boolean _isEmpty = _materiasACursar.isEmpty();
    Assert.assertTrue(_isEmpty);
  }
  
  @Test(expected = UserException.class)
  public void test_agregar_una_materia_ya_agregada_tira_user_exception() {
    this.systemUnderTest.agregarMateriaACursar(this.interfaces, Turno.Mañana);
    this.systemUnderTest.agregarMateriaACursar(this.interfaces, Turno.Tarde);
    Assert.fail("no tiro exepción");
  }
  
  @Test(expected = UserException.class)
  public void test_handleErrors_mail_valido_pero_con_fecha_invalida_tira_exception() {
    this.systemUnderTest.setMailDelEncuestado("mail@valido.com");
    final Date date = this.diaDeHoyMasUno();
    this.systemUnderTest.setAñoDeIngreso(date);
    this.systemUnderTest.handleErrors();
    Assert.fail("no tiro exepción");
  }
  
  private Date diaDeHoyMasUno() {
    Date _xblockexpression = null;
    {
      final Calendar cal = Calendar.getInstance();
      Date _date = new Date();
      cal.setTime(_date);
      cal.add(Calendar.DATE, 1);
      final Date date = cal.getTime();
      _xblockexpression = date;
    }
    return _xblockexpression;
  }
}
