package com.doan.noithat.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ThongTinDatHang {
	private String hoTen;
	private String diaChi;
	private String sdt;
	private String email;
}
