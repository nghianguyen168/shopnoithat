package com.doan.noithat.models;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SanPham {

	private int id;
	private String tenSanPham;
	private String moTaSanPham;
	private String donViTinh;
	private int soLuongTon;
	private DanhMucSanPham danhMucSanPham;
	private int idDanhMucSP;
	private NhaCungCap nhaCungCap;
	private int idNhaCungCap;
	private String thue;
	private BigDecimal giaGoc;
	private BigDecimal giaKhuyenMai;
	private String hinhAnh;
	private int sao;

	public SanPham(int id, String tenSanPham) {
		super();
		this.id = id;
		this.tenSanPham = tenSanPham;
	}

	public SanPham(int id, String tenSanPham, String moTaSanPham, String donViTinh, int soLuongTon, int idDanhMucSP,
			int idNhaCungCap, String thue, BigDecimal giaGoc, BigDecimal giaKhuyenMai, String hinhAnh, int sao) {
		super();
		this.id = id;
		this.tenSanPham = tenSanPham;
		this.moTaSanPham = moTaSanPham;
		this.donViTinh = donViTinh;
		this.soLuongTon = soLuongTon;
		this.idDanhMucSP = idDanhMucSP;
		this.idNhaCungCap = idNhaCungCap;
		this.thue = thue;
		this.giaGoc = giaGoc;
		this.giaKhuyenMai = giaKhuyenMai;
		this.hinhAnh = hinhAnh;
		this.sao = sao;
	}

	public SanPham(int id, String tenSanPham, String moTaSanPham, String donViTinh, int soLuongTon,
			DanhMucSanPham danhMucSanPham, NhaCungCap nhaCungCap, String thue, BigDecimal giaGoc,
			BigDecimal giaKhuyenMai, String hinhAnh, int sao) {
		super();
		this.id = id;
		this.tenSanPham = tenSanPham;
		this.moTaSanPham = moTaSanPham;
		this.donViTinh = donViTinh;
		this.soLuongTon = soLuongTon;
		this.danhMucSanPham = danhMucSanPham;
		this.nhaCungCap = nhaCungCap;
		this.thue = thue;
		this.giaGoc = giaGoc;
		this.giaKhuyenMai = giaKhuyenMai;
		this.hinhAnh = hinhAnh;
		this.sao = sao;
	}

}
