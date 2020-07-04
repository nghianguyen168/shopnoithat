package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.KhachHang;

public interface KhachHangService {

	
	List<KhachHang> findAll();
	
	int add(KhachHang khachHang);
	
	
	int del(int id);
	
	KhachHang findOne(int id);

	int edit(KhachHang khachHang);

}
