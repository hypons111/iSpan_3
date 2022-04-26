package com.alimento.model.product;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "product")
@Component
public class Product implements Serializable {

	private static long serialVersionUID = 1L;

	@Id
	@Column(name = "SYSTEMID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int systemid;
	
	@Column(name = "PRODUCTID")
	private String productid;

	@Column(name = "PRODUCTTYPE")
	private String producttype;

	@Column(name = "PRODUCTNAME")
	private String productname;

	@Column(name = "PRODUCTSTOCK")
	private int productstock;

	@Column(name = "PRODUCTCOST")
	private double productcost;

	@Column(name = "PRODUCTPRICE")
	private double productprice;
	
	@Column(name = "PRODUCTIMAGE")
	private String productimage;

	@Column(name = "PRODUCTDESCRIPTION")
	private String productdescription;
	
	@Column(name = "PRODUCTSTATE")
	private boolean productstate;



	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public static void setSerialversionuid(long serialversionuid) {
		serialVersionUID = serialversionuid;
	}

	public int getSystemid() {
		return systemid;
	}

	public void setSystemid(int systemid) {
		this.systemid = systemid;
	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public String getProducttype() {
		return producttype;
	}

	public void setProducttype(String producttype) {
		this.producttype = producttype;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getProductstock() {
		return productstock;
	}

	public void setProductstock(int productstock) {
		this.productstock = productstock;
	}

	public double getProductcost() {
		return productcost;
	}

	public void setProductcost(double productcost) {
		this.productcost = productcost;
	}

	public double getProductprice() {
		return productprice;
	}

	public void setProductprice(double productprice) {
		this.productprice = productprice;
	}

	public String getProductimage() {
		return productimage;
	}

	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}

	public String getProductdescription() {
		return productdescription;
	}

	public void setProductdescription(String productdescription) {
		this.productdescription = productdescription;
	}

	public boolean isProductstate() {
		return productstate;
	}

	public void setProductstate(boolean productstate) {
		this.productstate = productstate;
	}



}
