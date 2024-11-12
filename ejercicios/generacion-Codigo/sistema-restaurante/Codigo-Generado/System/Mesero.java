package System;


/**
 * @version 1.0
 * @created 11-nov.-2024 11:08:34 p. m.
 */
public class Mesero implements IMESERO {

	private int idMesero;
	private String nombre;
	public Orden m_Orden;

	public Mesero(){

	}

	public void finalize() throws Throwable {

	}

	public void generarInforme(){

	}

	/**
	 * 
	 * @param Pago
	 */
	public double procesarPago(pago Pago){
		return 0;
	}

	/**
	 * 
	 * @param Orden
	 */
	public void tomarOrden(orden Orden){

	}

}