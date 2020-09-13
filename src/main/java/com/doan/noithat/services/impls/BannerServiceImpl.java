package com.doan.noithat.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doan.noithat.daos.BannerDAO;
import com.doan.noithat.models.Banner;
import com.doan.noithat.services.BannerService;

@Service
public class BannerServiceImpl implements BannerService {

	@Autowired
	private BannerDAO bannerDAO;

	@Override
	public int add(Banner banner) {
		// TODO Auto-generated method stub
		return bannerDAO.add(banner);
	}

	@Override
	public int edit(Banner banner) {
		// TODO Auto-generated method stub
		return bannerDAO.edit(banner);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return bannerDAO.del(id);
	}

	@Override
	public List<Banner> findAll() {
		// TODO Auto-generated method stub
		return bannerDAO.findAll();
	}

	@Override
	public Banner findOne(int id) {
		// TODO Auto-generated method stub
		return bannerDAO.findOne(id);
	}

}
