package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.DonHang;

public interface DonHangService {

	List<DonHang> findAll();

	List<DonHang> findAll(int offset, int limit);

	int del(int id);

	DonHang findOne(int id);

	int edit(DonHang donHang);

	int totalRow();
}
