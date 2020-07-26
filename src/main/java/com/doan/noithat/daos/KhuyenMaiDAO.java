package com.doan.noithat.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.DotKhuyenMai;
import com.doan.noithat.models.KhuyenMai;
import com.doan.noithat.models.SanPham;

@Repository
public class KhuyenMaiDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String FIND_ALL = "SELECT k.*,s.TenSanPham,d.TenKhuyenMai FROM khuyenmai AS k INNER JOIN sanpham AS s ON k.IDSanPham = s.ID INNER JOIN dotkhuyenmai AS d ON k.IDDotKhuyenMai = d.ID ORDER BY k.ID DESC";
	private static final String ADD_KHUYENMAI = "INSERT INTO khuyenmai(IDSanPham,IDDotKhuyenMai,HinhThuc,TiLe) VALUE(?,?,?,?)";
	private static final String DEL_KHUYENMAI = "DELETE FROM khuyenmai WHERE ID = ?";
	private static final String FIND_ONE_KM = "SELECT * FROM khuyenmai WHERE ID = ?";
	private static final String EDIT_KM = "UPDATE khuyenmai SET IDSanPham = ?,IDDotKhuyenMai = ?,HinhThuc = ?,TiLe = ? WHERE ID = ? ";

	public List<KhuyenMai> findAll() {

		return jdbcTemplate.query(FIND_ALL, new ResultSetExtractor<List<KhuyenMai>>() {

			@Override
			public List<KhuyenMai> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<KhuyenMai> listKhuyenMai = new ArrayList<KhuyenMai>();
				while (rs.next()) {
					KhuyenMai khuyenMai = new KhuyenMai(rs.getInt("id"),new SanPham(rs.getInt("id"), rs.getString("tenSanPham")),
							new DotKhuyenMai(rs.getInt("id"), rs.getString("tenKhuyenMai")), rs.getString("hinhThuc"),
							rs.getString("tiLe"));
					listKhuyenMai.add(khuyenMai);
				}
				return listKhuyenMai;
			}
		});
	}

	public int add(KhuyenMai khuyenMai) {
		return jdbcTemplate.update(ADD_KHUYENMAI, khuyenMai.getIdSanPham(),khuyenMai.getIdDotKhuyenMai(),khuyenMai.getHinhThuc(),khuyenMai.getTiLe());
	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_KHUYENMAI, id);
	}

	public KhuyenMai findOne(int id) {
		// TODO Auto-generated method stub
		return jdbcTemplate.queryForObject(FIND_ONE_KM, new BeanPropertyRowMapper<>(KhuyenMai.class),id);
	}

	public int edit(KhuyenMai khuyenMai) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update(EDIT_KM, khuyenMai.getIdSanPham(),khuyenMai.getIdDotKhuyenMai(),khuyenMai.getHinhThuc(),khuyenMai.getTiLe(),khuyenMai.getId());
	}

}
