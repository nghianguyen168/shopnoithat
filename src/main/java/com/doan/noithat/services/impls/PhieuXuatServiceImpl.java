package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.PhieuXuatDAO;
import com.doan.noithat.models.PhieuXuat;
import com.doan.noithat.services.PhieuXuatService;

@Service
public class PhieuXuatServiceImpl implements PhieuXuatService {

	@Autowired
	private PhieuXuatDAO phieuXuatDAO;

	@Override
	public List<PhieuXuat> findAll() {
		// TODO Auto-generated method stub
		return phieuXuatDAO.findAll();
	}

	@Override
	public int add(PhieuXuat phieuXuat) {
		return phieuXuatDAO.add(phieuXuat);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return phieuXuatDAO.del(id);
	}

	@Override
	public PhieuXuat findOne(int id) {
		// TODO Auto-generated method stub
		return phieuXuatDAO.findOne(id);
	}

	@Override
	public int edit(PhieuXuat phieuXuat) {
		return phieuXuatDAO.edit(phieuXuat);
	}
}
