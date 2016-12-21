package ar.edu.manejoProyectos

class Impuesto {
	double porcentaje
	
	new(int porcentajeNeto) {
		this.porcentaje = porcentajeNeto / 100d
	}
	
	def double getCostoImpositivo(double costo) {
		porcentaje * costo
	}
}