package com.doan.noithat.services.impls;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.CTDonHangDAO;
import com.doan.noithat.models.ChiTietDonHang;
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


}
