package com.doan.noithat.services;

import java.util.List;

import com.doan.noithat.models.Kho;

public interface KhoService {

	List<Kho> findAll();

	int add(Kho kho);

	int del(int id);

	Kho findOne(int id);

	int edit(Kho kho);

}
