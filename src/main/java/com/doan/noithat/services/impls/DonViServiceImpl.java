package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.DonViDAO;
import com.doan.noithat.models.DonVi;
import com.doan.noithat.services.DonViService;

@Service
public class DonViServiceImpl implements DonViService {

	@Autowired
	private DonViDAO donViDAO;

	@Override
	public List<DonVi> findAll() {
		// TODO Auto-generated method stub
		return donViDAO.findAll();
	}

	@Override
	public int add(DonVi donVi) {
		return donViDAO.add(donVi);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return donViDAO.del(id);
	}

	@Override
	public DonVi findOne(int id) {
		// TODO Auto-generated method stub
		return donViDAO.findOne(id);
	}

	@Override
	public int edit(DonVi donVi) {
		return donViDAO.edit(donVi);
	}
}
