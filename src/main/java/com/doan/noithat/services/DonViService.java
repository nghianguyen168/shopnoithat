package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.DonVi;

public interface DonViService {

	List<DonVi> findAll();

	int add(DonVi donVi);

	int del(int id);

	DonVi findOne(int id);

	int edit(DonVi donVi);

}
