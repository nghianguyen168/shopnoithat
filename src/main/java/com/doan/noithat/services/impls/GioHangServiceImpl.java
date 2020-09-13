package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.GioHangDAO;
import com.doan.noithat.daos.KhoDAO;
import com.doan.noithat.models.GioHang;
import com.doan.noithat.models.Kho;
import com.doan.noithat.services.GioHangService;
import com.doan.noithat.services.KhoService;

@Service
public class GioHangServiceImpl implements GioHangService {

	@Autowired
	private GioHangDAO gioHangDAO;

	@Override
	public int add_to_cart(GioHang gioHang) {
		// TODO Auto-generated method stub
		return gioHangDAO.add_to_cart(gioHang);
	}

	@Override
	public int add_to_cart_exist(int id_sanPham, int soluong) {
		// TODO Auto-generated method stub
		return gioHangDAO.add_to_cart_exist(id_sanPham, soluong);
	}

	@Override
	public GioHang checkExist(int id_sanPham) {
		// TODO Auto-generated method stub
		return gioHangDAO.check_exist(id_sanPham);
	}

	@Override
	public List<GioHang> findAll(int id_NguoiDung) {
		// TODO Auto-generated method stub
		return gioHangDAO.find_add(id_NguoiDung);
	}

	@Override
	public int del_Item(int id_item) {
		// TODO Auto-generated method stub
		return gioHangDAO.del_item(id_item);
	}

	@Override
	public int update_quanlity(int id_sanPham, int soluong) {
		// TODO Auto-generated method stub
		return gioHangDAO.update_quanlity(id_sanPham, soluong);
	}

	@Override
	public int update_when_order(int id_sanPham, int id_DonHang) {
		// TODO Auto-generated method stub
		return gioHangDAO.update_when_order(id_sanPham, id_DonHang);
	}

	


	
}
