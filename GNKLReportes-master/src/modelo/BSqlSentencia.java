package modelo;

import java.sql.*;

public class BSqlSentencia {
	private PreparedStatement pstm;
	private Statement stm;
	private ResultSet rs;
	
	public BSqlSentencia() {
		this.pstm = null;
		this.stm = null;
		this.rs = null;
	}

	public BSqlSentencia(PreparedStatement pstm, Statement stm, ResultSet rs) {
		this.pstm = pstm;
		this.stm = stm;
		this.rs = rs;
	}

	public PreparedStatement getPstm() {
		return pstm;
	}

	public void setPstm(PreparedStatement pstm) {
		this.pstm = pstm;
	}

	public Statement getStm() {
		return stm;
	}

	public void setStm(Statement stm) {
		this.stm = stm;
	}
	
	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}
}

