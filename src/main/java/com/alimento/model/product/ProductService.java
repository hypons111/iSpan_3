package com.alimento.model.product;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	public List<Product> findAll() {
		return productRepository.findAll();
	}

	public Optional<Product> findById(int id) {
		return productRepository.findById(id);
	}

	public Product save(Product product) {
		return productRepository.save(product);
	}

	public void deleteById(Integer pid) {
		productRepository.deleteById(pid);
	}
	
	
	//////////////////////////////////////////////////////////////////////////////////
	
	
//	public List<Product> selectAll() {
//		return productRepository.selectAll();
//	}
//
//	public Product insert(Product product) {
//		return productRepository.save(product);
//	}
//
//	public void delete(int id) {
//		productRepository.delete(id);
//	}

//	public String uploadImage(MultipartFile imageFile) throws IllegalStateException, IOException {
//		String fileName = imageFile.getOriginalFilename();
//		File saveFileDir = new File("C:/Users/Student/Desktop/uploada");
//		saveFileDir.mkdir();
//		File saveFilePath = new File(saveFileDir, fileName);
//		imageFile.transferTo(saveFilePath);
//		return "Success";
//	}

//	public Product selectByID(int id) {
//		System.out.println("ProductService : selectByID");
//		return productDao.selectByID(id);
//	}
//
//	public Product insert(Product product) {
//		return productDao.insert(product);
//	}
//
//	public Product update(Product product) {
//		return productDao.update(product);
//	}
////	public Product update(int id, String name, String type, int stock, double cost, double price, String image) {
////		System.out.println("ProductService: " + "update: ");
////		return productDao.update(id, name, type, stock, cost, price, image);
////	}
//

//
//	public void insertImage(HttpServletRequest request, Product product, MultipartFile imageFile)
//			throws IllegalStateException, IOException {
//		productDao.insertImage(request, product, imageFile);
//
//	}
}
