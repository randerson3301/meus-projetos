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


@WebServlet("/GravarContato")
public class GravarContato extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GravarContato() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Gravando contato");
		
		Contato cont = new Contato();
		cont.setNome(request.getParameter("txtNome"));
		cont.setEmail(request.getParameter("txtEmail"));
		cont.setBairro(request.getParameter("txtBairro"));
		cont.setCelular(request.getParameter("txtCelular"));
		cont.setCep(request.getParameter("txtCep"));
		cont.setCidade(request.getParameter("txtCidade"));
		cont.setDtNasc(request.getParameter("txtDtNasc"));
		cont.setEstado(request.getParameter("cbEstado"));
		cont.setIdUsuario(Integer.parseInt(request.getParameter("txtIdUsuario")));
		cont.setTelefone(request.getParameter("txtTelefone"));
		cont.setLogradouro(request.getParameter("txtLogradouro"));
		cont.setSexo(request.getParameter("cbSexo"));
		
		ContatoDAO dao = new ContatoDAO();
		
		dao.setContato(cont);
		
		RequestDispatcher rd;
		
		if(dao.gravarContato()) {
			rd = request.getRequestDispatcher("index.jsp");
		} else {
			rd = request.getRequestDispatcher("cadastrarContato.jsp");
		}
		
		rd.forward(request, response);

	}

}
