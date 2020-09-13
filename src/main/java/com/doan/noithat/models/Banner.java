package com.doan.noithat.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Banner {
	private int id;
	private String small_title;
	private String big_title;
	private String picture;
	
}
