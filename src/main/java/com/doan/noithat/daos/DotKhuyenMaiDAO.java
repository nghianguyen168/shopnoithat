package com.doan.noithat.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.DotKhuyenMai;

@Repository
public class DotKhuyenMaiDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String FIND_ALL = "SELECT * FROM dotkhuyenmai ORDER BY ID DESC";
	private static final String ADD_DOTKHUYENMAI = "INSERT INTO dotkhuyenmai(TenKhuyenMai,NgayBatDau,NgayKetThuc) VALUE(?,?,?)";
	private static final String DEL_DOTKHUYENMAI = "DELETE FROM dotkhuyenmai WHERE ID = ?";
	private static final String FIND_ONE_DKM = "SELECT * FROM dotkhuyenmai WHERE ID = ?";
	private static final String EDIT_DKM = "UPDATE dotkhuyenmai SET TenKhuyenMai = ?,NgayBatDau = ?,NgayKetThuc = ? WHERE ID = ? ";

	public List<DotKhuyenMai> findAll() {

		return jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<>(DotKhuyenMai.class));

	}

	public int add(DotKhuyenMai dotKhuyenMai) {
		return jdbcTemplate.update(ADD_DOTKHUYENMAI, dotKhuyenMai.getTenKhuyenMai(), dotKhuyenMai.getNgayBatDau(),
				dotKhuyenMai.getNgayKetThuc());
	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_DOTKHUYENMAI, id);
	}

	public DotKhuyenMai findOne(int id) {
		// TODO Auto-generated method stub
		return jdbcTemplate.queryForObject(FIND_ONE_DKM, new BeanPropertyRowMapper<>(DotKhuyenMai.class), id);
	}

	public int edit(DotKhuyenMai dotKhuyenMai) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update(EDIT_DKM, dotKhuyenMai.getTenKhuyenMai(), dotKhuyenMai.getNgayBatDau(),
				dotKhuyenMai.getNgayKetThuc(), dotKhuyenMai.getId());
	}

}
