package ar.edu.manejoProyectos

import org.junit.Assert
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException

class TestTarea {
	
	Tarea fregar
	Tarea darClase

	@Rule
	public ExpectedException excepcionEsperada = ExpectedException.none()
	
	@Before
	def void initialize() {
		fregar = new Tarea()
		fregar.setTiempo(20)
		darClase = new Tarea()
		darClase.setCompuesta()
		darClase.setTiempo(15)
		darClase.agregarSubtarea(fregar)
		darClase.agregarSubtarea(fregar)
		darClase.agregarSubtarea(fregar)
		darClase.agregarSubtarea(fregar)
	}

	@Test
	def void testCostoSimple() {
		Assert.assertEquals(fregar.costo, 500.0, 0.01)
	}
	
	@Test
	def void testCostoCompuesta() {
		Assert.assertEquals(darClase.costo, 390.0, 0.01)
	}

	@Test
	def void convertirASimple() {
		darClase.setSimple()
		Assert.assertEquals(darClase.costo, 375.0, 0.01)
	}
	
	@Test
	def void testAgregarSubtareaATareaSimple() {
		excepcionEsperada.expectMessage("No puede agregar subtareas")
		fregar.agregarSubtarea(new Tarea)
	}

}