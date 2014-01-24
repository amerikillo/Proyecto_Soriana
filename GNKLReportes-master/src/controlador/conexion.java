package controlador;
import java.sql.*;

import modelo.Berror;

public class conexion {

	private Connection con;
	private String db;
	private String login;
	private String pass;
	private String url;
	//private String port;
	//public conexion(Connection con, String db, String login, String pass, String url) {
	public conexion() {
		this.con = null;
		this.db = "soriana4";
		//this.db = "gnklogistica";
		this.login = "root";
		//this.login = "consultor.extern";
		this.pass = "root";
		//this.pass = "WPNede3bv97uP3u9";
		this.url = "jdbc:mysql://localhost:3306/" + db;
	}

	public Connection getCon() {
		return con;
	}

	public void setCon(Connection con) {
		this.con = con;
	}
	
	public void cerrar(){
		try{
			if(!this.con.isClosed())
				this.con.close();
		}catch(Exception e){
			System.out.println(e);
		}
	}
	
	public void conectar(Berror error){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			setCon(DriverManager.getConnection(this.url, this.login, this.pass));
		}catch(Exception e){
			System.out.println(e);
			error.setError(error.getError() + " Error en la conexion" + " " + e);
		}
	}
	
	public void conectar(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			setCon(DriverManager.getConnection(this.url, this.login, this.pass));
		}catch(Exception e){
			System.out.println(e);
		}
	}
	
}
