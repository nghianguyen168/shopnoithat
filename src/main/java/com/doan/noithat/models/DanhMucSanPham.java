package com.doan.noithat.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DanhMucSanPham {
	
	private int id;
	private String tenDanhMuc;
	private String chuThich;
	
	public DanhMucSanPham(int id, String tenDanhMuc) {
		super();
		this.id = id;
		this.tenDanhMuc = tenDanhMuc;
	}
	
	
	
}
