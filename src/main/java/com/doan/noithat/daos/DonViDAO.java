package com.doan.noithat.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.DonVi;

@Repository
public class DonViDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String SQL_FIND_ALL = "SELECT * FROM donvi ORDER BY ID DESC";
	private final String ADD_NHACUNGCAP = "INSERT INTO donvi(TenDonVi,ChucNang) VALUE(?,?)";
	private final String EDIT_NHACUNGCAP = "UPDATE donvi SET TenDonVi = ?,ChucNang = ? WHERE ID = ?";
	private final String FINDONE_NCC = "SELECT * FROM donvi WHERE ID = ? ";
	private final String DEL_NCC = "DELETE FROM donvi WHERE ID = ?";

	public List<DonVi> findAll() {
		return jdbcTemplate.query(SQL_FIND_ALL, new BeanPropertyRowMapper<>(DonVi.class));
	}

	public int add(DonVi donVi) {

		return jdbcTemplate.update(ADD_NHACUNGCAP, new Object[] { donVi.getTenDonVi(), donVi.getChucNang() });
	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_NCC, id);
	}

	public DonVi findOne(int id) {
		// TODO Auto-generated method stub
		return jdbcTemplate.queryForObject(FINDONE_NCC, new BeanPropertyRowMapper<>(DonVi.class), id);
	}

	public int edit(DonVi donVi) {
		return jdbcTemplate.update(EDIT_NHACUNGCAP,
				new Object[] { donVi.getTenDonVi(), donVi.getChucNang(), donVi.getId() });
	}

}
