package com.alimento.model.product;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

@Transactional
public interface FavoriteRepository extends JpaRepository<Favorite, Integer> {

	
}