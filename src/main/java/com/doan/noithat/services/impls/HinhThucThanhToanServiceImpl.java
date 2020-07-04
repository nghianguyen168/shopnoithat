package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.HinhThucThanhToanDAO;
import com.doan.noithat.models.HinhThucThanhToan;
import com.doan.noithat.services.HinhThucThanhToanService;

@Service
public class HinhThucThanhToanServiceImpl implements HinhThucThanhToanService {

	@Autowired
	private HinhThucThanhToanDAO hinhThucThanhToanDAO;

	@Override
	public List<HinhThucThanhToan> findAll() {
		// TODO Auto-generated method stub
		return hinhThucThanhToanDAO.findAll();
	}

	@Override
	public int add(HinhThucThanhToan hinhThucThanhToan) {
		return hinhThucThanhToanDAO.add(hinhThucThanhToan);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return hinhThucThanhToanDAO.del(id);
	}

	@Override
	public HinhThucThanhToan findOne(int id) {
		// TODO Auto-generated method stub
		return hinhThucThanhToanDAO.findOne(id);
	}

	@Override
	public int edit(HinhThucThanhToan hinhThucThanhToan) {
		return hinhThucThanhToanDAO.edit(hinhThucThanhToan);
	}
}
