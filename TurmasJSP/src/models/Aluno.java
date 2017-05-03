package models;

import controllers.TurmaController;

public class Aluno {

	private int matricula;
	private String nome;
	
	public int getMatricula() {
		return matricula;
	}

	public void setMatricula(int matricula, String idTurma) {
		if(TurmaController.verificaMatricula(idTurma, matricula))
			System.out.println("Matricula em uso");
		else
			this.matricula = matricula;
		
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Aluno() {
		// TODO Auto-generated constructor stub
	}

}
