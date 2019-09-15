package br.com.samuel.experimento.models;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
@Scope(value=WebApplicationContext.SCOPE_SESSION, 
proxyMode=ScopedProxyMode.TARGET_CLASS)
public class Relatorio implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<RelatorioItem, Integer> itens = new LinkedHashMap<>();

	public void add(RelatorioItem item) {
		itens.put(item, getQuantidade(item));
	}

	public Integer getQuantidade(RelatorioItem item) {
		if (!itens.containsKey(item)) {
			itens.put(item, 1);
		}
		return itens.get(item);
	}

	public int getQuantidade() {
		System.out.println(itens.values().stream().reduce(0, (proximo, acumulador) -> proximo + acumulador));

		return itens.values().stream().reduce(0, (proximo, acumulador) -> proximo + acumulador);
	}

	public Collection<RelatorioItem> getItens() {
		return itens.keySet();
	}

	public BigDecimal getTotal(RelatorioItem item) {
		return item.getTotal();
	}

	public BigDecimal getTotal() {
		BigDecimal total = BigDecimal.ZERO;

		for (RelatorioItem item : itens.keySet()) {
			total = total.add(getTotal(item));
		}

		return total;
	}
	
	public void remover(Integer experimentoId, TipoCusto tipoCusto) {
	    Experimento experimento = new Experimento();
	    experimento.setId(experimentoId);
	    itens.remove(new RelatorioItem(experimento,tipoCusto));
	}

}
