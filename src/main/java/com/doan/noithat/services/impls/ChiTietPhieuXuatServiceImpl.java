package com.doan.noithat.services.impls;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.CTPhieuXuatDAO;
import com.doan.noithat.models.ChiTietPhieuXuat;
import com.doan.noithat.services.ChiTietPhieuXuatService;

@Service
public class ChiTietPhieuXuatServiceImpl implements ChiTietPhieuXuatService {

	@Autowired
	private CTPhieuXuatDAO ctPhieuXuatDAO;

	@Override
	public ChiTietPhieuXuat findOne(int id) {
		// TODO Auto-generated method stub
		return ctPhieuXuatDAO.findOne(id);
	}

}
