package com.doan.noithat.daos;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.ChiTietDonHang;
import com.doan.noithat.models.SanPham;

@Repository
public class CTDonHangDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String FINDONE_DH = "SELECT c.*, s.TenSanPham FROM chitietdonhang AS c INNER JOIN sanpham AS s ON c.IDSanPham = s.ID  WHERE c.ID = ? ";

	public ChiTietDonHang findOne(int id) {
		return jdbcTemplate.query(FINDONE_DH, new ResultSetExtractor<ChiTietDonHang>() {

			@Override
			public ChiTietDonHang extractData(ResultSet rs) throws SQLException, DataAccessException {
				ChiTietDonHang chiTietDonHang = null;
				if (rs.next()) {
					chiTietDonHang = new ChiTietDonHang(rs.getInt("id"), rs.getString("ma"),
							new SanPham(rs.getInt("id"), rs.getString("tenSanPham")), rs.getInt("soLuong"),
							rs.getBigDecimal("tongTien"), rs.getInt("trangThai"));
				}
				return chiTietDonHang;
			}
		}, id);
	}

}
