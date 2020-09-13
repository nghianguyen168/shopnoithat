package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.ChiTietDonHang;
import com.doan.noithat.models.GioHang;
import com.doan.noithat.models.TaiKhoan;

public interface ChiTietDonHangService {
	
	ChiTietDonHang findOne(int id);
	int add(TaiKhoan taiKhoan,GioHang gioHang,int soluong,int id_donhang,int trang_thai);
	List<ChiTietDonHang> findAllByOrder(int id_donhang);
	

}
