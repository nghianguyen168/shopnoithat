package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.KhuyenMaiDAO;
import com.doan.noithat.models.KhuyenMai;
import com.doan.noithat.services.KhuyenMaiService;

@Service
public class KhuyenMaiServiceImpl implements KhuyenMaiService{
	
	@Autowired
	private KhuyenMaiDAO khuyenMaiDAO;

	@Override
	public List<KhuyenMai> findAll() {
		// TODO Auto-generated method stub
		return khuyenMaiDAO.findAll();
	}

	@Override
	public int add(KhuyenMai khuyenMai) {
		return khuyenMaiDAO.add(khuyenMai);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return khuyenMaiDAO.del(id);
	}

	@Override
	public KhuyenMai findOne(int id) {
		// TODO Auto-generated method stub
		return khuyenMaiDAO.findOne(id);
	}

	@Override
	public int edit(KhuyenMai khuyenMai) {
		// TODO Auto-generated method stub
		return khuyenMaiDAO.edit(khuyenMai);
	}
	

}
