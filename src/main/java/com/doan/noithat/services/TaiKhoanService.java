package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.TaiKhoan;

public interface TaiKhoanService {

	
	List<TaiKhoan> findAll();
	
	int add(TaiKhoan taiKhoan);
	
	
	int del(int id);
	
	TaiKhoan findOne(int id);

	int edit(TaiKhoan taiKhoan);

}
