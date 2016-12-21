package ar.edu.manejoProyectos

import org.eclipse.xtend.lib.annotations.Data

@Data class Impuesto {
	double porcentaje
	
	new(int porcentajeNeto) {
		this.porcentaje = porcentajeNeto / 100d
	}
	
	def double getCostoImpositivo(double costo) {
		porcentaje * costo
	}
}