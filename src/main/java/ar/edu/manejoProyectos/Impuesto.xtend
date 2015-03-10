package ar.edu.manejoProyectos

import org.eclipse.xtend.lib.annotations.Data

@Data class Impuesto {
	double porcentaje
	
	def double getCostoImpositivo(double costo) {
		porcentaje * costo / 100
	}
}