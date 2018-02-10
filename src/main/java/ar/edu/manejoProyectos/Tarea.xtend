package ar.edu.manejoProyectos

import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Tarea {
	
	int tiempo = 0
	Complejidad complejidad = new ComplejidadMinima
	Collection<Impuesto> impuestos = new ArrayList<Impuesto>
	TipoDeTarea tipoDeTarea = new TareaSimple

	def double costo() {
		this.costoPorOverhead(this) + this.costoBase() + this.costoImpositivo(this)	
	}
	
	def double costoBase() {
		complejidad.getCosto(this)
	}
	
	def double costoTotal() {
		tipoDeTarea.getCostoTotal(this)
	}
	
	def costoPorOverhead(Tarea tarea) {
		tipoDeTarea.costoPorOverhead(tarea)
	}

	def double costoImpositivo(Tarea tarea) {
		val costo = tarea.costoBase
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
	
	def void agregarImpuesto(Impuesto impuesto) {
		impuestos.add(impuesto)
	}

}