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
	private int id_SanPham;
	private SanPham sanPham;
	private BigDecimal gia;
	private int soluong;
	private int id_NguoiDung;
	private int id_DonHang;
	private int trang_thai;

}
