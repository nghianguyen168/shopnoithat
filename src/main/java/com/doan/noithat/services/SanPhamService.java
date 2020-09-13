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
	
	List<SanPham> findNew();
	
	List<SanPham> findDiscount();
	
	List<SanPham> find_by_cat(int offset, int limit,int catId);
	List<SanPham> find_by_cat_All(int catId);
	
	int update_quanlity(int id_sanPham,int soluong_dat);
	
}

