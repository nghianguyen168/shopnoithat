package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.KhuyenMai;

public interface KhuyenMaiService {

	List<KhuyenMai> findAll();

	int add(KhuyenMai khuyenMai);

	int del(int id);

	KhuyenMai findOne(int id);

	int edit(KhuyenMai khuyenMai);

}
