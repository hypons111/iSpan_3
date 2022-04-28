package com.alimento.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/home")
public class ProductController {

	@GetMapping("/shop")
	public String shop() {
		return "home_user/shop";
	}
	
	@GetMapping("/product")
	public String product() {
		return "home_user/product";
	}

}