package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.DotKhuyenMai;

public interface DotKhuyenMaiService {

	List<DotKhuyenMai> findAll();

	int add(DotKhuyenMai dotKhuyenMai);

	int del(int id);

	DotKhuyenMai findOne(int id);

	int edit(DotKhuyenMai dotKhuyenMai);

}
