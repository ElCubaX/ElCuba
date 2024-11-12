package System;


/**
 * @version 1.0
 * @created 11-nov.-2024 11:08:33 p. m.
 */
public interface ICOCINA {

	/**
	 * 
	 * @param idOrden
	 */
	public void confirmarPreparacion(int idOrden);

	/**
	 * 
	 * @param orden
	 */
	public void recibirOrden(Orden orden);

}