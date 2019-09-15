package br.com.samuel.experimento.validation;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.samuel.experimento.models.Custo;
import br.com.samuel.experimento.models.Experimento;

public class ExperimentoValidation implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Experimento.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "nome", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "descricao", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "dataInicio", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "dataInicio", "typeMismatch");

		Experimento experimento = (Experimento) target;

		if (experimento.getDuracao() <= 0) {
			errors.rejectValue("duracao", "field.required");
		}
		
	}

}
