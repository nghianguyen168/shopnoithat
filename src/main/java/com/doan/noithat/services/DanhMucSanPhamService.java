package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.DanhMucSanPham;

public interface DanhMucSanPhamService {

	
	List<DanhMucSanPham> findAll();
	
	int add(DanhMucSanPham danhMucSanPham);
	
	
	int del(int id);
	
	DanhMucSanPham findOne(int id);

	int edit(DanhMucSanPham danhMucSanPham);

}
