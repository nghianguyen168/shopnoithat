package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.TaiKhoanDAO;
import com.doan.noithat.models.TaiKhoan;
import com.doan.noithat.services.TaiKhoanService;

@Service
public class TaiKhoanServiceImpl implements TaiKhoanService {

	@Autowired
	private TaiKhoanDAO taiKhoanDAO;

	@Override
	public List<TaiKhoan> findAll() {
		// TODO Auto-generated method stub
		return taiKhoanDAO.findAll();
	}

	@Override
	public int add(TaiKhoan taiKhoan) {
		return taiKhoanDAO.add(taiKhoan);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return taiKhoanDAO.del(id);
	}

	@Override
	public TaiKhoan findOne(int id) {
		// TODO Auto-generated method stub
		return taiKhoanDAO.findOne(id);
	}

	@Override
	public int edit(TaiKhoan taiKhoan) {
		return taiKhoanDAO.edit(taiKhoan);
	}

	@Override
	public TaiKhoan findByUsername(String username) {
		// TODO Auto-generated method stub
		return taiKhoanDAO.findByUsername(username);
	}

	@Override
	public int add_user(TaiKhoan taiKhoan) {
		// TODO Auto-generated method stub
		return taiKhoanDAO.add_user(taiKhoan);
	}
}
