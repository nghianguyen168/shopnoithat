package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.NhanVien;

public interface NhanVienService {

	List<NhanVien> findAll();

	int add(NhanVien nhanVien);

	int del(int id);

	NhanVien findOne(int id);

	int edit(NhanVien nhanVien);

}
