package com.doan.noithat.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.KhachHang;
import com.sun.org.apache.regexp.internal.recompile;

@Repository
public class KhachHangDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String SQL_FIND_ALL = "SELECT * FROM khachhang ORDER BY ID DESC";
	private final String ADD_KHACHHANG = "INSERT INTO khachhang(HoTen,NgayTao,NgaySua,TenDangNhap,Email,SDT,MatKhau) value(?,?,?,?,?,?,?)";
	private final String EDIT_KHACHHANG = "UPDATE khachhang SET HoTen = ?,NgayTao = ?,NgaySua = ? ,TenDangNhap = ?,Email = ?,SDT = ?,MatKhau = ? WHERE ID = ?";
	private final String DEL_KHACHHANG = "DELETE FROM khachhang WHERE ID = ?";
	private final String FINDONE_KH = "SELECT * FROM khachhang WHERE ID = ? ";
	private final String LOGIN ="SELECT * FROM khachhang WHERE TenDangNhap =? AND MatKhau=? LIMIT 1";

	public List<KhachHang> findAll() {
		return jdbcTemplate.query(SQL_FIND_ALL, new BeanPropertyRowMapper<>(KhachHang.class));
	}

	public int add(KhachHang khachHang) {

		return jdbcTemplate.update(ADD_KHACHHANG, khachHang.getHoTen(), khachHang.getNgayTao(), khachHang.getNgaySua(),
				khachHang.getTenDangNhap(), khachHang.getEmail(),khachHang.getSdt(),khachHang.getMatKhau());
	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_KHACHHANG, id);
	}

	public KhachHang findOne(int id) {
		return jdbcTemplate.queryForObject(FINDONE_KH, new BeanPropertyRowMapper<>(KhachHang.class), id);
	}

	public int edit(KhachHang khachHang) {

		return jdbcTemplate.update(EDIT_KHACHHANG, khachHang.getHoTen(), khachHang.getNgayTao(), khachHang.getNgaySua(),
				khachHang.getTenDangNhap(), khachHang.getEmail(),khachHang.getSdt(),khachHang.getMatKhau(),khachHang.getId());
	}
	public KhachHang login(String username,String password) {
		try {
		return jdbcTemplate.queryForObject(LOGIN,new BeanPropertyRowMapper<>(KhachHang.class),username,password);
		} catch (EmptyResultDataAccessException  e) {
			return null;
		}
	}
}
