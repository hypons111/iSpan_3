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
@Table(name = "favorite")
@Component
public class Favorite implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "SYSTEMID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int systemid;

	@Column(name = "MEMBERID")
	private int memberid;
	
	@Column(name = "PRODUCTID")
	private String productid;

	public Favorite() {}

	
	public Favorite(int memberid, String productid) {
		super();
		this.memberid = memberid;
		this.productid = productid;
	}



	public int getSystemid() {
		return systemid;
	}

	public void setSystemid(int systemid) {
		this.systemid = systemid;
	}

	public int getMemberid() {
		return memberid;
	}

	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}
}
