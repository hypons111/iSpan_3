package com.alimento.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductTypeService {

	@Autowired
	private ProductTypeRepository productTypeRepository;

	public List<ProductType> findAll() {
		return productTypeRepository.findAll();
	}

	public ProductType save(ProductType productType) {
		return productTypeRepository.save(productType);
	}
	
}
