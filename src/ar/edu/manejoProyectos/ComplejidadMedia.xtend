package ar.edu.manejoProyectos

import ar.edu.manejoProyectos.Complejidad

class ComplejidadMedia extends Complejidad {

	override double getCosto(Tarea tarea) {
		super.getCosto(tarea) * 1.05
	}	
	
}