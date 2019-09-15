package br.com.samuel.experimento.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.samuel.experimento.daos.ExperimentoDAO;
import br.com.samuel.experimento.models.Experimento;
import br.com.samuel.experimento.models.Relatorio;
import br.com.samuel.experimento.models.RelatorioItem;
import br.com.samuel.experimento.models.TipoCusto;

@Controller
@RequestMapping("/relatorio")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class RelatorioController {
	@Autowired
	private ExperimentoDAO experimentoDao;

	@Autowired
	private Relatorio relatorio;
	

	@RequestMapping("/add")
	public ModelAndView add(Integer experimentoId, TipoCusto tipoCusto) {
		//System.out.println("/add	"+experimentoId);
		
		ModelAndView modelAndView = new ModelAndView("redirect:/relatorio");
		RelatorioItem relatorioItem = criaItem(experimentoId, tipoCusto);

		relatorio.add(relatorioItem);

		return modelAndView;
	}

	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView itens(){
		ModelAndView modelAndView = new ModelAndView("/relatorio/itens");
		modelAndView.addObject("tipos", TipoCusto.values());
		
	    return modelAndView;
	}
	
	
	private RelatorioItem criaItem(Integer experimentoId, TipoCusto tipoCusto) {

		Experimento experimento = experimentoDao.find(experimentoId);
		RelatorioItem relatorioItem = new RelatorioItem(experimento, tipoCusto);

		return relatorioItem;
	}
	
	@RequestMapping("/remover")
	public ModelAndView remover(Integer produtoId, TipoCusto tipoCusto) {
	    relatorio.remover(produtoId, tipoCusto);
	    return new ModelAndView("redirect:/relatorio");
	}
	


}
