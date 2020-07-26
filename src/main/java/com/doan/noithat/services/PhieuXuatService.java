package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.PhieuXuat;

public interface PhieuXuatService {

	List<PhieuXuat> findAll();

	int add(PhieuXuat phieuXuat);

	int del(int id);

	PhieuXuat findOne(int id);

	int edit(PhieuXuat phieuXuat);

}
