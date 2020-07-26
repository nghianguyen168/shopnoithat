package com.doan.noithat.services.impls;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.CTPhieuNhapDAO;
import com.doan.noithat.models.ChiTietPhieuNhap;
import com.doan.noithat.services.ChiTietPhieuNhapService;

@Service
public class ChiTietPhieuNhapServiceImpl implements ChiTietPhieuNhapService {

	@Autowired
	private CTPhieuNhapDAO ctPhieuNhapDAO;

	@Override
	public ChiTietPhieuNhap findOne(int id) {
		// TODO Auto-generated method stub
		return ctPhieuNhapDAO.findOne(id);
	}

}
