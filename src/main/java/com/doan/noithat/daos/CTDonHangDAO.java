package com.doan.noithat.daos;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.ChiTietDonHang;
import com.doan.noithat.models.GioHang;
import com.doan.noithat.models.SanPham;
import com.doan.noithat.models.TaiKhoan;

@Repository
public class CTDonHangDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String FINDONE_DH = "SELECT c.*, s.TenSanPham FROM chitietdonhang AS c INNER JOIN sanpham AS s ON c.IDSanPham = s.ID  WHERE c.ID = ? ";
	private static final String ADD_ITEM="INSERT INTO chitietdonhang(IDSanPham,Gia,soluong,Id_NguoiDung,id_DonHang,TrangThai) VALUES(?,?,?,?,?,?)"; 
	private static final String FIND_ODER_PRODUCT="SELECT c.*,s.TenSanPham,s.HinhAnh FROM chitietdonhang c INNER JOIN sanpham s WHERE c.IDSanPham=s.ID AND c.id_DonHang=?";
	
	public ChiTietDonHang findOne(int id) {
		return jdbcTemplate.query(FINDONE_DH, new ResultSetExtractor<ChiTietDonHang>() {

			@Override
			public ChiTietDonHang extractData(ResultSet rs) throws SQLException, DataAccessException {
				ChiTietDonHang chiTietDonHang = null;
				if (rs.next()) {
					chiTietDonHang = new ChiTietDonHang(rs.getInt("id"), rs.getInt("id_SanPham"), new SanPham(rs.getInt("id"), rs.getString("tenSanPham"), rs.getString("hinhAnh")), rs.getBigDecimal("gia"), rs.getInt("soluong"), rs.getInt("id_NguoiDung"), rs.getInt("id_DonHang"), rs.getInt("trang_thai"));
				}
				return chiTietDonHang;
			}
		}, id);
	}
	
	public int add(TaiKhoan taiKhoan,GioHang gioHang,int soluong,int id_donhang,int trang_thai) {
		BigDecimal gia = gioHang.getSanPham().getGiaGoc().subtract(gioHang.getSanPham().getGiaKhuyenMai());
		return jdbcTemplate.update(ADD_ITEM,gioHang.getSanPham().getId(),gia ,soluong,taiKhoan.getId(),id_donhang,trang_thai);
	}
	
	public List<ChiTietDonHang> find_oder_product(int id_donhang){
		return jdbcTemplate.query(FIND_ODER_PRODUCT, new ResultSetExtractor<List<ChiTietDonHang>>() {

			@Override
			public List<ChiTietDonHang> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<ChiTietDonHang> ctdonhang_list = new ArrayList<ChiTietDonHang>();
				while(rs.next()) {
					ChiTietDonHang chiTietDonHang = new ChiTietDonHang(rs.getInt("ID"), rs.getInt("IDSanPham"), new SanPham(0, rs.getString("TenSanPham"), rs.getString("HinhAnh")) , rs.getBigDecimal("Gia"), rs.getInt("SoLuong"), rs.getInt("id_NguoiDung"), rs.getInt("Id_DonHang"), rs.getInt("TrangThai"));
					ctdonhang_list.add(chiTietDonHang);
				}
				return ctdonhang_list;
			}
		},id_donhang);
	}

}
