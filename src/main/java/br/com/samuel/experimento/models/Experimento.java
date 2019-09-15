package br.com.samuel.experimento.models;

import java.util.Calendar;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Experimento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@DateTimeFormat
	private Calendar dataInicio;
	
	@ElementCollection
	private List<Custo> custos;
	

	private String nome;
	private String descricao;
	private int duracao;
	private String anexoPath;
	
	

	public List<Custo> getCustos() {
		return custos;
	}

	public void setCustos(List<Custo> custos) {
		this.custos = custos;
	}

	public String getAnexoPath() {
		return anexoPath;
	}

	public void setAnexoPath(String anexoPath) {
		this.anexoPath = anexoPath;
	}

	public Calendar getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Calendar dataInicio) {
		this.dataInicio = dataInicio;
	}

	public String getNome() {
		return nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public int getDuracao() {
		return duracao;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setDuracao(int duracao) {
		this.duracao = duracao;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Experimento [id=" + id + ", nome=" + nome + ", descricao=" + descricao + ", duracao=" + duracao + "]";
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
        int result = 1;
        result = prime * result + id;
        return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		 if (this == obj)
	            return true;
	        if (obj == null)
	            return false;
	        if (getClass() != obj.getClass())
	            return false;
	        Experimento other = (Experimento) obj;
	        if (id != other.id)
	            return false;
	        return true;
	}
	
	
}
