package com.doan.noithat.models;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PhieuXuat {

	private int id;
	private Date ngayInHD;
	private String nguoiNhan;
	private Kho kho;
	private int idKho;
	private String chuThich;

	public PhieuXuat(int id, Date ngayInHD, String nguoiNhan, int idKho, String chuThich) {
		super();
		this.id = id;
		this.ngayInHD = ngayInHD;
		this.nguoiNhan = nguoiNhan;
		this.idKho = idKho;
		this.chuThich = chuThich;
	}

	public PhieuXuat(int id, Date ngayInHD, String nguoiNhan, Kho kho, String chuThich) {
		super();
		this.id = id;
		this.ngayInHD = ngayInHD;
		this.nguoiNhan = nguoiNhan;
		this.kho = kho;
		this.chuThich = chuThich;
	}

}
