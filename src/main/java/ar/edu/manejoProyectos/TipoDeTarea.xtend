package ar.edu.manejoProyectos

import ar.edu.manejoProyectos.exceptions.BusinessException
import java.util.List

interface TipoDeTarea {
	
	def double getCostoTotal(Tarea tarea)
	def void agregarSubtarea(Tarea tarea)
	def double costoPorOverhead(Tarea tarea)
	
}

class TareaCompuesta implements TipoDeTarea {
	
	List<Tarea> subtareas = newArrayList
	
	override costoPorOverhead(Tarea tarea) { 
		tarea.costoBase * factorMultiplicacionOverhead
	}
	
	def private double factorMultiplicacionOverhead() {
		if (this.tieneMuchasTareas()) 0.04 else 0
	}

	def private boolean tieneMuchasTareas() {
		subtareas.size > 3
	}

	override double getCostoTotal (Tarea tarea) {
		subtareas.fold (tarea.costoBase) [ acum, subtarea | acum + subtarea.costoTotal ]
	}

	override void agregarSubtarea(Tarea tarea) {
		subtareas.add(tarea)
	}
	
}

class TareaSimple implements TipoDeTarea {

	override double getCostoTotal(Tarea tarea) {
		tarea.costoBase
	}

	override costoPorOverhead(Tarea tarea) { 0 }

	override void agregarSubtarea(Tarea tarea) {
		throw new BusinessException("No puede agregar subtareas a una tarea simple")
	}
	
}