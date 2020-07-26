package com.doan.noithat.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.PhieuXuat;

@Repository
public class PhieuXuatDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String SQL_FIND_ALL = "SELECT * FROM phieuxuat ORDER BY ID DESC";
	private final String ADD_PHIEUXUAT = "INSERT INTO phieuxuat(NgayInHD,NguoiNhan,IDKho,ChuThich) value(?,?,?,?)";
	private final String EDIT_PHIEUXUAT = "UPDATE phieuxuat SET NgayInHD = ?,NguoiNhan = ?,IDKho = ?,Chuthich = ? WHERE ID = ?";
	private final String DEL_PHIEUXUAT = "DELETE FROM phieuxuat WHERE ID = ?";
	private final String FINDONE_PX = "SELECT * FROM phieuxuat WHERE ID = ? ";

	public List<PhieuXuat> findAll() {
		return jdbcTemplate.query(SQL_FIND_ALL, new BeanPropertyRowMapper<>(PhieuXuat.class));
	}

	public int add(PhieuXuat phieuXuat) {

		return jdbcTemplate.update(ADD_PHIEUXUAT, phieuXuat.getNgayInHD(), phieuXuat.getNguoiNhan(), phieuXuat.getIdKho(),phieuXuat.getChuThich());
	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_PHIEUXUAT, id);
	}

	public PhieuXuat findOne(int id) {
		return jdbcTemplate.queryForObject(FINDONE_PX, new BeanPropertyRowMapper<>(PhieuXuat.class), id);
	}

	public int edit(PhieuXuat phieuXuat) {

		return jdbcTemplate.update(EDIT_PHIEUXUAT, phieuXuat.getNgayInHD(), phieuXuat.getNguoiNhan(), phieuXuat.getIdKho(),phieuXuat.getChuThich(),phieuXuat.getId());
	}
}
