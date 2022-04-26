package com.alimento.controller.product;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alimento.model.product.Product;
import com.alimento.model.product.ProductService;
import com.alimento.model.product.ProductType;
import com.alimento.model.product.ProductTypeService;

@Controller
@RequestMapping(path = "/admin/product")
public class AdminProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductTypeService productTypeService;

	///////////////////////////////////////////////////////////////////////////

	@GetMapping("/productjson")
	@ResponseBody
	public List<Product> findAllProduct() {
		System.out.println("URL : find all product");
		return productService.findAll();
	}

	@GetMapping("/producttypejson")
	@ResponseBody
	public List<ProductType> findAllProductType() {
		System.out.println("URL : find all product type");
		return productTypeService.findAll();
	}

	@GetMapping("/getby{id}")
	@ResponseBody
	public Optional<Product> axiosGetById(@PathParam("id") int id) {
		System.out.println("GET id: " + id);
		return productService.findById(id);
	}
	
	@PostMapping("/save")
	@ResponseBody
	public void save(@RequestBody Product product) {
		System.out.println("do save");
		
		// 判斷是否要新增產品種類
		Set<String> productTypeNameResultSet = new HashSet<>();
		for (ProductType productType : productTypeService.findAll()) {
			productTypeNameResultSet.add(productType.getProducttypename());
		}
		if (productTypeNameResultSet.add(product.getProducttype())) {
			ProductType pt = new ProductType();
			pt.setProducttypename(product.getProducttype());
			productTypeService.save(pt);
		}
		productService.save(product);
	}

	@GetMapping("/delete")
	@ResponseBody
	public ModelAndView deleteById(@RequestParam("systemid") int systemid, @RequestParam("productid") String productid) throws FileNotFoundException {
		System.out.println("do delete By Id");
		productService.deleteById(systemid);
		
		String target = ResourceUtils.getURL("classpath:").getPath()+"static/image/product/";
		File image = new File(target + productid + ".jpg");
		
		image.delete();
		
		return new ModelAndView("redirect:/admin/product/productindex");
	}

	@PostMapping("/uploadimage")
	@ResponseBody
	public void uploadimage(@RequestParam("imageFile") MultipartFile file, @RequestParam("imageName") String imageName) throws FileNotFoundException {
		if(file.getOriginalFilename().length() != 0) {
			System.out.println("do upload image");
			
			// 絕對路徑
//			String target = "C:/DataSource/workspace/SpringBootHW_withTemplates.zip_expanded/SpringBootHW/target/classes/static/image/product/";
			// 相對路徑
			String target = ResourceUtils.getURL("classpath:").getPath()+"static/image/product/";
			
			try {
				file.transferTo(new java.io.File(target + imageName));
				System.out.println("已上傳到: " + target);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@PutMapping("/batch")
	@ResponseBody
	public void batch(
			@RequestParam("newStock") int newStock, 
			@RequestParam("stockEdit") String stockEdit, 
			@RequestParam("newCost") double newCost, 
			@RequestParam("costEdit") String costEdit, 
			@RequestParam("newPrice") double newPrice,
			@RequestParam("priceEdit") String priceEdit, 
			@RequestParam("batchList") List<Integer> batchList			
			) {
		for(int i=0; i<batchList.size(); i++) {
			
			Optional<Product> product = productService.findById(batchList.get(i));
			
			int oldStock = product.get().getProductstock();
			double oldCost = product.get().getProductcost();
			double oldPrice = product.get().getProductprice();

			if (stockEdit.equals("=")) {
				product.get().setProductstock(newStock);
			} else if (stockEdit.equals("+")) {
				product.get().setProductstock(oldStock + newStock);
			} else if (stockEdit.equals("-")) {
				product.get().setProductstock(oldStock - newStock);
			}

			if (costEdit.equals("=")) {
				product.get().setProductcost(newCost);
			} else if (costEdit.equals("+")) {
				product.get().setProductcost(oldCost + (oldCost * (newCost /  100)));
			} else if (costEdit.equals("-")) {
				product.get().setProductcost(oldCost - (oldCost * (newCost /  100)));
			}

			if (priceEdit.equals("=")) {
				product.get().setProductprice(newPrice);
			} else if (priceEdit.equals("+")) {
				product.get().setProductprice(oldPrice + (oldPrice * (newPrice /  100)));
			} else if (priceEdit.equals("-")) {
				product.get().setProductprice(oldPrice - (oldPrice * (newPrice /  100)));
			}

			productService.save(product.get());
		}
	}
	
	
	
	
	///////////////////////////////////////////////////////////////////////////

	@GetMapping("/productindex")
	public String productIndex() {
		System.out.println("index page");
		return "product/index";
	}

	@GetMapping("/insertform")
	public String insertFrom() {
		System.out.println("insert page");
		return "product/insertform";
	}

	@GetMapping("/updateform")
	public String updateForm() {
		System.out.println("update page");
		return "product/updateform";
	}

	@GetMapping("/batchform")
	public String batchFrom() {
		System.out.println("batch page");
		return "product/batchform";
	}

}