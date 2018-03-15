package ar.edu.manejoProyectos

import ar.edu.manejoProyectos.exceptions.BusinessException
import java.util.ArrayList
import java.util.Collection
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Tarea {
	
	int tiempo = 0
	Complejidad complejidad = new ComplejidadMinima
	Collection<Impuesto> impuestos = new ArrayList<Impuesto>

	def double costo() {
		this.costoPorOverhead() + this.costoComplejidad() + this.costoImpositivo()	
	}
	
	def double costoComplejidad() {
		complejidad.costo(this)
	}
	
	def double costoImpositivo() {
		val costo = this.costoComplejidad
		impuestos.fold (0.0) [ acum, impuesto | acum + impuesto.costoImpositivo(costo) ]
	}

	def void agregarImpuesto(Impuesto impuesto) {
		impuestos.add(impuesto)
	}

	abstract def double costoPorOverhead()

	abstract def void agregarSubtarea(Tarea tarea)

	abstract def double costoTotal()

}

class TareaCompuesta extends Tarea {
	
	List<Tarea> subtareas = newArrayList
	
	override costoPorOverhead() { 
		this.costoComplejidad() * this.factorMultiplicacionOverhead()
	}
	
	def private double factorMultiplicacionOverhead() {
		if (this.tieneMuchasTareas()) 0.04 else 0
	}

	def private boolean tieneMuchasTareas() {
		subtareas.size() > 3
	}

	override double costoTotal() {
		subtareas.fold (this.costo()) [ acum, subtarea | acum + subtarea.costoTotal ]
	}

	override void agregarSubtarea(Tarea tarea) {
		subtareas.add(tarea)
	}
	
}

class TareaSimple extends Tarea {

	override double costoTotal() { this.costo()	}

	override costoPorOverhead() { 0 }

	override void agregarSubtarea(Tarea tarea) {
		throw new BusinessException("No puede agregar subtareas a una tarea simple")
	}
	
}