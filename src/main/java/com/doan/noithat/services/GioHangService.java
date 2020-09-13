package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.GioHang;
import com.doan.noithat.models.Kho;

public interface GioHangService {

	int add_to_cart(GioHang gioHang);
	int add_to_cart_exist(int id_sanPham,int soluong);
	GioHang checkExist(int id_sanPham);
	List<GioHang> findAll(int id_NguoiDung);
	int del_Item(int id_item);
	int update_quanlity(int id_sanPham,int soluong);
	int update_when_order(int id_sanPham,int id_DonHang);
}
