package com.alimento.controller.product;


import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		System.out.println("findAllProduct");
		return productService.findAll();
	}

	@GetMapping("/producttypejson")
	@ResponseBody
	public List<ProductType> findAllProductType() {
		System.out.println("findAllProductType");
		return productTypeService.findAll();
	}

	@PostMapping("/save")
	@ResponseBody
	public void save(@RequestBody Product product) {
		System.out.println("save");
		
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
	public ModelAndView deleteById(@RequestParam("systemid") int systemid, @RequestParam("productid") String productid) {
		System.out.println("deleteById");
		productService.deleteById(systemid);
		
		File image = new File("C:/DataSource/workspace/SpringBootHW_withTemplates.zip_expanded/SpringBootHW/target/classes/static/image/product/" + productid + ".jpg");
		image.delete();
		
		return new ModelAndView("redirect:/admin/product/productindex");
	}

	@PostMapping("/uploadimage")
	@ResponseBody
	public void uploadimage(@RequestParam("imageFile") MultipartFile file, @RequestParam("imageName") String imageName) {
		if(file.getOriginalFilename().length() != 0) {
			System.out.println("uploadimage");
//			String location = "C:/DataSource/workspace/SpringBootHW_withTemplates.zip_expanded/SpringBootHW/src/main/resources/static/image/product/";
			String target = "C:/DataSource/workspace/SpringBootHW_withTemplates.zip_expanded/SpringBootHW/target/classes/static/image/product/";
			try {
//				file.transferTo(new java.io.File(location + imageName));
				file.transferTo(new java.io.File(target + imageName));
//				System.out.println("已上傳到: " + location);
				System.out.println("已上傳到: " + target);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@PostMapping("/batch")
	public void batch() {
		System.out.println("/batch");
	}
	
	///////////////////////////////////////////////////////////////////////////

	@GetMapping("/productindex")
	public String productIndex() {
		System.out.println("/productIndex");
		return "product/index";
	}

	@GetMapping("/insertform")
	public String insertFrom() {
		System.out.println("/insertform");
		return "product/insertform";
	}

	@GetMapping("/updateform")
	public String updateForm() {
		System.out.println("/updateform");
		return "product/updateform";
	}

	@GetMapping("/batchform")
	public String batchFrom() {
		System.out.println("/batchfrom");
		return "product/batchform";
	}
	
	///////////////////////////////////////////////////////////////////////////

	// @GetMapping("/getJsonById")
//	@ResponseBody
//	public Optional<Product> getJsonById(@RequestParam("id") int id) {
//		System.out.println("getjsonbyid");
//		System.out.println(id);
//		return productService.findById(id);
//	}

//	@PostMapping("/insert")
//	@ResponseBody
//	public Product insert(@RequestBody Product product) {
//		System.out.println("insert");
//		System.out.println(product);
//		return productService.save(product);
//	}

//	@PostMapping("/update")
//	@ResponseBody
//	public Product update(@RequestBody Product product) {
//		System.out.println("update");
//		System.out.println(product);
//		return productService.save(product);
//	}

	///////////////////////////////////////////////////////////////////////////

//	@GetMapping("/productjson")
//	@ResponseBody
//	public List<Product> productJson() {
//		return productService.selectAll();
//	}

//	@GetMapping("/producttypejson")
//	@ResponseBody
//	public List<ProductType> productTypeJson() {
//		return productTypeService.selectAll();
//	}
//
//	@GetMapping("/productindex")
//	public String productIndex() {
//		return "index";
//	}

//
//	@GetMapping("/delete")
//	public String delete(@RequestParam("Product_ID") int id) {
//		productService.delete(id);
//		return "index";
//	}
//
//	@PostMapping("/a.controller")
//	@ResponseBody
//	public Users processUsersCheckAction(@RequestBody Users users) {
//		System.out.println(users.getUsername());
//		System.out.println(users.getProducttype());
//		return users;
//	}
//
//	@PostMapping("/b.controller")
//	@ResponseBody
//	public Product processUsersCheckAction(@RequestBody Product product) {
//		System.out.println(product.getProductname());
//		return product;
//	}
//	
//	
//	@PostMapping("/upload.controller")
//	@ResponseBody
//	public String uploadImage(@RequestParam("file") MultipartFile imageFile) throws IllegalStateException, IOException {
//		String fileName = imageFile.getOriginalFilename();
//		File saveFileDir = new File("C:/DataSource/workspace/iSpanSpringBoot/src/main/resources/static/images");
//		saveFileDir.mkdir();
//		File saveFilePath = new File(saveFileDir, fileName);
//		imageFile.transferTo(saveFilePath);
//		return "index";
//	}
//
//	@PostMapping("insert")
//	@ResponseBody
//	public ModelAndView doInsert(@RequestBody Product product, @RequestParam("file") MultipartFile imageFile)
//			throws IllegalStateException, IOException {
//
//		// 判斷是否要新增產品種類
////		Set<String> productTypeNameResultSet = new HashSet<>();
////		for (ProductType productType : productTypeService.selectAll()) {
////			productTypeNameResultSet.add(productType.getProductType_Name());
////		}
////		if (productTypeNameResultSet.add(type)) {
////			productTypeService.insert(new ProductType(type));
////		}
//
//		// 新增產品
//		productService.insert(product);
//
//		// 把圖片儲存到資料夾
//		String fileName = imageFile.getOriginalFilename();
//		File saveFileDir = new File("C:/DataSource/workspace/iSpanSpringBoot/src/main/resources/static/images");
//		saveFileDir.mkdir();
//		File saveFilePath = new File(saveFileDir, fileName);
//		imageFile.transferTo(saveFilePath);
//
//		return new ModelAndView("redirect:/admin/product/productindex");
//	}

//	@RequestMapping(path = "insert", method = RequestMethod.POST)
//	public ModelAndView doInsert(@RequestParam("name") String name, @RequestParam("type") String type,
//			@RequestParam("stock") int stock, @RequestParam("cost") double cost, @RequestParam("price") double price,
//			@RequestParam("file") MultipartFile imageFile, HttpServletRequest request)
//			throws IllegalStateException, IOException {
//
//		// 判斷是否要新增產品種類
//		Set<String> productTypeNameResultSet = new HashSet<>();
//		for (ProductType productType : productTypeService.selectAll()) {
//			productTypeNameResultSet.add(productType.getProductType_Name());
//		}
//		if (productTypeNameResultSet.add(type)) {
//			productTypeService.insert(new ProductType(type));
//		}
//
//		// 新增產品
//		Product product = productService.insert(new Product(0, name, type, stock, cost, price, "temp", "temp"));
//
//		// 把圖片儲存到資料夾
//		productService.insertImage(request, product, imageFile);
//
//		return new ModelAndView("redirect:/admin/product/productindex");
//	}

//	@RequestMapping(path = "update", method = RequestMethod.POST)
//	public ModelAndView doUpdate(@RequestParam("id") int id, @RequestParam("name") String name,
//			@RequestParam("type") String type, @RequestParam("stock") int stock, @RequestParam("cost") double cost,
//			@RequestParam("price") double price, @RequestParam("image") MultipartFile imageFile,
//			HttpServletRequest request) throws ServletException, IllegalStateException, IOException {
//		String imageName = id + ".jpg";
//
//		// 更新產品
//		Product product = productService.update(new Product(id, name, type, stock, cost, price, imageName, "temp"));
//
//		// 判斷是否要更新圖片
//		if (imageFile.getOriginalFilename() != "") {
//			productService.insertImage(request, product, imageFile);
//		}
//
//		return new ModelAndView("redirect:/admin/product/productindex");
//	}

//	@RequestMapping(path = "batchform", method = RequestMethod.POST)
//	public ModelAndView batch(@RequestParam("idList") ArrayList<Integer> idList) {
//		for (int id : idList) {
//			productService.delete(id);
//		}
//		return new ModelAndView("redirect:/admin/product/productindex");
////		return "product/bathcform";
//	}

}