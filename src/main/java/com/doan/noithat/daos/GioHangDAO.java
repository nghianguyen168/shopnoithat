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

import com.doan.noithat.models.DanhMucSanPham;
import com.doan.noithat.models.GioHang;
import com.doan.noithat.models.NhaCungCap;
import com.doan.noithat.models.SanPham;

@Repository
public class GioHangDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private final String ADD_TO_CART = "INSERT INTO giohang(Id_Sanpham,SoLuong,Id_NguoiDung) VALUES(?,?,?)";
	private final String ADD_TO_CART_EXIST = "UPDATE giohang SET soluong=soluong + ? WHERE Id_Sanpham=?";
	private final String CHECK_EXIST ="SELECT * FROM giohang WHERE Id_Sanpham=?";
	private final String FIND_ALL_BY_USER = "SELECT g.*,s.* FROM giohang g INNER JOIN sanpham s  WHERE g.Id_Sanpham=s.ID  AND Id_NguoiDung= ? AND id_DonHAng=0";
	private final String DEL_ITEM= "DELETE FROM giohang WHERE Giohang_Id=?";
	private final String UPDATE_QUANLITY ="UPDATE giohang SET soluong=? WHERE Id_Sanpham=?";
	private final String UPDATE_ORDER ="UPDATE giohang SET id_DonHang=? WHERE Id_Sanpham=?";

	public int add_to_cart(GioHang gioHang) {
		return jdbcTemplate.update(ADD_TO_CART,gioHang.getSanPham().getId(),gioHang.getSoluong(),gioHang.getId_nguoiDung());
	}
	
	public int add_to_cart_exist(int id_SanPham,int soLuong) {
		return jdbcTemplate.update(ADD_TO_CART_EXIST,soLuong,id_SanPham);
	}
	public int update_quanlity(int id_SanPham,int soLuong) {
		return jdbcTemplate.update(UPDATE_QUANLITY,soLuong,id_SanPham);
	}
	public int update_when_order(int id_SanPham,int id_DonHang) {
		return jdbcTemplate.update(UPDATE_ORDER,id_DonHang,id_SanPham);
	}
	public int del_item(int id_item) {
		return jdbcTemplate.update(DEL_ITEM,id_item);
	}
	public GioHang check_exist(int id_SanPham) {
		try {
		return jdbcTemplate.queryForObject(CHECK_EXIST, new BeanPropertyRowMapper<>(GioHang.class),id_SanPham);
		} catch (Exception e) {
		return null;
		}
	}
	public List<GioHang> find_add(int id_NguoiDung) {
		
		return jdbcTemplate.query(FIND_ALL_BY_USER, new ResultSetExtractor<List<GioHang>>() {

			@Override
			public List<GioHang> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<GioHang> gioHangLit = new ArrayList<GioHang>();
				while(rs.next()) {
					GioHang gioHang = new GioHang(rs.getInt("giohang_id"), new SanPham(rs.getInt("id"), rs.getString("tenSanPham"),
							  rs.getInt("soLuongTon"),
							rs.getBigDecimal("giaGoc"), rs.getBigDecimal("giaKhuyenMai"), 
							rs.getString("hinhAnh"), rs.getInt("sao")),
							rs.getInt("soluong"), rs.getInt("id_nguoiDung"),0);
					gioHangLit.add(gioHang);
				}
				
				return gioHangLit;
			}
		},id_NguoiDung);
		
	}
	
	
}
