package com.doan.noithat.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LienHe {
	
	private int id;
	private String hoTen;
	private String email;
	private String congTy;
	private String sdt;
	private String diaChi;
	private String binhLuan;

}
