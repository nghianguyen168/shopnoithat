package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.DotKhuyenMaiDAO;
import com.doan.noithat.models.DotKhuyenMai;
import com.doan.noithat.services.DotKhuyenMaiService;

@Service
public class DotKhuyenMaiServiceImpl implements DotKhuyenMaiService {

	@Autowired
	private DotKhuyenMaiDAO dotKhuyenMaiDAO;

	@Override
	public List<DotKhuyenMai> findAll() {
		return dotKhuyenMaiDAO.findAll();
	}

	@Override
	public int add(DotKhuyenMai dotKhuyenMai) {
		return dotKhuyenMaiDAO.add(dotKhuyenMai);
	}

	@Override
	public int del(int id) {
		return dotKhuyenMaiDAO.del(id);
	}

	@Override
	public DotKhuyenMai findOne(int id) {
		return dotKhuyenMaiDAO.findOne(id);
	}

	@Override
	public int edit(DotKhuyenMai dotKhuyenMai) {
		return dotKhuyenMaiDAO.edit(dotKhuyenMai);
	}

}
