package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.DonHang;
import com.doan.noithat.models.TaiKhoan;
import com.doan.noithat.models.ThongTinDatHang;

public interface DonHangService {

	List<DonHang> findAll();

	List<DonHang> findAll(int offset, int limit);

	int del(int id);

	DonHang findOne(int id);

	int edit(DonHang donHang);

	int totalRow();
	
	int add_order(TaiKhoan taiKhoan,ThongTinDatHang thongTinDatHang,int soluong,int hinhthuc_tt,int id_donhang);
	
	List<DonHang> find_By_User(TaiKhoan taiKhoan);
	
	int check_don_moi();
	int confirm_nhanhang(int id);
	int cancel_order(int id);
}
