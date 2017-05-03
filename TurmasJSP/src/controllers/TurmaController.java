package controllers;

import java.util.ArrayList;
import java.util.List;

import models.*;

public class TurmaController {

	private static List<Turma> turmas = new ArrayList<Turma>();
	
	public static List<Turma> getTurmas() {
		return turmas;
	}
	public static void setTurmas(List<Turma> turmas) {
		TurmaController.turmas = turmas;
	}
	public static Turma criarTurma(){
		Turma turma = new Turma();
		return turma;
	}
	public static boolean verificarNomeTurma(String nome){
		for(Turma turma : turmas){
			if(turma.getNome() != null){
				if((turma.getNome().equals(nome))){
					return true;
				}
			}
		}
		return false;
	}
	public static boolean verificaMatricula(String idTurma, int matricula){
		int id = Integer.parseInt(idTurma);
		for(Aluno aluno : getTurmaById(id).getAlunos()){
			if(aluno.getMatricula() > 0){
				if((aluno.getMatricula() == (matricula))){
					return true;
				}
			}
		}
		return false;
	}
	public static boolean addAluno(Turma turma, Aluno aluno){
		if(turma.getId() > 0){
			turma.getAlunos().add(aluno);
			return true;
		}
		return false;
	}
	public static boolean addTurma(Turma turma){
		if(turma.getId() > 0){
			turmas.add(turma);
			return true;
		}
		return false;
	}
	public static Turma getTurmaById(int id){
		for(Turma turma : turmas){
			if(turma.getId() == id){
				return turma;
			}
		}
		return null;
	}
	public TurmaController() {
		// TODO Auto-generated constructor stub
	}

}
