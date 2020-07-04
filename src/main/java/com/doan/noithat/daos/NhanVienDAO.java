package com.doan.noithat.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.NhanVien;

@Repository
public class NhanVienDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String SQL_FIND_ALL = "SELECT * FROM nhanvien ORDER BY ID DESC";
	private final String ADD_NHANVIEN = "INSERT INTO nhanvien(TenNV,NgaySinh,GioiTinh,DiaChi,SDT,ChucVu,TrinhDoChuyenMon,IDDonVi) value(?,?,?,?,?,?,?,?)";
	private final String EDIT_NHANVIEN = "UPDATE nhanvien SET TenNV = ?,NgaySinh = ?,GioiTinh = ? ,DiaChi = ?,SDT = ?,ChucVu = ?,TrinhDoChuyenMon = ?,IDDonVi = ? WHERE ID = ?";
	private final String DEL_NHANVIEN = "DELETE FROM nhanvien WHERE ID = ?";
	private final String FINDONE_NV = "SELECT * FROM nhanvien WHERE ID = ? ";

	public List<NhanVien> findAll() {
		return jdbcTemplate.query(SQL_FIND_ALL, new BeanPropertyRowMapper<>(NhanVien.class));
	}

	public int add(NhanVien nhanVien) {

		return jdbcTemplate.update(ADD_NHANVIEN, nhanVien.getTenNV(), nhanVien.getNgaySinh(), nhanVien.getGioiTinh(),
				nhanVien.getDiaChi(), nhanVien.getSdt(),nhanVien.getChucVu(),nhanVien.getTrinhDoChuyenMon(),nhanVien.getIdDonVi());
	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_NHANVIEN, id);
	}

	public NhanVien findOne(int id) {
		return jdbcTemplate.queryForObject(FINDONE_NV, new BeanPropertyRowMapper<>(NhanVien.class), id);
	}

	public int edit(NhanVien nhanVien) {

		return jdbcTemplate.update(EDIT_NHANVIEN, nhanVien.getTenNV(), nhanVien.getNgaySinh(), nhanVien.getGioiTinh(),
				nhanVien.getDiaChi(), nhanVien.getSdt(),nhanVien.getChucVu(),nhanVien.getTrinhDoChuyenMon(),nhanVien.getIdDonVi(),nhanVien.getId());
	}
}
