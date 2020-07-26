package com.doan.noithat.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.DanhMucSanPham;

@Repository
public class DanhMucSanPhamDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String SQL_FIND_ALL = "SELECT * FROM danhmucsanpham ORDER BY ID DESC";
	private final String ADD_DANHMUCSANPHAM = "INSERT INTO danhmucsanpham(TenDanhMuc,ChuThich) VALUE(?,?)";
	private final String EDIT_DANHMUCSANPHAM = "UPDATE danhmucsanpham SET TenDanhMuc = ?,ChuThich = ? WHERE ID = ?";
	private final String FINDONE_DANHMUCSANPHAM = "SELECT * FROM danhmucsanpham WHERE ID = ? ";
	private final String DEL_DANHMUCSANPHAM = "DELETE FROM danhmucsanpham WHERE ID = ?";

	public List<DanhMucSanPham> findAll() {
		return jdbcTemplate.query(SQL_FIND_ALL, new BeanPropertyRowMapper<>(DanhMucSanPham.class));
	}

	public int add(DanhMucSanPham danhMucSanPham) {

		return jdbcTemplate.update(ADD_DANHMUCSANPHAM, new Object[] { danhMucSanPham.getTenDanhMuc(),danhMucSanPham.getChuThich() });
	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_DANHMUCSANPHAM, id);
	}

	public DanhMucSanPham findOne(int id) {
		// TODO Auto-generated method stub
		return jdbcTemplate.queryForObject(FINDONE_DANHMUCSANPHAM, new BeanPropertyRowMapper<>(DanhMucSanPham.class), id);
	}

	public int edit(DanhMucSanPham danhMucSanPham) {
		return jdbcTemplate.update(EDIT_DANHMUCSANPHAM, new Object[] { danhMucSanPham.getTenDanhMuc(),danhMucSanPham.getChuThich(),danhMucSanPham.getId()});
	}

}
