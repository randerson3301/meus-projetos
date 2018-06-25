

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

	Contato cont = new Contato();

	Usuario u = new Usuario();

	u = (Usuario) session.getAttribute("usuario");

	if (u == null) {
		response.sendRedirect("login.html");

	} else {
		ContatoDAO dao = new ContatoDAO();
		cont = dao.getContato(Integer.parseInt(request.getParameter("id")));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
						<strong> Editar Contato </strong>
					</div>
					<div class="panel-body">
						<!-- Formulário -->
						<form action="ExcluirContato">
							<!-- LINHA 1 -->
							<fieldset>
								<legend> Dados Gerais:</legend>

								<div class="form-row">
									<!-- Primeira Parte -->
									<div class="form-group col-md-6">
										<input type="hidden" name="txtIdUsuario"
											value="<%=u.getId()%>"> 
										<input type="hidden" name="txtId"
											value="<%=cont.getId()%>"> 
											<label for="txtNome">Nome: </label> 
											<input type="text" name="txtNome" 
											class="form-control" value = "<%= cont.getNome()%>">
									</div>

									<div class="form-group col-md-3">
										<label for="txtDtNasc"> Dt Nasc: </label> <input type="date"
											name="txtDtNasc" class="form-control" value = "<%= cont.getDtNasc()%>">
									</div>

									<div class="form-group col-md-3">
										<label for="cbSexo"> Sexo: </label> <select name="cbSexo"
											class="form-control">
											<option value="S" <%= cont.getSexo().equals("S")?"selected":""%>>Selecione</option>
											<option value="F" <%= cont.getSexo().equals("F")?"selected":""%>>Feminino</option>
											<option value="M" <%= cont.getSexo().equals("M")?"selected":""%>>Masculino</option>
										</select>
									</div>
								</div>
							</fieldset>

							<!-- LINHA 2 -->
							<fieldset>
								<legend> Dados de Contato:</legend>

								<div class="form-row">
									<!-- Primeira Parte -->
									<div class="form-group col-md-6">
										<label for="txtEmail"> E-mail: </label> <input type="text"
											name="txtEmail" class="form-control" value = "<%= cont.getEmail()%>">
									</div>

									<div class="form-group col-md-3">
										<label for="txtTelefone"> Telefone: </label> <input
											type="text" name="txtTelefone" class="form-control" value = "<%= cont.getTelefone()%>">
									</div>

									<div class="form-group col-md-3">
										<label for="txtCelular"> Celular: </label> <input type="text"
											name="txtCelular" class="form-control" value = "<%= cont.getCelular()%>">
									</div>
								</div>
					</div>
					</fieldset>

					<!-- LINHA 3 -->
					<fieldset>
						<legend> Dados de Endereço:</legend>

						<div class="form-row">
							<!-- Primeira Parte -->
							<div class="form-group col-md-8">
								<label for="txtLogradouro"> Logradouro: </label> <input
									type="text" name="txtLogradouro" class="form-control" value = "<%= cont.getLogradouro()%>">
							</div>

							<div class="form-group col-md-4">
								<label for="txtBairro"> Bairro: </label> <input type="text"
									name="txtBairro" class="form-control" value = "<%= cont.getBairro()%>">
							</div>

							<div class="form-group col-md-6">
								<label for="txtCidade"> Cidade: </label> <input type="text"
									name="txtCidade" class="form-control" value = "<%= cont.getCidade()%>">
							</div>

							<div class="form-group col-md-3">
								<label for="txtEstado"> Estado: </label> <select name="cbEstado"
									class="form-control">
									<option value="AC" <%= cont.getEstado().equals("AC")?"selected":""%>>Acre</option>
									<option value="AL" <%= cont.getEstado().equals("AL")?"selected":""%>>Alagoas</option>
									<option value="AM" <%= cont.getEstado().equals("AM")?"selected":""%>>Amazonas</option>

									<option value="BA" <%= cont.getEstado().equals("BA")?"selected":""%>>Bahia</option>
									<option value="CE" <%= cont.getEstado().equals("CE")?"selected":""%>>Ceará</option>
									<option value="DF" <%= cont.getEstado().equals("DF")?"selected":""%>>Distrito Federal</option>
									<option value="ES" <%= cont.getEstado().equals("ES")?"selected":""%>>Espírito Santo</option>
									<option value="GO" <%= cont.getEstado().equals("GO")?"selected":""%>>Goiás</option>
									<option value="MA" <%= cont.getEstado().equals("MA")?"selected":""%>>Maranhão</option>
									<option value="MT" <%= cont.getEstado().equals("MT")?"selected":""%>>Mato Grosso</option>
									<option value="MS" <%= cont.getEstado().equals("MS")?"selected":""%>>Mato Grosso do Sul</option>
									<option value="MG" <%= cont.getEstado().equals("MG")?"selected":""%>>Minas Gerais</option>
									<option value="PA" <%= cont.getEstado().equals("PA")?"selected":""%>>Pará</option>
									<option value="PB" <%= cont.getEstado().equals("PB")?"selected":""%>>Paraíba</option>
									<option value="PR" <%= cont.getEstado().equals("PR")?"selected":""%>>Paraná</option>

									<option value="PE" <%= cont.getEstado().equals("PE")?"selected":""%>>Pernambuco</option>
									<option value="PI" <%= cont.getEstado().equals("PI")?"selected":""%>>Piauí</option>
									<option value="RJ" <%= cont.getEstado().equals("RJ")?"selected":""%>>Rio de Janeiro</option>
									<option value="RN" <%= cont.getEstado().equals("RN")?"selected":""%>>Rio Grande do Norte</option>
									<option value="RS" <%= cont.getEstado().equals("RS")?"selected":""%>>Rio Grande do Sul</option>
									<option value="RO" <%= cont.getEstado().equals("RO")?"selected":""%>>Rondônia</option>
									<option value="RR" <%= cont.getEstado().equals("RR")?"selected":""%>>Roraima</option>
									<option value="SC" <%= cont.getEstado().equals("SC")?"selected":""%>>Santa Catarina</option>
									<option value="SP" <%= cont.getEstado().equals("SP")?"selected":""%>>São Paulo</option>
									<option value="SE" <%= cont.getEstado().equals("SE")?"selected":""%>>Sergipe</option>
									<option value="TO" <%= cont.getEstado().equals("TO")?"selected":""%>>Tocantins</option>
								</select>
							</div>

							<div class="form-group col-md-3">
								<label for="txtCep"> CEP: </label> <input type="text"
									name="txtCep" class="form-control" value = "<%= cont.getCep()%>">
							</div>



						</div>
				</div>
				</fieldset>



				<hr>
				<div class="form-row">
					<div class="col-md-12">
						<input type="submit" value="Excluir" class="btn btn-danger" />

						 <a href="login.html" class="btn btn-warning"> Cancelar </a>
					</div>


				</div>

				</form>
			</div>
		</div>
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