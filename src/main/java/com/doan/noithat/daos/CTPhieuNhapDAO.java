package com.doan.noithat.daos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.ChiTietPhieuNhap;

@Repository
public class CTPhieuNhapDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate ;

	private final String FINDONE_PN = "SELECT * FROM chitietphieunhap WHERE ID = ? ";

	public ChiTietPhieuNhap findOne(int id) {
		return jdbcTemplate.queryForObject(FINDONE_PN, new BeanPropertyRowMapper<>(ChiTietPhieuNhap.class), id);
	}

}
