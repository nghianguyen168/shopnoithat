package com.doan.noithat.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KhuyenMai {

	private int id;
	private SanPham sanPham;
	private int idSanPham;
	private DotKhuyenMai dotKhuyenMai;
	private int idDotKhuyenMai;
	private String hinhThuc;
	private String tiLe;

	public KhuyenMai(int id, int idSanPham, int idDotKhuyenMai, String hinhThuc, String tiLe) {
		super();
		this.id = id;
		this.idSanPham = idSanPham;
		this.idDotKhuyenMai = idDotKhuyenMai;
		this.hinhThuc = hinhThuc;
		this.tiLe = tiLe;
	}

	public KhuyenMai(int id, SanPham sanPham, DotKhuyenMai dotKhuyenMai, String hinhThuc, String tiLe) {
		super();
		this.id = id;
		this.sanPham = sanPham;
		this.dotKhuyenMai = dotKhuyenMai;
		this.hinhThuc = hinhThuc;
		this.tiLe = tiLe;
	}

}
