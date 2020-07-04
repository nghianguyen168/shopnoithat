package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.NhanVienDAO;
import com.doan.noithat.models.NhanVien;
import com.doan.noithat.services.NhanVienService;

@Service
public class NhanVienServiceImpl implements NhanVienService {

	@Autowired
	private NhanVienDAO nhanVienDAO;

	@Override
	public List<NhanVien> findAll() {
		// TODO Auto-generated method stub
		return nhanVienDAO.findAll();
	}

	@Override
	public int add(NhanVien nhanVien) {
		return nhanVienDAO.add(nhanVien);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return nhanVienDAO.del(id);
	}

	@Override
	public NhanVien findOne(int id) {
		// TODO Auto-generated method stub
		return nhanVienDAO.findOne(id);
	}

	@Override
	public int edit(NhanVien nhanVien) {
		return nhanVienDAO.edit(nhanVien);
	}
}
