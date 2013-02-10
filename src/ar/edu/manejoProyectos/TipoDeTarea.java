package ar.edu.manejoProyectos;

public interface TipoDeTarea {

	public double getCosto(Tarea tarea);
	public double getCostoTotal(Tarea tarea);
	public void agregarSubtarea(Tarea tarea);
	
}
