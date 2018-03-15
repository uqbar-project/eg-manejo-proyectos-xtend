package ar.edu.manejoProyectos

abstract class Complejidad {
	
	def double costo(Tarea tarea) {
		tarea.tiempo * 25d
	}
	
}

class ComplejidadMaxima extends Complejidad {
	
	/**
	 * buen ejemplo para ver la diferencia entre
	 * var = una variable con efecto (colateral), que puede modificar su referencia
	 * val = una variable "final", que no cambia su referencia una vez ligada
	 */
	override double costo(Tarea tarea) {
		val tiempoTarea = tarea.tiempo
		var costo = super.costo(tarea) * 1.07
		if (tiempoTarea >= 10) {
			val diferencia = tiempoTarea - 10
			costo = costo + (10 * diferencia)
		}
		costo
	}

}

class ComplejidadMedia extends Complejidad {

	override double costo(Tarea tarea) {
		super.costo(tarea) * 1.05d
	}	
	
}

class ComplejidadMinima extends Complejidad {
	
}