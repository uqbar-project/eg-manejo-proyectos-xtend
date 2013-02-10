package ar.edu.manejoProyectos

@Data class Impuesto {
	double porcentaje;
	
	def double getCostoImpositivo(double costo) {
		porcentaje * costo / 100
	}
}