package com.doan.noithat.models;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChiTietPhieuXuat {
	
	private int id;
	private SanPham sanPham;
	private int idSanPham;
	private int soLuong;
	private BigDecimal thanhTien;
	public ChiTietPhieuXuat(int id, int idSanPham, int soLuong, BigDecimal thanhTien) {
		super();
		this.id = id;
		this.idSanPham = idSanPham;
		this.soLuong = soLuong;
		this.thanhTien = thanhTien;
	}
	public ChiTietPhieuXuat(int id, SanPham sanPham, int soLuong, BigDecimal thanhTien) {
		super();
		this.id = id;
		this.sanPham = sanPham;
		this.soLuong = soLuong;
		this.thanhTien = thanhTien;
	}
	
	

}
