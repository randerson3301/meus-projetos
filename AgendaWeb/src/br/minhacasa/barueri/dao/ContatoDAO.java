package br.minhacasa.barueri.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import br.minhacasa.barueri.dbutils.Conexao;
import br.minhacasa.barueri.model.Contato;

public class ContatoDAO {

	private PreparedStatement stm;
	private ResultSet rs;

	private Contato cont;

	public void setContato(Contato cont) {
		this.cont = cont;
	}

	public ArrayList<Contato> getContatos(int idUsuario) {
		ArrayList<Contato> contatos = new ArrayList<>();

		String sql = "SELECT * FROM contatos " + "WHERE idUsuario = ?";

		stm = null;
		rs = null;

		try {

			stm = Conexao.getConnection().prepareStatement(sql);

			stm.setInt(1, idUsuario);

			rs = stm.executeQuery();

			while (rs.next()) {
				cont = new Contato();
				cont.setId(rs.getInt("id"));
				cont.setNome(rs.getString("nome"));
				cont.setDtNasc(rs.getString("dtNasc"));
				cont.setEmail(rs.getString("email"));
				cont.setLogradouro(rs.getString("logradouro"));
				cont.setBairro(rs.getString("bairro"));
				cont.setCidade(rs.getString("cidade"));
				cont.setEstado(rs.getString("estado"));
				cont.setCep(rs.getString("cep"));
				cont.setCelular(rs.getString("celular"));
				cont.setTelefone(rs.getString("telefone"));
				cont.setSexo(rs.getString("sexo"));
				cont.setIdUsuario(rs.getInt("idUsuario"));
				contatos.add(cont);

				System.out.println("agr foi");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return contatos;
	}
	
	public boolean gravarContato() {
		boolean status = true;
		
		String sql = "INSERT INTO contatos(nome, dtNasc, email, logradouro, "
				+ "bairro, cidade, estado, cep, celular, telefone, "
				+ "sexo, idUsuario)"
				+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
				try {
				
					stm = Conexao.getConnection().prepareStatement(sql);
					
					stm.setString(1, cont.getNome());
					stm.setString(2, cont.getDtNasc());
					stm.setString(3, cont.getEmail());
					stm.setString(4, cont.getLogradouro());
					stm.setString(5, cont.getBairro());
					stm.setString(6, cont.getCidade());
					stm.setString(7, cont.getEstado());
					stm.setString(8, cont.getCep());
					stm.setString(9, cont.getCelular());
					stm.setString(10, cont.getTelefone());
					stm.setString(11, cont.getSexo());
					stm.setInt(12, cont.getIdUsuario());
					
					stm.execute();
					
					Conexao.getConnection().close();

				}catch (Exception e) {
					status = false;
					
					e.printStackTrace();
				}
		
		return status;
	}
}
