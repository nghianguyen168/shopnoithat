package com.doan.noithat.services.impls;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.LienHeDAO;
import com.doan.noithat.models.LienHe;
import com.doan.noithat.services.LienHeService;

@Service
public class LienHeServiceImpl implements LienHeService {

	@Autowired
	private LienHeDAO lienHeDAO;

	@Override
	public int add(LienHe lienHe) {
		// TODO Auto-generated method stub
		return lienHeDAO.add(lienHe);
	}


}
