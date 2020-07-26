package com.doan.noithat.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.HinhThucThanhToan;

@Repository
public class HinhThucThanhToanDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String SQL_FIND_ALL = "SELECT * FROM hinhthucthanhtoan ORDER BY ID DESC";
	private static final String ADD_HINHTHUCTT = "INSERT INTO hinhthucthanhtoan(HinhThucTT) VALUE(?)";
	private static final String EDIT_HINHTHUCTT = "UPDATE hinhthucthanhtoan SET HinhThucTT = ? WHERE ID = ?";
	private static final String FINDONE_HTTT = "SELECT * FROM hinhthucthanhtoan WHERE ID = ? ";
	private static final String DEL_HTTT = "DELETE FROM hinhthucthanhtoan WHERE ID= ?";

	public List<HinhThucThanhToan> findAll() {
		return jdbcTemplate.query(SQL_FIND_ALL, new BeanPropertyRowMapper<>(HinhThucThanhToan.class));
	}

	public int add(HinhThucThanhToan hinhThucThanhToan) {

		return jdbcTemplate.update(ADD_HINHTHUCTT,
				new Object[] { hinhThucThanhToan.getHinhThucTT() });
	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_HTTT, id);
	}

	public HinhThucThanhToan findOne(int id) {
		// TODO Auto-generated method stub
		return jdbcTemplate.queryForObject(FINDONE_HTTT, new BeanPropertyRowMapper<>(HinhThucThanhToan.class), id);
	}

	public int edit(HinhThucThanhToan hinhThucThanhToan) {
		return jdbcTemplate.update(EDIT_HINHTHUCTT, new Object[] { hinhThucThanhToan.getHinhThucTT(), hinhThucThanhToan.getId()
				 });
	}

}
