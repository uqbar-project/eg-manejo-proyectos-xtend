package ar.edu.manejoProyectos

import ar.edu.manejoProyectos.exceptions.BusinessException
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestTarea {
	
	Tarea fregar
	Tarea darClase
	Tarea escribirApunte
	Tarea escribirApunteCorto
	Tarea abrirEmpresaOffshore
	Tarea hacerReporte

	@Before
	def void initialize() {
		fregar = new Tarea() => [
			tiempo = 20
		]
		escribirApunte = new Tarea() => [
			complejidad = new ComplejidadMaxima
			tiempo = 20
		]
		escribirApunteCorto = new Tarea() => [
			complejidad = new ComplejidadMaxima
			tiempo = 10
		]
		abrirEmpresaOffshore = new Tarea() => [
			tiempo = 10
			agregarImpuesto(new Impuesto(3))
		]
		hacerReporte = new Tarea() => [
			tiempo = 10
			complejidad = new ComplejidadMedia
		]
		darClase = new Tarea() => [
			setCompuesta
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
	def void convertirASimple() {
		darClase.setSimple()
		Assert.assertEquals(darClase.costo, 375.0, 0.01)
	}
	
	@Test
	def void testAgregarSubtareaATareaSimple() {
		Assert.assertThrows("No puede agregar subtareas", typeof(BusinessException), [ fregar.agregarSubtarea(new Tarea) ])
	}

}