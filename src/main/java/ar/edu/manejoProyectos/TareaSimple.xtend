package ar.edu.manejoProyectos

import ar.edu.manejoProyectos.exceptions.BusinessException

class TareaSimple implements TipoDeTarea {

	override double getCostoTotal(Tarea tarea) {
		this.getCosto(tarea)
	}

	override double getCosto(Tarea tarea) {
		tarea.costoBase
	}

	override void agregarSubtarea(Tarea tarea) {
		throw new BusinessException("No puede agregar subtareas a una tarea simple")
	}
	
}