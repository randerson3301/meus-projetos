package br.minhacasa.barueri.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.minhacasa.barueri.dao.ContatoDAO;
import br.minhacasa.barueri.model.Contato;

@WebServlet("/ExcluirContato")
public class ExcluirContato extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ExcluirContato() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Excluindo contato");

		Contato cont = new Contato();
		cont.setId(Integer.parseInt(request.getParameter("txtId")));

		ContatoDAO dao = new ContatoDAO();

		dao.setContato(cont);

		RequestDispatcher rd;

		if (dao.excluirContato()) {
			rd = request.getRequestDispatcher("index.jsp");
		} else {
			rd = request.getRequestDispatcher("excluirContato.jsp");
		}

		rd.forward(request, response);

	}
}
