package com.doan.noithat.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.Kho;

@Repository
public class KhoDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String SQL_FIND_ALL = "SELECT * FROM kho ORDER BY ID DESC";
	private final String ADD_NHACUNGCAP = "INSERT INTO kho(TenKho,DiaChi) VALUE(?,?)";
	private final String EDIT_NHACUNGCAP = "UPDATE kho SET Tenkho = ?,DiaChi = ? WHERE ID = ?";
	private final String FINDONE_NCC = "SELECT * FROM kho WHERE ID = ? ";
	private final String DEL_NCC = "DELETE FROM kho WHERE ID= ?";

	public List<Kho> findAll() {
		return jdbcTemplate.query(SQL_FIND_ALL, new BeanPropertyRowMapper<>(Kho.class));
	}

	public int add(Kho kho) {

		return jdbcTemplate.update(ADD_NHACUNGCAP,
				new Object[] { kho.getTenKho(), kho.getDiaChi() });
	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_NCC, id);
	}

	public Kho findOne(int id) {
		// TODO Auto-generated method stub
		return jdbcTemplate.queryForObject(FINDONE_NCC, new BeanPropertyRowMapper<>(Kho.class), id);
	}

	public int edit(Kho kho) {
		return jdbcTemplate.update(EDIT_NHACUNGCAP, new Object[] { kho.getTenKho(), kho.getDiaChi(),
				 kho.getId() });
	}

}
