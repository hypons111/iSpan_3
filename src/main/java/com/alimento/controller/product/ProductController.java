package com.alimento.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alimento.model.product.Favorite;
import com.alimento.model.product.FavoriteService;
import com.alimento.model.product.Product;
import com.alimento.model.product.ProductService;

@Controller
@RequestMapping(path = "/home")
public class ProductController {

	@Autowired
	private FavoriteService favoriteService;
	
	@GetMapping("/shop")
	public String shop() {
		return "home_user/shop";
	}
	
	@GetMapping("/product")
	public String product() {
		return "home_user/product";
	}

	@GetMapping("/shop/all")
	public String showAll() {
		return "home_user/shopAll";
	}
	
	

	///////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/favorite")
	public String favorite() {
		return "home_user/favorite";
	}
	
	@GetMapping("/favoritejson")
	@ResponseBody
	public List<Favorite> findAllProduct() {
		return favoriteService.findAll();
	}
	
	///////////////////////////////////////////////////////////////////////////////
	
	@PostMapping("/favorite")
	@ResponseBody
	public String favproduct(HttpServletRequest request, @RequestParam("productid") String productid) {
	
		Object login = request.getSession().getAttribute("login");
		
		System.out.println(productid);
		System.out.println((String)login);
		
		login = 1001;
	
		if(login == null) {
			return "0";
		} else {
			Favorite favorite = new Favorite((int)login, productid);
			favoriteService.save(favorite);
			return productid;
		}
	}

}