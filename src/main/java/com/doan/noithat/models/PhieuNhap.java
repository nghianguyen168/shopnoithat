package com.doan.noithat.models;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PhieuNhap {

	private int id;
	private Date ngayInHoaDon;
	private int idNhaCungCap;
	private String diaChi;
	private String nguoiGiao;
	private int idKho;
	private String chuThich;
	
}
