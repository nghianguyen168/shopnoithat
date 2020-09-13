package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.Banner;


public interface BannerService {
	public int add(Banner banner);
	public int edit(Banner banner);
	public int del(int id);
	public List<Banner> findAll();
	public Banner findOne(int id);
}
