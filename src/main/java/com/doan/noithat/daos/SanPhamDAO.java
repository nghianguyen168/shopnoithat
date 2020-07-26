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
import com.doan.noithat.models.NhaCungCap;
import com.doan.noithat.models.SanPham;

@Repository
public class SanPhamDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String SQL_FIND_ALL = "SELECT s.*,d.TenDanhMuc,n.TenNCC FROM sanpham AS s "
			+ "INNER JOIN danhmucsanpham AS d ON s.IDDanhMucSP = d.ID "
			+ "INNER JOIN nhacungcap AS n ON s.IDNhaCungCap = n.ID ORDER BY s.ID DESC";
	private static final String ADD_SANPHAM = "INSERT INTO sanpham(TenSanPham,MoTaSanPham,DonViTinh,SoLuongTon,IDDanhMucSP,IDNhaCungCap,Thue,GiaGoc,GiaKhuyenMai,HinhAnh,HinhAnh_Mota,Sao) value(?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String EDIT_SANPHAM = "UPDATE sanpham SET TenSanPham = ?,MoTaSanPham = ?,DonViTinh = ?,SoLuongTon = ? ,IDDanhMucSP = ?,IDNhaCungCap = ?,Thue = ?,GiaGoc = ?,GiaKhuyenMai = ?,HinhAnh= ?,Sao = ? WHERE ID = ?";
	private static final String DEL_SANPHAM = "DELETE FROM sanpham WHERE ID =?";
	private static final String FINDONE_SP = "SELECT * FROM sanpham WHERE ID = ? ";
	private static final String FIND_ALL_PAGINATE = "SELECT s.*,d.TenDanhMuc,n.TenNCC FROM sanpham AS s "
			+ "INNER JOIN danhmucsanpham AS d ON s.IDDanhMucSP = d.ID "
			+ "INNER JOIN nhacungcap AS n ON s.IDNhaCungCap = n.ID ORDER BY s.ID DESC LIMIT ?,?";
	private static final String TOTAL_ROW = "SELECT COUNT(*) AS totalRow FROM sanpham ";
	private static final String FIND_RD = "SELECT * FROM sanpham  ORDER BY RAND() LIMIT 6 ";
	private static final String FIND_NEW = "SELECT s.*,d.TenDanhMuc,n.TenNCC FROM sanpham AS s "
			+ "INNER JOIN danhmucsanpham AS d ON s.IDDanhMucSP = d.ID "
			+ "INNER JOIN nhacungcap AS n ON s.IDNhaCungCap = n.ID ORDER BY s.ID DESC LIMIT 10";

	private static final String FIND_BY_CAT_PAGINATE = "SELECT s.*,d.TenDanhMuc,n.TenNCC FROM sanpham AS s"
			+ " INNER JOIN danhmucsanpham AS d ON s.IDDanhMucSP = d.ID INNER JOIN nhacungcap AS n ON"
			+ " s.IDNhaCungCap = n.ID WHERE IDDanhMucSP= ? ORDER BY s.ID DESC LIMIT ?,?";
	
	private static final String FIND_BY_CAT = "SELECT s.*,d.TenDanhMuc,n.TenNCC FROM sanpham AS s"
			+ " INNER JOIN danhmucsanpham AS d ON s.IDDanhMucSP = d.ID INNER JOIN nhacungcap AS n ON"
			+ " s.IDNhaCungCap = n.ID WHERE IDDanhMucSP= ? ORDER BY s.ID DESC";
	// findAll
	public List<SanPham> findAll() {
		return jdbcTemplate.query(SQL_FIND_ALL, new ResultSetExtractor<List<SanPham>>() {

			@Override
			public List<SanPham> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<SanPham> listSanPham = new ArrayList<SanPham>();
				while (rs.next()) {
					SanPham sanPham = new SanPham(rs.getInt("id"), rs.getString("tenSanPham"),
							rs.getString("moTaSanPham"), rs.getString("donViTinh"), rs.getInt("soLuongTon"),
							new DanhMucSanPham(rs.getInt("id"), rs.getString("tenDanhMuc")),
							new NhaCungCap(rs.getInt("id"), rs.getString("tenNCC")), rs.getString("thue"),
							rs.getBigDecimal("giaGoc"), rs.getBigDecimal("giaKhuyenMai"), rs.getString("hinhAnh"),
							rs.getInt("sao"));
					listSanPham.add(sanPham);
				}

				return listSanPham;
			}
		});
	}
	// findAll
	public List<SanPham> find_new() {
		return jdbcTemplate.query(FIND_NEW, new ResultSetExtractor<List<SanPham>>() {

			@Override
			public List<SanPham> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<SanPham> listSanPham = new ArrayList<SanPham>();
				while (rs.next()) {
					SanPham sanPham = new SanPham(rs.getInt("id"), rs.getString("tenSanPham"),
							rs.getString("moTaSanPham"), rs.getString("donViTinh"), rs.getInt("soLuongTon"),
							new DanhMucSanPham(rs.getInt("id"), rs.getString("tenDanhMuc")),
							new NhaCungCap(rs.getInt("id"), rs.getString("tenNCC")), rs.getString("thue"),
							rs.getBigDecimal("giaGoc"), rs.getBigDecimal("giaKhuyenMai"), rs.getString("hinhAnh"),
							rs.getInt("sao"));
					listSanPham.add(sanPham);
				}

				return listSanPham;
			}
		});
	}

	// phân trang
	public List<SanPham> findAll(int offset, int limit) {
		return jdbcTemplate.query(FIND_ALL_PAGINATE, new ResultSetExtractor<List<SanPham>>() {

			@Override
			public List<SanPham> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<SanPham> listSanPham = new ArrayList<SanPham>();
				while (rs.next()) {
					SanPham sanPham = new SanPham(rs.getInt("id"), rs.getString("tenSanPham"),
							rs.getString("moTaSanPham"), rs.getString("donViTinh"), rs.getInt("soLuongTon"),
							new DanhMucSanPham(rs.getInt("id"), rs.getString("tenDanhMuc")),
							new NhaCungCap(rs.getInt("id"), rs.getString("tenNCC")), rs.getString("thue"),
							rs.getBigDecimal("giaGoc"), rs.getBigDecimal("giaKhuyenMai"), 
							rs.getString("hinhAnh"), rs.getInt("sao"));
					listSanPham.add(sanPham);
				}

				return listSanPham;
			}
		}, new Object[] { offset, limit });
	}

	public List<SanPham> findByCat(int offset, int limit,int catId) {
		return jdbcTemplate.query(FIND_BY_CAT_PAGINATE, new ResultSetExtractor<List<SanPham>>() {

			@Override
			public List<SanPham> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<SanPham> listSanPham = new ArrayList<SanPham>();
				while (rs.next()) {
					SanPham sanPham = new SanPham(rs.getInt("id"), rs.getString("tenSanPham"),
							rs.getString("moTaSanPham"), rs.getString("donViTinh"), rs.getInt("soLuongTon"),
							new DanhMucSanPham(rs.getInt("id"), rs.getString("tenDanhMuc")),
							new NhaCungCap(rs.getInt("id"), rs.getString("tenNCC")), rs.getString("thue"),
							rs.getBigDecimal("giaGoc"), rs.getBigDecimal("giaKhuyenMai"), 
							rs.getString("hinhAnh"), rs.getInt("sao"));
					listSanPham.add(sanPham);
				}

				return listSanPham;
			}
		}, new Object[] { catId,offset, limit });
	}
	public List<SanPham> findByCat_All(int catId) {
		return jdbcTemplate.query(FIND_BY_CAT, new ResultSetExtractor<List<SanPham>>() {

			@Override
			public List<SanPham> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<SanPham> listSanPham = new ArrayList<SanPham>();
				while (rs.next()) {
					SanPham sanPham = new SanPham(rs.getInt("id"), rs.getString("tenSanPham"),
							rs.getString("moTaSanPham"), rs.getString("donViTinh"), rs.getInt("soLuongTon"),
							new DanhMucSanPham(rs.getInt("id"), rs.getString("tenDanhMuc")),
							new NhaCungCap(rs.getInt("id"), rs.getString("tenNCC")), rs.getString("thue"),
							rs.getBigDecimal("giaGoc"), rs.getBigDecimal("giaKhuyenMai"), 
							rs.getString("hinhAnh"), rs.getInt("sao"));
					listSanPham.add(sanPham);
				}

				return listSanPham;
			}
		}, new Object[] { catId});
	}
	
	public int totalRow() {
		return jdbcTemplate.queryForObject(TOTAL_ROW, Integer.class);
	}

	public int add(SanPham sanPham) {

		return jdbcTemplate.update(ADD_SANPHAM, sanPham.getTenSanPham(), sanPham.getMoTaSanPham(),
				sanPham.getDonViTinh(), sanPham.getSoLuongTon(), sanPham.getIdDanhMucSP(), sanPham.getIdNhaCungCap(),
				sanPham.getThue(), sanPham.getGiaGoc(), sanPham.getGiaKhuyenMai(),  sanPham.getHinhAnh(),sanPham.getHinhAnh_MoTa(),
				sanPham.getSao());
	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_SANPHAM, id);
	}

	public SanPham findOne(int id) {
		return jdbcTemplate.queryForObject(FINDONE_SP, new BeanPropertyRowMapper<>(SanPham.class), id);
	}

	public int edit(SanPham sanPham) {

		return jdbcTemplate.update(EDIT_SANPHAM, sanPham.getTenSanPham(), sanPham.getMoTaSanPham(),
				sanPham.getDonViTinh(), sanPham.getSoLuongTon(), sanPham.getIdDanhMucSP(), sanPham.getIdNhaCungCap(),
				sanPham.getThue(), sanPham.getGiaGoc(), sanPham.getGiaKhuyenMai(),  sanPham.getHinhAnh(),
				sanPham.getSao(), sanPham.getId());
	}

	public List<SanPham> findRD() {

		return jdbcTemplate.query(FIND_RD, new BeanPropertyRowMapper<>(SanPham.class));
	}
}
