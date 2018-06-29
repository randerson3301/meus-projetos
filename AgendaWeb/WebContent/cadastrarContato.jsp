

<!--Diretiva -->
<%@page import="br.minhacasa.barueri.dao.ContatoDAO"%>
<%@page import="br.minhacasa.barueri.model.Contato"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Resposta da Servlet</title>
<link href="css/bootstrap.css" rel="stylesheet">

</head>
<body>
	<script type="text/javascript" src="js/functions.js"></script>
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
							<strong> Dt.Nasc: </strong><%=u.getDtNasc() != null ? df.format(u.getDtNasc()) : "Não Informado"%>
						<p>
							<img alt="Logout" src="imgs/logout.png" height="16px"
								width="16px"> <a onclick="logout()" id="logout">
								Logout </a>
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
						<strong> Cadastrar Contato </strong>
					</div>
					<div class="panel-body">
						<!-- Formulário -->
						<form action="GravarContato">
							<!-- LINHA 1 -->
							<fieldset>
								<legend> Dados Gerais:</legend>

								<div class="form-row">
									<!-- Primeira Parte -->
									<div class="form-group col-md-6">
										<input type="hidden" name="txtIdUsuario"
											value="<%=u.getId()%>"> <label for="txtNome">
											Nome: </label> <input type="text" name="txtNome" class="form-control" required="required">
									</div>

									<div class="form-group col-md-3">
										<label for="txtDtNasc"> Dt Nasc: </label> <input type="date"
											name="txtDtNasc" class="form-control" required="required">
									</div>

									<div class="form-group col-md-3">
										<label for="cbSexo"> Sexo: </label> <select name="cbSexo"
											class="form-control">
											<option value="S">Selecione</option>
											<option value="F">Feminino</option>
											<option value="M">Masculino</option>
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
											name="txtEmail" class="form-control" required="required">
									</div>

									<div class="form-group col-md-3">
										<label for="txtTelefone"> Telefone: </label> <input
											type="text" name="txtTelefone" class="form-control">
									</div>

									<div class="form-group col-md-3">
										<label for="txtCelular"> Celular: </label> <input type="text"
											name="txtCelular" class="form-control">
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
									type="text" name="txtLogradouro" class="form-control">
							</div>

							<div class="form-group col-md-4">
								<label for="txtBairro"> Bairro: </label> <input type="text"
									name="txtBairro" class="form-control">
							</div>

							<div class="form-group col-md-6">
								<label for="txtCidade"> Cidade: </label> <input type="text"
									name="txtCidade" class="form-control">
							</div>

							<div class="form-group col-md-3">
								<label for="txtEstado"> Estado: </label> <select name="cbEstado"
									class="form-control">
									<option value="AC">Acre</option>
									<option value="AL">Alagoas</option>
									<option value="AM">Amazonas</option>

									<option value="BA">Bahia</option>
									<option value="CE">Ceará</option>
									<option value="DF">Distrito Federal</option>
									<option value="ES">Espírito Santo</option>
									<option value="GO">Goiás</option>
									<option value="MA">Maranhão</option>
									<option value="MT">Mato Grosso</option>
									<option value="MS">Mato Grosso do Sul</option>
									<option value="MG">Minas Gerais</option>
									<option value="PA">Pará</option>
									<option value="PB">Paraíba</option>
									<option value="PR">Paraná</option>

									<option value="PE">Pernambuco</option>
									<option value="PI">Piauí</option>
									<option value="RJ">Rio de Janeiro</option>
									<option value="RN">Rio Grande do Norte</option>
									<option value="RS">Rio Grande do Sul</option>
									<option value="RO">Rondônia</option>
									<option value="RR">Roraima</option>
									<option value="SC">Santa Catarina</option>
									<option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
								</select>
							</div>

							<div class="form-group col-md-3">
								<label for="txtCep"> CEP: </label> <input type="text"
									name="txtCep" class="form-control">
							</div>



						</div>
				</div>
				</fieldset>



				<hr>
				<div class="form-row">
					<div class="col-md-12">
						<input type="submit" value="Cadastrar" class="btn btn-success" />

						<a href="index.jsp" class="btn btn-danger"> Cancelar </a>
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