package com.doan.noithat.models;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NhanVien {
	
	private int id;
	private String tenNV;
	private Date ngaySinh;
	private String gioiTinh;
	private String diaChi;
	private int sdt;
	private String chucVu;
	private String trinhDoChuyenMon;
	private String idDonVi;

}
