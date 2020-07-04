package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.NhaCungCapDAO;
import com.doan.noithat.models.NhaCungCap;
import com.doan.noithat.services.NhaCungCapService;

@Service
public class NhaCungCapServiceImpl implements NhaCungCapService {

	@Autowired
	private NhaCungCapDAO nhaSanXuatDAO;

	@Override
	public List<NhaCungCap> findAll() {
		// TODO Auto-generated method stub
		return nhaSanXuatDAO.findAll();
	}

	@Override
	public int add(NhaCungCap nhaCungCap) {
		return nhaSanXuatDAO.add(nhaCungCap);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return nhaSanXuatDAO.del(id);
	}

	@Override
	public NhaCungCap findOne(int id) {
		// TODO Auto-generated method stub
		return nhaSanXuatDAO.findOne(id);
	}

	@Override
	public int edit(NhaCungCap nhaCungCap) {
		return nhaSanXuatDAO.edit(nhaCungCap);
	}

	@Override
	public List<NhaCungCap> findAll(int offset, int limit) {
		// TODO Auto-generated method stub
		return nhaSanXuatDAO.findAll(offset,limit);
	}

	@Override
	public int totalRow() {
		// TODO Auto-generated method stub
		return nhaSanXuatDAO.totalRow();
	}
}
