package ar.edu.manejoProyectos

import ar.edu.manejoProyectos.Complejidad

class ComplejidadMaxima extends Complejidad {
	
	/**
	 * buen ejemplo para ver la diferencia entre
	 * var = una variable con efecto (colateral), que puede modificar su referencia
	 * val = una variable "final", que no cambia su referencia una vez ligada
	 */
	override double getCosto(Tarea tarea) {
		val tiempoTarea = tarea.tiempo
		var costo = super.getCosto(tarea) * 1.07
		if (tiempoTarea >= 10) {
			val diferencia = tiempoTarea - 10
			costo = costo + (10 * diferencia)
		}
		costo
	}

}