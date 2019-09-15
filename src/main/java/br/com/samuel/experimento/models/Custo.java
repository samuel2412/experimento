package br.com.samuel.experimento.models;

import java.math.BigDecimal;

import javax.persistence.Embeddable;

@Embeddable
public class Custo {

	private BigDecimal valor;
	private TipoCusto tipo;

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		// setValorFantasia(valor.add(new BigDecimal("20.00")));
		this.valor = valor;
	}

	public TipoCusto getTipo() {
		return tipo;
	}

	public void setTipo(TipoCusto tipo) {
		this.tipo = tipo;
	}

}
