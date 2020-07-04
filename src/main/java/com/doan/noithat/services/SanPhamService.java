package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.SanPham;

public interface SanPhamService {

	
	List<SanPham> findAll();
	
	List<SanPham> findRD();
	
	int add(SanPham sanPham);
	
	
	int del(int id);
	
	SanPham findOne(int id);

	int edit(SanPham sanPham);
	
	List<SanPham> findAll(int offset, int limit);
	
	int totalRow();

}
