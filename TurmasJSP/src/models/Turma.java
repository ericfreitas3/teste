package models;

import java.util.ArrayList;
import java.util.List;

import controllers.TurmaController;

public class Turma {

	private static int sequence = 0;
	private int id;
	private List<Aluno> alunos = new ArrayList<Aluno>();
	private String nome;
	
	public int getId() {
		return id;
	}
	public List<Aluno> getAlunos() {
		return alunos;
	}
	public void setAlunos(List<Aluno> alunos) {
		this.alunos = alunos;
	}	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		if(TurmaController.verificarNomeTurma(nome))
			System.out.println("Nome de turma já em uso");
		else
			this.nome = nome;
	}
	public Turma() {
		this.id += ++Turma.sequence;
	}
	

}
