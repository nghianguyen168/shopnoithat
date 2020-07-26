package com.doan.noithat.models;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChiTietDonHang {

	private int id;
	private String ma;
	private SanPham sanPham;
	private int idSanPham;
	private int soLuong;
	private BigDecimal tongTien;
	private int trangThai;
	public ChiTietDonHang(int id, String ma, int idSanPham, int soLuong, BigDecimal tongTien, int trangThai) {
		super();
		this.id = id;
		this.ma = ma;
		this.idSanPham = idSanPham;
		this.soLuong = soLuong;
		this.tongTien = tongTien;
		this.trangThai = trangThai;
	}
	public ChiTietDonHang(int id, String ma, SanPham sanPham, int soLuong, BigDecimal tongTien, int trangThai) {
		super();
		this.id = id;
		this.ma = ma;
		this.sanPham = sanPham;
		this.soLuong = soLuong;
		this.tongTien = tongTien;
		this.trangThai = trangThai;
	}

}
