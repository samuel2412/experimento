package br.com.samuel.experimento.models;

import java.math.BigDecimal;
import java.util.List;

public class RelatorioItem {
	private Experimento experimento;
	private TipoCusto tipoCusto;

	public RelatorioItem(Experimento experimento, TipoCusto tipoCusto) {
		super();
		this.experimento = experimento;
		this.tipoCusto = tipoCusto;
	}

	public Experimento getExperimento() {
		return experimento;
	}

	public TipoCusto getTipoCusto() {
		return tipoCusto;
	}

	public void setExperimento(Experimento experimento) {
		this.experimento = experimento;
	}

	public void setTipoCusto(TipoCusto tipoCusto) {
		this.tipoCusto = tipoCusto;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((experimento == null) ? 0 : experimento.hashCode());
		result = prime * result + ((tipoCusto == null) ? 0 : tipoCusto.hashCode());
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
		RelatorioItem other = (RelatorioItem) obj;
		if (experimento == null) {
			if (other.experimento != null)
				return false;
		} else if (!experimento.equals(other.experimento))
			return false;
		if (tipoCusto != other.tipoCusto)
			return false;
		return true;
	}

	

	public BigDecimal getTotal() {
		List<Custo> custos = experimento.getCustos();
		BigDecimal total = BigDecimal.ZERO;
		
		for(Custo c : custos) {
			//System.out.println("relatorioitem  "+c.getValor());
			total = total.add(c.getValor());
		}
		
		return total;
	}

}
