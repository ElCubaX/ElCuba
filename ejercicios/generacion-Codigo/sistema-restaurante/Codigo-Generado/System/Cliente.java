package System;


/**
 * @version 1.0
 * @created 11-nov.-2024 11:08:33 p. m.
 */
public class Cliente implements ICLIENTE {

	private int idcliente;
	private String nombre;
	public Orden m_Orden;

	public Cliente(){

	}

	public void finalize() throws Throwable {

	}

	/**
	 * 
	 * @param orden
	 */
	public void hacerPedido(Orden orden){

	}

	/**
	 * 
	 * @param pago
	 */
	public void realizarPago(Pago pago){

	}

}