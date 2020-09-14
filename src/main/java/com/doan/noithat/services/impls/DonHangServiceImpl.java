package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.DonHangDAO;
import com.doan.noithat.models.DonHang;
import com.doan.noithat.models.TaiKhoan;
import com.doan.noithat.models.ThongTinDatHang;
import com.doan.noithat.services.DonHangService;

@Service
public class DonHangServiceImpl implements DonHangService {

	@Autowired
	private DonHangDAO donHangDAO;

	@Override
	public List<DonHang> findAll() {
		// TODO Auto-generated method stub
		return donHangDAO.findAll();
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return donHangDAO.del(id);
	}

	@Override
	public DonHang findOne(int id) {
		// TODO Auto-generated method stub
		return donHangDAO.findOne(id);
	}

	@Override
	public int edit(DonHang donHang) {
		return donHangDAO.edit(donHang);
	}

	@Override
	public List<DonHang> findAll(int offset, int limit) {
		// TODO Auto-generated method stub
		return donHangDAO.findAll(offset, limit);
	}

	@Override
	public int totalRow() {
		// TODO Auto-generated method stub
		return donHangDAO.totalRow();
	}

	@Override
	public int add_order(TaiKhoan taiKhoan, ThongTinDatHang thongTinDatHang, int soluong, int hinhthuc_tt,int id_donhang) {
		// TODO Auto-generated method stub
		return donHangDAO.add_order(taiKhoan, thongTinDatHang, soluong, hinhthuc_tt, id_donhang);
	}

	@Override
	public List<DonHang> find_By_User(TaiKhoan taiKhoan) {
		// TODO Auto-generated method stub
		return donHangDAO.don_Hang_User(taiKhoan);
	}

	@Override
	public int check_don_moi() {
		// TODO Auto-generated method stub
		return donHangDAO.check_don_moi();
	}

	@Override
	public int confirm_nhanhang(int id) {
		// TODO Auto-generated method stub
		return donHangDAO.confirm_nhanhang(id);
	}

	@Override
	public int cancel_order(int id) {
		// TODO Auto-generated method stub
		return donHangDAO.cancel_order(id);
	}
}
