package com.alimento.model.product;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "producttype")
public class ProductType implements Serializable {

	private static final long serialVersionUID = 1L;

	// 駝峰式 productType_Name 會自動變 product_type_Name 我屌佢老母
	// 所以屬性要全細階 或者用 (name = "producttype_Name")

	@Id
	@Column(name = "PRODUCTTYPEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int producttypeid;

	@Column(name = "PRODUCTTYPENAME")
	private String producttypename;

	
//	
//	public ProductType(String producttypename) {
//		super();
//		this.producttypename = producttypename;
//	}

	public int getProducttypeid() {
		return producttypeid;
	}

	public void setProducttypeid(int producttypeid) {
		this.producttypeid = producttypeid;
	}

	public String getProducttypename() {
		return producttypename;
	}

	public void setProducttypename(String producttypename) {
		this.producttypename = producttypename;
	}

	@Override
	public String toString() {
		return "ProductType [producttypeid=" + producttypeid + ", producttypename=" + producttypename + "]";
	}

}
