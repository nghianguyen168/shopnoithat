package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.NhaCungCap;

public interface NhaCungCapService {

	
	List<NhaCungCap> findAll();
	
	int add(NhaCungCap nhaCungCap);
	
	
	int del(int id);
	
	NhaCungCap findOne(int id);

	int edit(NhaCungCap nhaCungCap);
	
	List<NhaCungCap> findAll(int offset, int limit);
	
	int totalRow(); 

}
