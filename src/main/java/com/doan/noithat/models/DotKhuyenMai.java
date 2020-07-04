package com.doan.noithat.models;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DotKhuyenMai {

	private int id;
	private String tenKhuyenMai;
	private Date ngayBatDau;
	private Date ngayKetThuc;

	public DotKhuyenMai(int id, String tenKhuyenMai) {
		super();
		this.id = id;
		this.tenKhuyenMai = tenKhuyenMai;
	}

}
