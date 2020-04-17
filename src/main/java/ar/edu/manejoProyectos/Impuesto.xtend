package ar.edu.manejoProyectos

class Impuesto {
	double porcentaje
	
	private new(int porcentajeNeto) {
		this.porcentaje = porcentajeNeto / 100d
	}
	
	def double getCostoImpositivo(double costo) {
		porcentaje * costo
	}

	public static Impuesto impuestoA = new Impuesto(3)
	public static Impuesto impuestoB = new Impuesto(5)
}