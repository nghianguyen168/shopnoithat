package com.doan.noithat.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GioHang {
	private int giohang_id;
	private SanPham sanPham;
	private int soluong;
	private int id_nguoiDung;
	private int id_DonHang;
}
