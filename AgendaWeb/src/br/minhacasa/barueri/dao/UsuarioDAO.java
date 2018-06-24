package br.minhacasa.barueri.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.minhacasa.barueri.dbutils.Conexao;
import br.minhacasa.barueri.model.Usuario;

public class UsuarioDAO {

	private Usuario user;
	private PreparedStatement stm;
	private ResultSet rs;

	public void setUsuario(Usuario user) {
		this.user = user;
	}

	public Usuario autenticar(String email, String senha) {

		user = null;
		stm = null;
		rs = null;

		String sql = "SELECT * FROM usuarios WHERE email = ? AND senha = ?";

		try {

			stm = Conexao.getConnection().prepareStatement(sql);

			stm.setString(1, email);
			stm.setString(2, senha);

			rs = stm.executeQuery(); // Porque é uma consulta

			if (rs.next()) {
				user = new Usuario();

				user.setId(rs.getInt("id"));
				user.setNome(rs.getString("nome"));
				user.setCidade(rs.getString("cidade"));
				user.setDtNasc(rs.getDate("dtNasc"));
				user.setEmail(rs.getString("email"));
				user.setSenha(rs.getString("senha"));

				Conexao.getConnection().close();

			}
			
			System.out.println("Uhulll");

		} catch (SQLException e) {
			e.printStackTrace();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}
}
