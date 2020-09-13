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

import com.doan.noithat.models.DonHang;
import com.doan.noithat.models.HinhThucThanhToan;
import com.doan.noithat.models.KhachHang;
import com.doan.noithat.models.TaiKhoan;
import com.doan.noithat.models.ThongTinDatHang;

@Repository
public class DonHangDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String SQL_FIND_ALL = "SELECT d.*, k.HoTen,h.HinhThucTT FROM donhang AS d "
			+ "INNER JOIN hinhthucthanhtoan AS h ON d.IDHinhThucTT = h.ID ORDER BY d.ID DESC";
	private static final String FIND_BY_USER ="SELECT * FROM donhang WHERE IDKhachHang=?";
	private static final String SQL_FIND_PAGINATE = "SELECT d.*,h.HinhThucTT FROM donhang AS d  "
			+ "INNER JOIN hinhthucthanhtoan AS h ON d.IDHinhThucTT = h.ID ORDER BY d.ID DESC LIMIT ? , ?";
	private static final String EDIT_DONHANG = "UPDATE donhang SET IDKhachHang = ?,Tong = ?,HoTen = ?,"
			+ "SDTNguoiMua = ?,eemaililNguoiMua = ?,DiaChiNguoiMua = ?,IDHinhThucTT = ?,TrangThaiDonHang = ? WHERE ID = ?";
	private static final String FINDONE_DONHANG = "SELECT * FROM donhang WHERE ID = ? ";
	private static final String DEL_DONHANG = "DELETE FROM donhang WHERE ID = ?";
	private static final String TOTAL_ROW = "SELECT COUNT(*) AS totalRow FROM donhang ";
	private static final String ADD_ORDER ="INSERT INTO donhang(ID,IDKhachHang,Tong,HoTen,SDTNguoiMua,EmailNguoiMua,DiaChiNguoiMua,IDHinhThucTT,TrangThaiDonHang) VALUES(?,?,?,?,?,?,?,?,?)";


	public List<DonHang> findAll() {
		return jdbcTemplate.query(SQL_FIND_ALL, new ResultSetExtractor<List<DonHang>>() {

			@Override
			public List<DonHang> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<DonHang> listDonHang = new ArrayList<DonHang>();
				while (rs.next()) {
					DonHang donHang = new DonHang(rs.getInt("id"),
							new KhachHang(rs.getInt("id"), rs.getString("hoTen")), rs.getString("tong"),
							rs.getString("HoTen"), rs.getInt("sdtNguoiMua"), rs.getString("emailNguoiMua"),
							rs.getString("diaChiNguoiMua"),
							new HinhThucThanhToan(rs.getInt("id"), rs.getString("hinhThucTT")),rs.getDate("NgayDat"),
							rs.getInt("trangThaiDonHang"));
					listDonHang.add(donHang);
				}
				return listDonHang;
			}
		});
	}
	
	public List<DonHang> don_Hang_User(TaiKhoan taiKhoan){
		return jdbcTemplate.query(FIND_BY_USER, new BeanPropertyRowMapper<>(DonHang.class),taiKhoan.getId());
	}
	public int add_order(TaiKhoan taiKhoan,ThongTinDatHang thongTinDatHang,int soluong,int hinhthuc_tt,int id_donhang) {
		return jdbcTemplate.update(ADD_ORDER,id_donhang,taiKhoan.getId(),soluong,thongTinDatHang.getHoTen(),thongTinDatHang.getSdt(),thongTinDatHang.getEmail(),thongTinDatHang.getDiaChi(),hinhthuc_tt,"1");
	}
	
	public List<DonHang> findAll(int offset, int limit) {
		return jdbcTemplate.query(SQL_FIND_PAGINATE, new ResultSetExtractor<List<DonHang>>() {

			@Override
			public List<DonHang> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<DonHang> listDonHang = new ArrayList<DonHang>();
				while (rs.next()) {
					DonHang donHang = new DonHang(rs.getInt("id"),
							new KhachHang(rs.getInt("id"), rs.getString("hoTen")), rs.getString("tong"),
							rs.getString("HoTen"), rs.getInt("sdtNguoiMua"), rs.getString("emailNguoiMua"),
							rs.getString("diaChiNguoiMua"),
							new HinhThucThanhToan(rs.getInt("id"), rs.getString("hinhThucTT")),rs.getDate("NgayDat"),
							rs.getInt("trangThaiDonHang"));
					listDonHang.add(donHang);
				}
				return listDonHang;
			}
		} ,new Object[] {offset,limit});
	}
	
	public int totalRow() {
		return jdbcTemplate.queryForObject(TOTAL_ROW, Integer.class);
	}


	public int del(int id) {
		return jdbcTemplate.update(DEL_DONHANG, id);
	}

	public DonHang findOne(int id) {
		// TODO Auto-generated method stub
		return jdbcTemplate.queryForObject(FINDONE_DONHANG, new BeanPropertyRowMapper<>(DonHang.class), id);
	}

	public int edit(DonHang donHang) {
		return jdbcTemplate.update(EDIT_DONHANG,
				new Object[] { donHang.getIdKhachHang(), donHang.getTong(), donHang.getHoTen(), donHang.getSdtNguoiMua(),
						donHang.getEmailNguoiMua(), donHang.getDiaChiNguoiMua(),donHang.getIdHinhThucTT(), donHang.getTrangThaiDonHang(),
						donHang.getId() });
	}

}
