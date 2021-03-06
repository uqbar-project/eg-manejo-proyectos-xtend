package ar.edu.manejoProyectos

import ar.edu.manejoProyectos.exceptions.BusinessException
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertThrows

@DisplayName("Tests de tarea simple")
class TestTareaSimple {
	
	@DisplayName("calcula correctamente el costo si la complejidad es máxima y tiene un tiempo largo")
	@Test
	def void testCostoComplejidadMaximaTareaLarga() {
		// arrange
		val tareaSimple = new TareaSimple => [
			tiempo = 20
			complejidad = new ComplejidadMaxima
		]

		// assert
		assertEquals(tareaSimple.costo, 635.0, 0.01)
	}

	@Test
	@DisplayName("calcula correctamente el costo si la complejidad es máxima y tiene un tiempo corto")
	def void testCostoComplejidadMaximaTareaChica() {
		// arrange
		val tareaSimple = new TareaSimple() => [
			complejidad = new ComplejidadMaxima
			tiempo = 10
		]
		
		// assert
		assertEquals(tareaSimple.costo, 267.5, 0.01)
	}

	@Test
	@DisplayName("calcula correctamente el costo si la complejidad es media")
	def void testCostoComplejidadMedia() {
		// arrange
		val tareaSimple = new TareaSimple() => [
			tiempo = 10
			complejidad = new ComplejidadMedia
		]
		
		// assert
		assertEquals(tareaSimple.costo, 262.5, 0.01)
	}

	@Test
	@DisplayName("calcula correctamente el costo si la complejidad es mínima")
	def void testCostoSimple() {
		// arrange
		val tareaSimple = new TareaSimple => [
			tiempo = 20
			complejidad = new ComplejidadMinima
		]
		
		// assert
		assertEquals(tareaSimple.costo, 500.0, 0.01)
	}

	@DisplayName("no es válido agregar una subtarea a una tarea simple")
	@Test
	def void testAgregarSubtareaATareaSimple() {
		// arrange
		val tareaSimple = new TareaSimple => [
			tiempo = 20
		]

		// assert
		assertThrows(BusinessException, [ tareaSimple.agregarSubtarea(new TareaSimple) ], "No puede agregar subtareas")
	}

	@DisplayName("calcula correctamente el costo para una tarea simple con impuestos")
	@Test
	def void testCostoConImpuestos() {
		// arrange
		val tareaSimpleConImpuestos = new TareaSimple() => [
			tiempo = 10
			agregarImpuesto(Impuesto.impuestoA)
			agregarImpuesto(Impuesto.impuestoB)
		]
		
		// assert
		assertEquals(tareaSimpleConImpuestos.costo, 270, 0.01)
	}
	
}