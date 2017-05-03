<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controllers.TurmaController" %>
<%@ page import="models.*" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alunos</title>
</head>
<style>
	input{
		margin:5px;
		width:150px;
	}
	table, th, td, caption {
   		border: 1px solid e3e3e3;
    	border-collapse: collapse;
	}
	th, caption{
		background-color:#f1f1dc;
	}
	td.matriculaValue{
		background-color:#d1d1d1;
		text-align:right;
	}
	input.name{
 		margin-left:28px; 
	}
	input.button{
		width:80px;
		margin-left:0px
	}
	.nome{
 		width: 500px;
 		margin: auto; 
	}
	.matricula{
		width: 80px;
 		margin: auto; 
	}
</style>
<body>
<% String idTurma = request.getParameter("id");
Turma turma = TurmaController.getTurmaById(Integer.parseInt(idTurma)); %>
<h2> <%= turma.getNome() %> </h2>
<%
String nome = request.getParameter("nome");

if(nome != null){
	nome.trim();
	int matricula = Integer.parseInt(request.getParameter("matricula").trim());
	Aluno aluno = new Aluno();
	aluno.setNome(nome);
	aluno.setMatricula(matricula, idTurma);
	if(aluno.getMatricula() > 0)
		TurmaController.addAluno(turma,aluno);
}%>

<a href="turmas.jsp">Voltar</a></br>
<form action="#" method="post">
	Nome: <input class="name" type="text" id="nome" name="nome" required></input></br>
	Matrícula: <input type="text" id="matricula" name="matricula" required></input></br>
	<input class="button" type="submit" value="Criar"></input>
</form>
<table>
	<caption>Alunos</caption>
	<tr>
		<th class="matricula">Matrícula</th>
		<th class="nome">Nome</th>
	</tr>
	<%if(!(turma.getAlunos().isEmpty())){ %>
		<% for(Aluno aluno : turma.getAlunos()){ %>
			<tr>
				<td class="matriculaValue"><%= aluno.getMatricula() %></td>
				<td class="nomeValue"><%= aluno.getNome() %></td>
			</tr>
		<%}
	}%>
</table>
</body>
</html>