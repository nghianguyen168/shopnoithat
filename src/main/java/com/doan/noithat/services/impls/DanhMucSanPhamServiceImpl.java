package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.DanhMucSanPhamDAO;
import com.doan.noithat.models.DanhMucSanPham;
import com.doan.noithat.services.DanhMucSanPhamService;

@Service
public class DanhMucSanPhamServiceImpl implements DanhMucSanPhamService {

	@Autowired
	private DanhMucSanPhamDAO danhMucSanPhamDAO;

	@Override
	public List<DanhMucSanPham> findAll() {
		// TODO Auto-generated method stub
		return danhMucSanPhamDAO.findAll();
	}

	@Override
	public int add(DanhMucSanPham danhMucSanPham) {
		return danhMucSanPhamDAO.add(danhMucSanPham);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return danhMucSanPhamDAO.del(id);
	}

	@Override
	public DanhMucSanPham findOne(int id) {
		// TODO Auto-generated method stub
		return danhMucSanPhamDAO.findOne(id);
	}

	@Override
	public int edit(DanhMucSanPham danhMucSanPham) {
		return danhMucSanPhamDAO.edit(danhMucSanPham);
	}
}
