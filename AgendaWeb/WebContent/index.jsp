

<!--Diretiva -->
<%@page import="br.minhacasa.barueri.dao.ContatoDAO"%>
<%@page import="br.minhacasa.barueri.model.Contato"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="br.minhacasa.barueri.model.Usuario"%>


<%
	SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

	ArrayList<Contato> listContatos = new ArrayList<>();

	Usuario u = new Usuario();

	u = (Usuario) session.getAttribute("usuario");

	if (u == null) {
		response.sendRedirect("login.html");

	} else {
		ContatoDAO dao = new ContatoDAO();
		listContatos = dao.getContatos(u.getId());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resposta da Servlet</title>
<link href="css/bootstrap.css" rel="stylesheet">

</head>
<body>
	<!--  Cabeçalho da página -->
	<header>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-4">
					<h1>
						<img alt="Contatos" src="imgs/contacts.png" height="37px"
							width="37px">UaiContatos
					</h1>
				</div>
			</div>
		</div>

	</header>

	<!-- CONTENT -->

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<strong>Usuário</strong>
					</div>
					<div class="panel-body">
						<p>
							<strong> Usuário: </strong><%=u.getNome()%>
						<p>
							<strong> Cidade: </strong><%=u.getCidade()%>
						<p>
							<strong> Dt.Nasc: </strong><%=df.format(u.getDtNasc())%>
						<p>
							<img alt="Logout" src="imgs/logout.png" height="16px"
								width="16px"> <a href="sair.jsp"> Logout </a>
						</p>
					</div>
				</div>

				<div class="panel panel-info">
					<div class="panel-heading">
						<strong style="margin-left: 10px"> <img
							src="imgs/menuIcon.png" height="24px" width="24px
						">
							Menu
						</strong>
					</div>
					<div class="panel-body">
						<ul class="nav">
							<li class="nav-item"><a href="index.jsp">Home</a></li>
							<li class="nav-item"><a href="cadastrarContato.jsp">Novo
									Contato</a></li>

						</ul>
					</div>
				</div>
			</div>

			<div class="col-md-9">
				<div class="panel panel-info">
					<div class="panel-heading">
						<strong> Meus Contatos </strong>
					</div>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>ID</th>
									<th>Nome</th>
									<th>E-mail</th>
									<th></th>
									<th></th>
								</tr>
							</thead>

							<%
								for (Contato contato : listContatos) {
							%>
							<tr>
								<td><%=contato.getId()%></td>
								<td><%=contato.getNome()%></td>
								<td><%=contato.getEmail()%></td>


								<!-- Botões -->

								<td><a href="editarContato.jsp?id=<%=contato.getId()%>">
										<img alt="Edit User" src="imgs/edit-user.png" height="24px"
										width="24px">
								</a></td>
								<td><a href="excluirContato.jsp?id=<%=contato.getId()%>">
								<img alt="Delete User" src="imgs/del-user.png"
									height="24px" width="24px"></a></td>
							</tr>
							<%
								}
							%>


						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="container"
			style="background-color: #000000; color: white;">
			<div class="container-fluid">
				<div class="navbar-header">
					<p>&copy; RandSoft - 2018</p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>

<%
	}
%>