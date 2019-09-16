package br.com.samuel.experimento.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.samuel.experimento.daos.ExperimentoDAO;
import br.com.samuel.experimento.infra.FileSaver;
import br.com.samuel.experimento.models.Experimento;
import br.com.samuel.experimento.models.TipoCusto;
import br.com.samuel.experimento.validation.ExperimentoValidation;

@Controller
@RequestMapping("/ex")
public class ExperimentosController {

	@Autowired
	private ExperimentoDAO experimentoDao;

	@Autowired
	private FileSaver fileSaver;

	@RequestMapping("/registro")
	public ModelAndView form(Experimento experimento) {
		// System.out.println("chegou no /registro");
		ModelAndView modelAndView = new ModelAndView("experimentos/registro");
		modelAndView.addObject("tipos", TipoCusto.values());

		return modelAndView;

	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView salvar(MultipartFile anexo, @Valid Experimento ex, BindingResult result,
			RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			return form(ex);
		}

		//String path = fileSaver.write("arquivos-anexo", anexo);
		//System.out.println(path);
		//ex.setAnexoPath(path);
		experimentoDao.salvar(ex);
		redirectAttributes.addFlashAttribute("sucesso", "Experimento cadastrado com sucesso!");

		return new ModelAndView("redirect:ex");
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listar() {
		List<Experimento> experimentos = experimentoDao.listar();
		
		ModelAndView modelAndView = new ModelAndView("experimentos/lista");
		modelAndView.addObject("experimentos", experimentos);
		modelAndView.addObject("tipos", TipoCusto.values());
		return modelAndView;
	}

	@RequestMapping("/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id")Integer id) {
		ModelAndView modelAndView = new ModelAndView("experimentos/detalhe");
		Experimento experimento = experimentoDao.find(id);
		modelAndView.addObject("experimento", experimento);

		return modelAndView;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new ExperimentoValidation());
	}

}
