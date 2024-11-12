package System;


/**
 * @version 1.0
 * @created 11-nov.-2024 9:14:21 p. m.
 */
public interface IAdministrador {

	/**
	 * 
	 * @param alerta
	 */
	public emitirAlerta(Alerta alerta);

	/**
	 * 
	 * @param credenciales
	 */
	public gestionarCredenciales(Credenciales credenciales);

}