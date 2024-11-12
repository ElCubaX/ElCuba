package System;


/**
 * @version 1.0
 * @created 11-nov.-2024 11:08:33 p. m.
 */
public interface ICLIENTE {

	/**
	 * 
	 * @param orden
	 */
	public void hacerPedido(Orden orden);

	/**
	 * 
	 * @param pago
	 */
	public void realizarPago(Pago pago);

}