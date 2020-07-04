package com.doan.noithat.models;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KhachHang {

	private int id;
	private String hoTen;
	private Date ngayTao;
	private Date ngaySua;
	private String tenDangNhap;
	private String email;
	private int sdt;
	private String matKhau;

	public KhachHang(int id, String hoTen) {
		super();
		this.id = id;
		this.hoTen = hoTen;
	}

}
