package ar.edu.manejoProyectos

import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Tests de tarea compuesta")
class TestTareaCompuesta {

	@DisplayName("al calcular el costo suma el costo por overhead correctamente")	
	@Test
	def void testCostoCompuesta() {
		// arrange
		val tareaCompuesta = new Tarea() => [
			tiempo = 15
			tipoDeTarea = new TareaCompuesta => [
				agregarSubtarea(new Tarea => [tiempo = 10])
				agregarSubtarea(new Tarea => [tiempo = 10])
				agregarSubtarea(new Tarea => [tiempo = 10])
				agregarSubtarea(new Tarea => [tiempo = 10])
			]
		]

		// assert
		assertEquals(tareaCompuesta.costo, 390.0, 0.01)
	}

}