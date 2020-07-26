package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.HinhThucThanhToan;

public interface HinhThucThanhToanService {

	List<HinhThucThanhToan> findAll();

	int add(HinhThucThanhToan hinhThucThanhToan);

	int del(int id);

	HinhThucThanhToan findOne(int id);

	int edit(HinhThucThanhToan hinhThucThanhToan);

}
