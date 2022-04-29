package com.alimento.controller.product;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@GetMapping("/favorite{pid}")
	@ResponseBody
	public String favproduct(HttpServletRequest request, @PathParam("id") String pid) {
	
		System.out.println(pid);
		
		Object login = request.getSession().getAttribute("login");
		
		if(login==null) {
			return "0";
		}else {
			String memberid=(String)login;
			return "1";
		}
		
		
	}

}