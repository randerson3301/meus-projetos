package br.minhacasa.barueri.dbutils;
/*
 * Esta classe possui o intuito de fazer a conexão com o banco agenda
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

	private static Connection con;

	public static Connection getConnection() {

		try {
			// Tentando chamar o Driver do mariaDB
			Class.forName("org.mariadb.jdbc.Driver");
			String dbURL = "jdbc:mysql://localhost:3306/Agenda?useSSL=false";

			con = DriverManager.getConnection(dbURL, "randerson", "123");
			
			
		} catch (SQLException err) {
			err.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}

}
