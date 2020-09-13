package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.CTDonHangDAO;
import com.doan.noithat.models.ChiTietDonHang;
import com.doan.noithat.models.GioHang;
import com.doan.noithat.models.TaiKhoan;
import com.doan.noithat.services.ChiTietDonHangService;

@Service
public class ChiTietDonHangServiceImpl implements ChiTietDonHangService {

	@Autowired
	private CTDonHangDAO ctDonHangDAO;

	@Override
	public ChiTietDonHang findOne(int id) {
		// TODO Auto-generated method stub
		return ctDonHangDAO.findOne(id);
	}

	@Override
	public int add(TaiKhoan taiKhoan, GioHang gioHang, int soluong, int id_donhang, int trang_thai) {
		// TODO Auto-generated method stub
		return ctDonHangDAO.add(taiKhoan, gioHang, soluong, id_donhang, trang_thai);
	}

	@Override
	public List<ChiTietDonHang> findAllByOrder(int id_donhang) {
		// TODO Auto-generated method stub
		return ctDonHangDAO.find_oder_product(id_donhang);
	}


}
