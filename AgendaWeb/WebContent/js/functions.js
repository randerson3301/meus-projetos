//Código em JS para confirmar a exclusão de um contato
function confirmarExcluir() {
	var conf = confirm("Voce deseja excluir o contato?")
	var formulario = document.getElementById("formulario")
	if (conf == true) {
		formulario.action = "ExcluirContato"
	} else {
		alert("Não foi excluído!")
		formulario.action = "index.jsp"
	}
}

//Código em JS para confirmar a atualização de um contato
function confirmarEditar() {
	var conf = confirm("Voce deseja editar o contato?")
	var formulario = document.getElementById("formulario")
	if(conf == true) {
		formulario.action = "EditarContato"
	} else {
		alert("Não foi atualizado!")
		formulario.action = "index.jsp"
	}
}

//função para logout do usuário
function logout() {
	var conf = confirm("Você deseja encerrar a sessão?");
	var link = document
			.getElementById("logout")

	if (conf) {
		link.href = "login.html"
	} else {
	    link.href = "#"
	}
}