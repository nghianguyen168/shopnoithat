package com.doan.noithat.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TaiKhoan {

	private int id;
	private String username;
	private String hoTen;
	private String matKhau;
	private String email;
	private String phone;
	private String phanQuyen;

}
