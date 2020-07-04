package com.doan.noithat.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TaiKhoan {

	private int id;
	private String taiKhoan;
	private String matKhau;
	private String phanQuyen;

}
