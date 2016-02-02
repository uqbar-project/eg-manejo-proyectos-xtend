package ar.edu.manejoProyectos

interface TipoDeTarea {
	
	def double getCosto(Tarea tarea)
	def double getCostoTotal(Tarea tarea)
	def void agregarSubtarea(Tarea tarea)
	
}