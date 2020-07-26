package com.doan.noithat.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.TaiKhoan;

@Repository
public class TaiKhoanDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String SQL_FIND_ALL = "SELECT * FROM taikhoan ORDER BY ID DESC";
	private final String ADD_TAIKHOAN = "INSERT INTO taikhoan(TaiKhoan,MatKhau,PhanQuyen) value(?,?,?)";
	private final String EDIT_TAIKHOAN = "UPDATE taikhoan SET TaiKhoan = ?,MatKhau = ?,PhanQuyen = ? WHERE ID = ?";
	private final String DEL_TAIKHOAN = "DELETE FROM taikhoan WHERE ID = ?";
	private final String FINDONE_TK = "SELECT * FROM taikhoan WHERE ID = ? ";
	private final String FINDBYUSERNAME = "SELECT * FROM taikhoan WHERE TaiKhoan = ? ";

	public List<TaiKhoan> findAll() {
		return jdbcTemplate.query(SQL_FIND_ALL, new BeanPropertyRowMapper<>(TaiKhoan.class));
	}

	public int add(TaiKhoan taiKhoan) {

		return jdbcTemplate.update(ADD_TAIKHOAN, taiKhoan.getTaiKhoan(), taiKhoan.getMatKhau(), taiKhoan.getPhanQuyen());
	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_TAIKHOAN, id);
	}

	public TaiKhoan findOne(int id) {
		return jdbcTemplate.queryForObject(FINDONE_TK, new BeanPropertyRowMapper<>(TaiKhoan.class), id);
	}
	public TaiKhoan findByUsername(String username) {
		return jdbcTemplate.queryForObject(FINDBYUSERNAME, new BeanPropertyRowMapper<>(TaiKhoan.class), username);
	}


	public int edit(TaiKhoan taiKhoan) {

		return jdbcTemplate.update(EDIT_TAIKHOAN, taiKhoan.getTaiKhoan(), taiKhoan.getMatKhau(), taiKhoan.getPhanQuyen(),taiKhoan.getId());
	}
	
}
