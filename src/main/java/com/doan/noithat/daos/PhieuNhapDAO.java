package com.doan.noithat.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.PhieuNhap;

@Repository
public class PhieuNhapDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String SQL_FIND_ALL = "SELECT * FROM phieunhap ORDER BY ID DESC";
	private final String ADD_PHIEUNHAP = "INSERT INTO phieunhap(NgayInHoaDon,IDNhaCungCap,DiaChi,NguoiGiao,IDKho,ChuThich) value(?,?,?,?,?,?)";
	private final String EDIT_PHIEUNHAP = "UPDATE phieunhap SET NgayInHoaDon = ?,IDNhaCungCap = ?,DiaChi = ?,NguoiGiao = ?,IDKho = ? ,ChuThich = ? WHERE ID = ?";
	private final String DEL_PHIEUNHAP = "DELETE FROM phieunhap WHERE ID = ?";
	private final String FINDONE_PN = "SELECT * FROM phieunhap	 WHERE ID = ? ";

	public List<PhieuNhap> findAll() {
		return jdbcTemplate.query(SQL_FIND_ALL, new BeanPropertyRowMapper<>(PhieuNhap.class));
	}

	public int add(PhieuNhap phieuNhap) {

		return jdbcTemplate.update(ADD_PHIEUNHAP, phieuNhap.getNgayInHoaDon(), phieuNhap.getIdNhaCungCap(),
				phieuNhap.getDiaChi(),phieuNhap.getNguoiGiao(),phieuNhap.getIdKho(), phieuNhap.getChuThich());
	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_PHIEUNHAP, id);
	}

	public PhieuNhap findOne(int id) {
		return jdbcTemplate.queryForObject(FINDONE_PN, new BeanPropertyRowMapper<>(PhieuNhap.class), id);
	}

	public int edit(PhieuNhap phieuNhap) {

		return jdbcTemplate.update(EDIT_PHIEUNHAP,  phieuNhap.getNgayInHoaDon(), phieuNhap.getIdNhaCungCap(),
				phieuNhap.getDiaChi(),phieuNhap.getNguoiGiao(),phieuNhap.getIdKho(), phieuNhap.getChuThich(), phieuNhap.getId());
	}
}
