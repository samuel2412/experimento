package br.com.samuel.experimento.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.samuel.experimento.models.Experimento;

@Repository
@Transactional
public class ExperimentoDAO {

	@PersistenceContext
	private EntityManager manager;

	public void salvar(Experimento experimento) {
		manager.persist(experimento);
	}

	public List<Experimento> listar() {
		return manager.createQuery("select e from Experimento e", Experimento.class).getResultList();
	}

	public Experimento find(Integer id) {
		
		return manager.createQuery("select distinct(e) from Experimento e " + 
		        "join fetch e.custos custos where e.id = :id", Experimento.class)
		            .setParameter("id", id).getSingleResult();
	}
}
