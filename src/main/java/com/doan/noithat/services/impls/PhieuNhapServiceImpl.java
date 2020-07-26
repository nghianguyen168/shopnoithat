package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.PhieuNhapDAO;
import com.doan.noithat.models.PhieuNhap;
import com.doan.noithat.services.PhieuNhapService;

@Service
public class PhieuNhapServiceImpl implements PhieuNhapService {

	@Autowired
	private PhieuNhapDAO phieuNhapDAO;

	@Override
	public List<PhieuNhap> findAll() {
		// TODO Auto-generated method stub
		return phieuNhapDAO.findAll();
	}

	@Override
	public int add(PhieuNhap phieuNhap) {
		return phieuNhapDAO.add(phieuNhap);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return phieuNhapDAO.del(id);
	}

	@Override
	public PhieuNhap findOne(int id) {
		// TODO Auto-generated method stub
		return phieuNhapDAO.findOne(id);
	}

	@Override
	public int edit(PhieuNhap phieuNhap) {
		return phieuNhapDAO.edit(phieuNhap);
	}
}
