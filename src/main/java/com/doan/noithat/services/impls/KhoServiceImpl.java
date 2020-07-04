package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.KhoDAO;
import com.doan.noithat.models.Kho;
import com.doan.noithat.services.KhoService;

@Service
public class KhoServiceImpl implements KhoService {

	@Autowired
	private KhoDAO khoDAO;

	@Override
	public List<Kho> findAll() {
		// TODO Auto-generated method stub
		return khoDAO.findAll();
	}

	@Override
	public int add(Kho kho) {
		return khoDAO.add(kho);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return khoDAO.del(id);
	}

	@Override
	public Kho findOne(int id) {
		// TODO Auto-generated method stub
		return khoDAO.findOne(id);
	}

	@Override
	public int edit(Kho kho) {
		return khoDAO.edit(kho);
	}
}
