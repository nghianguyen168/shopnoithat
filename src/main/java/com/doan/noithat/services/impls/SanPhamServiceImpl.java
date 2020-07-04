package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.SanPhamDAO;
import com.doan.noithat.models.SanPham;
import com.doan.noithat.services.SanPhamService;

@Service
public class SanPhamServiceImpl implements SanPhamService {

	@Autowired
	private SanPhamDAO sanPhamDAO;

	@Override
	public List<SanPham> findAll() {
		// TODO Auto-generated method stub
		return sanPhamDAO.findAll();
	}

	@Override
	public int add(SanPham sanPham) {
		return sanPhamDAO.add(sanPham);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return sanPhamDAO.del(id);
	}

	@Override
	public SanPham findOne(int id) {
		// TODO Auto-generated method stub
		return sanPhamDAO.findOne(id);
	}

	@Override
	public int edit(SanPham sanPham) {
		return sanPhamDAO.edit(sanPham);
	}

	@Override
	public List<SanPham> findAll(int offset, int limit) {
		// TODO Auto-generated method stub
		return sanPhamDAO.findAll(offset, limit);
	}

	@Override
	public int totalRow() {
		// TODO Auto-generated method stub
		return sanPhamDAO.totalRow();
	}

	@Override
	public List<SanPham> findRD() {
		// TODO Auto-generated method stub
		return sanPhamDAO.findRD();
	}
}
