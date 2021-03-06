package br.com.samuel.experimento.controllers;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.samuel.experimento.models.DadosPagamento;
import br.com.samuel.experimento.models.Relatorio;

@RequestMapping("/financiar")
@Controller
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class FinanciarController {

    @Autowired    
    private Relatorio relatorio;
    
    @Autowired
    private RestTemplate restTemplate;

	@RequestMapping(value="/finalizar", method=RequestMethod.POST)
    public Callable<ModelAndView> finalizar(RedirectAttributes model){
        return () -> {
            String uri = "http://book-payment.herokuapp.com/payment";

            try {
                String response = restTemplate.postForObject(uri, 
                    new DadosPagamento(relatorio.getTotal()), String.class);
                model.addFlashAttribute("sucesso", response);
                System.out.println(response);
                return new ModelAndView("redirect:/ex");
            } catch (HttpClientErrorException e) {
                e.printStackTrace();
                model.addFlashAttribute("falha"
                		+ "", "Valor maior que o permitido");
                return new ModelAndView("redirect:/ex");
            }
        };
	}
}