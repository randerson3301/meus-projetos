package br.minhacasa.barueri.servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.minhacasa.barueri.dao.UsuarioDAO;
import br.minhacasa.barueri.model.Usuario;

@WebServlet("/GravarUsuario")
public class GravarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GravarUsuario() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Usuario u = new Usuario();

		SimpleDateFormat toDataBase = new SimpleDateFormat("yyyy-MM-dd");

		Date dt = null;

		u.setNome(request.getParameter("txtNome"));
		u.setEmail(request.getParameter("txtEmail"));
		u.setCidade(request.getParameter("txtCidade"));
		u.setSenha(request.getParameter("txtSenha"));

		if (u.getDtNasc() != null) {
			dt = Date.valueOf(request.getParameter("txtDtNasc"));
			u.setDtNasc(dt);
		} else {
			u.setDtNasc(null);
		}
		UsuarioDAO dao = new UsuarioDAO();

		dao.setUsuario(u);

		RequestDispatcher rd;

		if (dao.gravar()) {
			rd = request.getRequestDispatcher("login.html");
		} else {
			rd = request.getRequestDispatcher("cadastro.html?erro=1");
		}

		rd.forward(request, response);
	}

}
