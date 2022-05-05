package com.alimento.model.product;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FavoriteService {

	@Autowired
	private FavoriteRepository favoriteRepository;

	public List<Favorite> findAll() {
		return favoriteRepository.findAll();
	}

	public Optional<Favorite> findById(int id) {
		return favoriteRepository.findById(id);
	}

	public Favorite save(Favorite favorite) {
		return favoriteRepository.save(favorite);
	}

	public void deleteById(Integer pid) {
		favoriteRepository.deleteById(pid);
	}

}
