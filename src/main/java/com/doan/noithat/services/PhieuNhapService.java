package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.PhieuNhap;

public interface PhieuNhapService {

	List<PhieuNhap> findAll();

	int add(PhieuNhap phieuNhap);

	int del(int id);

	PhieuNhap findOne(int id);

	int edit(PhieuNhap phieuNhap);

}
