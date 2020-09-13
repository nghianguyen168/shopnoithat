package com.doan.noithat.models;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DonHang {

	private int id;
	private KhachHang khachHang;
	private int idKhachHang;
	private String tong;
	private String HoTen;
	private int sdtNguoiMua;
	private String emailNguoiMua;
	private String diaChiNguoiMua;
	private int idHinhThucTT;
	private HinhThucThanhToan hinhThucThanhToan;
	private Date ngayDat;
	private int trangThaiDonHang;
		
	public DonHang(int id, int idKhachHang, String tong, String HoTen, int sdtNguoiMua, String emailNguoiMua,
			String diaChiNguoiMua, int idHinhThucTT, int trangThaiDonHang) {
		super();
		this.id = id;
		this.idKhachHang = idKhachHang;
		this.tong = tong;
		this.HoTen = HoTen;
		this.sdtNguoiMua = sdtNguoiMua;
		this.emailNguoiMua = emailNguoiMua;
		this.diaChiNguoiMua = diaChiNguoiMua;
		this.idHinhThucTT = idHinhThucTT;
		this.trangThaiDonHang = trangThaiDonHang;
	}

	public DonHang(int id, KhachHang khachHang, String tong, String HoTen, int sdtNguoiMua, String emailNguoiMua,
			String diaChiNguoiMua, HinhThucThanhToan hinhThucThanhToan,Date ngaydat, int trangThaiDonHang) {
		super();
		this.id = id;
		this.khachHang = khachHang;
		this.tong = tong;
		this.HoTen = HoTen;
		this.sdtNguoiMua = sdtNguoiMua;
		this.emailNguoiMua = emailNguoiMua;
		this.diaChiNguoiMua = diaChiNguoiMua;
		this.hinhThucThanhToan = hinhThucThanhToan;
		this.ngayDat=ngaydat;
		this.trangThaiDonHang = trangThaiDonHang;
	}


	

}
