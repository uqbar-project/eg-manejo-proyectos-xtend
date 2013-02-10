package ar.edu.manejoProyectos

import java.util.ArrayList
import java.util.Collection

class Tarea {
	
	@Property int tiempo = 0
	@Property Complejidad complejidad = new ComplejidadMinima
	@Property Collection<Impuesto> impuestos = new ArrayList<Impuesto>
	@Property TipoDeTarea tipoDeTarea = new TareaSimple

	def double getCosto() {
		tipoDeTarea.getCosto(this)
	}
	
	def double getCostoTotal() {
		tipoDeTarea.getCostoTotal(this)
	}
	
	def double getCostoBase() {
		val costoComplejidad = complejidad.getCosto(this)
		costoComplejidad + this.getCostoImpositivo(costoComplejidad)	
	}

	def double getCostoImpositivo(double costo) {
		impuestos.fold (0.0) [ acum, impuesto | acum + impuesto.getCostoImpositivo(costo) ]
	}

	def void setCompuesta() {
		tipoDeTarea = new TareaCompuesta
	}
	
	def void setSimple() {
		tipoDeTarea = new TareaSimple
	}

	def void agregarSubtarea(Tarea tarea) {
		tipoDeTarea.agregarSubtarea(tarea)
	}

}