package br.minhacasa.barueri.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import br.minhacasa.barueri.dao.UsuarioDAO;
import br.minhacasa.barueri.model.Usuario;

@WebServlet("/Autentica")
public class Autentica extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Autentica() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UsuarioDAO dao = new UsuarioDAO();

		Usuario u = new Usuario();

		String email = request.getParameter("txtEmail");

		String senha = request.getParameter("txtSenha");

		HttpSession session = null;

		u = dao.autenticar(email, senha);

		if (u == null) {
			RequestDispatcher rd = request.getRequestDispatcher("login.html");
			rd.forward(request, response);

		} else {
			session = request.getSession();
			
			session.setAttribute("usuario", u);
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			
			rd.forward(request, response);

		}

	}

}
