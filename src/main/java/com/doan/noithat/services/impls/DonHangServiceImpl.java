package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.DonHangDAO;
import com.doan.noithat.models.DonHang;
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
}
