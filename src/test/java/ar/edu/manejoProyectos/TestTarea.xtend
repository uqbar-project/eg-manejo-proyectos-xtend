package ar.edu.manejoProyectos

import org.junit.Assert
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException

class TestTarea {
	
	Tarea fregar
	Tarea darClase
	Tarea escribirApunte
	Tarea escribirApunteCorto
	Tarea abrirEmpresaOffshore
	Tarea hacerReporte

	@Rule
	public ExpectedException excepcionEsperada = ExpectedException.none()
	
	@Before
	def void initialize() {
		fregar = new TareaSimple() => [
			tiempo = 20
		]
		escribirApunte = new TareaSimple() => [
			complejidad = new ComplejidadMaxima
			tiempo = 20
		]
		escribirApunteCorto = new TareaSimple() => [
			complejidad = new ComplejidadMaxima
			tiempo = 10
		]
		abrirEmpresaOffshore = new TareaSimple() => [
			tiempo = 10
			agregarImpuesto(new Impuesto(3))
		]
		hacerReporte = new TareaSimple() => [
			tiempo = 10
			complejidad = new ComplejidadMedia
		]
		darClase = new TareaCompuesta() => [
			tiempo = 15
			agregarSubtarea(fregar)
			agregarSubtarea(fregar)
			agregarSubtarea(fregar)
			agregarSubtarea(fregar)
		]
	}

	@Test
	def void testCostoComplejidadMaximaTareaLarga() {
		Assert.assertEquals(escribirApunte.costo, 635.0, 0.01)
	}

	@Test
	def void testCostoComplejidadMaximaTareaChica() {
		Assert.assertEquals(escribirApunteCorto.costo, 267.5, 0.01)
	}

	@Test
	def void testCostoComplejidadMedia() {
		Assert.assertEquals(hacerReporte.costo, 262.5, 0.01)
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
	def void testCostoConImpuestos() {
		Assert.assertEquals(abrirEmpresaOffshore.costo, 257.5, 0.01)
	}

	@Test
	def void testAgregarSubtareaATareaSimple() {
		excepcionEsperada.expectMessage("No puede agregar subtareas")
		fregar.agregarSubtarea(new TareaSimple)
	}

}