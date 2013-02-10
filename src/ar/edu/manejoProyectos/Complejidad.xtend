package ar.edu.manejoProyectos

abstract class Complejidad {
	
	def double getCosto(Tarea tarea) {
		tarea.tiempo * 25
	}
}