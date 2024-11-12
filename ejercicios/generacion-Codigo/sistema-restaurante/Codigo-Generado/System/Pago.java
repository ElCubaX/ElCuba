package System;


/**
 * @version 1.0
 * @created 11-nov.-2024 11:08:34 p. m.
 */
public class Pago implements ISISTEMADEPAGOS {

	private int idPago;
	private String metodo;
	private double monto;

	public Pago(){

	}

	public void finalize() throws Throwable {

	}

	/**
	 * 
	 * @param Pago
	 */
	public boolean procesarPago(pago Pago){
		return false;
	}

}