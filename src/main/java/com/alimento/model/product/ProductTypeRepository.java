package com.alimento.model.product;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

@Transactional
public interface ProductTypeRepository extends JpaRepository<ProductType, Integer> {


}
