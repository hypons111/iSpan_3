package com.alimento.controller.product;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@GetMapping("/shop/all")
	public String showAll() {
		return "home_user/shopAll";
	}
	
	@PostMapping("/favorite")
	@ResponseBody
	public String favproduct(HttpServletRequest request, @RequestParam("productid") String productid) {
	
		System.out.println(productid);
		
		Object login = request.getSession().getAttribute("login");
		
		if(login==null) {
			return "0";
		}else {
			String memberid=(String)login;
			return "1";
		}
	}

}