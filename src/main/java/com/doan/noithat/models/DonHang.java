package com.doan.noithat.models;

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
	private int ma;
	private int sdtNguoiMua;
	private String emailNguoiMua;
	private String diaChiNguoiMua;
	private int idHinhThucTT;
	private HinhThucThanhToan hinhThucThanhToan;
	private int trangThaiDonHang;
		
	public DonHang(int id, int idKhachHang, String tong, int ma, int sdtNguoiMua, String emailNguoiMua,
			String diaChiNguoiMua, int idHinhThucTT, int trangThaiDonHang) {
		super();
		this.id = id;
		this.idKhachHang = idKhachHang;
		this.tong = tong;
		this.ma = ma;
		this.sdtNguoiMua = sdtNguoiMua;
		this.emailNguoiMua = emailNguoiMua;
		this.diaChiNguoiMua = diaChiNguoiMua;
		this.idHinhThucTT = idHinhThucTT;
		this.trangThaiDonHang = trangThaiDonHang;
	}

	public DonHang(int id, KhachHang khachHang, String tong, int ma, int sdtNguoiMua, String emailNguoiMua,
			String diaChiNguoiMua, HinhThucThanhToan hinhThucThanhToan, int trangThaiDonHang) {
		super();
		this.id = id;
		this.khachHang = khachHang;
		this.tong = tong;
		this.ma = ma;
		this.sdtNguoiMua = sdtNguoiMua;
		this.emailNguoiMua = emailNguoiMua;
		this.diaChiNguoiMua = diaChiNguoiMua;
		this.hinhThucThanhToan = hinhThucThanhToan;
		this.trangThaiDonHang = trangThaiDonHang;
	}


	

}
