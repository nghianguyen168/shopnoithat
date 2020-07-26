package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.KhachHangDAO;
import com.doan.noithat.models.KhachHang;
import com.doan.noithat.services.KhachHangService;

@Service
public class KhachHangServiceImpl implements KhachHangService {

	@Autowired
	private KhachHangDAO khachHangDAO;

	@Override
	public List<KhachHang> findAll() {
		// TODO Auto-generated method stub
		return khachHangDAO.findAll();
	}

	@Override
	public int add(KhachHang khachHang) {
		return khachHangDAO.add(khachHang);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return khachHangDAO.del(id);
	}

	@Override
	public KhachHang findOne(int id) {
		// TODO Auto-generated method stub
		return khachHangDAO.findOne(id);
	}

	@Override
	public int edit(KhachHang khachHang) {
		return khachHangDAO.edit(khachHang);
	}

	@Override
	public KhachHang login(String username, String password) {
		// TODO Auto-generated method stub
		return khachHangDAO.login(username, password);
	}
}
