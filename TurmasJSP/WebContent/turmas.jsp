<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controllers.TurmaController" %>
<%@ page import="models.*" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Turmas</title>
</head>
<style type="text/css">
	input{
		margin:5px;
		width:150px;
	}
	input.nome{
		margin-left:28px;
		width:140px;
	}
	input.button{
		width:80px;
		margin-left:0px
	}
	table, th, td {
   		border: 1px solid e3e3e3;
    	border-collapse: collapse;
	}
	th{
		background-color:#f1f1dc;
	}
	td.idValue{
		background-color:#d1d1d1;
		text-align:right;
	}
	.nome{
 		width: 500px;
 		margin: auto; 
	}
	.id{
		width: 40px;
 		margin: auto; 
	}
</style>
<body>
<%
String nome = request.getParameter("nome");
if(nome != null){
	nome.trim();
	Turma turma = TurmaController.criarTurma();
	turma.setNome(nome);
	if(turma.getNome() != null)
		TurmaController.addTurma(turma);
}%>

<h2>Turmas</h2>
<form action="turmas.jsp" method="post">
	Nome: <input class="nome" type="text" id="nome" name="nome" maxlength="20" required></input></br>
	<input class="button" type="submit" value="Criar"></input>
</form>
<table>
	<tr>
		<th class="id">ID</th>
		<th class="nome">Nome</th>
	</tr>
	<%if(!(TurmaController.getTurmas().isEmpty())){
		for(Turma turma : TurmaController.getTurmas()){ %>
		<tr>
			<td class="idValue"><%= turma.getId()%></td>
			<td class="nomeValue"><a href="alunos.jsp?id=<%= turma.getId() %>"> <%= turma.getNome()%> </a></td>
		</tr>
		<%} 
	}%>
</table>
</body>
</html>