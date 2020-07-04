package com.doan.noithat.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.NhaCungCap;

@Repository
public class NhaCungCapDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String SQL_FIND_ALL = "SELECT * FROM nhacungcap ORDER BY ID DESC";
	private static final String FIND_ALL_PAGINATE = "SELECT * FROM nhacungcap ORDER BY ID DESC LIMIT ? , ?";
	private static final String TOTAL_ROW = "SELECT COUNT(*) AS totalRow FROM nhacungcap ";
	private static final String ADD_NHACUNGCAP = "INSERT INTO nhacungcap(TenNCC,DiaChiNCC,SDTNCC) VALUE(?,?,?)";
	private static final String EDIT_NHACUNGCAP = "UPDATE nhacungcap SET TenNCC = ?,DiaChiNCC = ?,SDTNCC = ? WHERE ID = ?";
	private static final String FINDONE_NCC = "SELECT * FROM nhacungcap WHERE ID = ? ";
	private static final String DEL_NCC = "DELETE FROM nhacungcap WHERE ID= ?";

	public List<NhaCungCap> findAll() {
		return jdbcTemplate.query(SQL_FIND_ALL, new BeanPropertyRowMapper<>(NhaCungCap.class));
	}

	public List<NhaCungCap> findAll(int offset, int limit) {
		return jdbcTemplate.query(FIND_ALL_PAGINATE, new BeanPropertyRowMapper<>(NhaCungCap.class),
				new Object[] { offset, limit });
	}

	public int totalRow() {
		return jdbcTemplate.queryForObject(TOTAL_ROW, Integer.class);
	}

	public int add(NhaCungCap nhaCungCap) {

		return jdbcTemplate.update(ADD_NHACUNGCAP,
				new Object[] { nhaCungCap.getTenNCC(), nhaCungCap.getDiaChiNCC(), nhaCungCap.getSdtNCC() });
	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_NCC, id);
	}

	public NhaCungCap findOne(int id) {
		// TODO Auto-generated method stub
		return jdbcTemplate.queryForObject(FINDONE_NCC, new BeanPropertyRowMapper<>(NhaCungCap.class), id);
	}

	public int edit(NhaCungCap nhaCungCap) {
		return jdbcTemplate.update(EDIT_NHACUNGCAP, new Object[] { nhaCungCap.getTenNCC(), nhaCungCap.getDiaChiNCC(),
				nhaCungCap.getSdtNCC(), nhaCungCap.getId() });
	}

}
