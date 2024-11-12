package System;


/**
 * @version 1.0
 * @created 11-nov.-2024 11:08:33 p. m.
 */
public interface IMESERO {

	public void generarInforme();

	/**
	 * 
	 * @param Pago
	 */
	public double procesarPago(pago Pago);

	/**
	 * 
	 * @param Orden
	 */
	public void tomarOrden(orden Orden);

}