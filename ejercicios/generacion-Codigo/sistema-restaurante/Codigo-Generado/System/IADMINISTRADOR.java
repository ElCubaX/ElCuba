package System;


/**
 * @version 1.0
 * @created 11-nov.-2024 11:08:33 p. m.
 */
public interface IADMINISTRADOR {

	/**
	 * 
	 * @param Ingrediente
	 * @param cantidad
	 */
	public void actualizarInventario(ingrediente Ingrediente, int cantidad);

	/**
	 * 
	 * @param nombreIngrediente
	 */
	public int consultarInventario(String nombreIngrediente);

	public void generarInformeDiario();

}