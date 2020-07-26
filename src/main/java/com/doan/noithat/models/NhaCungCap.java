package com.doan.noithat.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NhaCungCap {

	private int id;
	private String tenNCC;
	private String diaChiNCC;
	private String sdtNCC;
	
	public NhaCungCap(int id, String tenNCC) {
		super();
		this.id = id;
		this.tenNCC = tenNCC;
	}
	
	
}