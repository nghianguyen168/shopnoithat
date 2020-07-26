package com.doan.noithat.daos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.LienHe;

@Repository
public class LienHeDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String ADD_LIENHE = "INSERT INTO lienhe(HoTen,Email,CongTy,Sdt,DiaChi,BinhLuan) VALUE(?,?,?,?,?,?)";

	public int add(LienHe lienHe) {
		return jdbcTemplate.update(ADD_LIENHE, lienHe.getHoTen(), lienHe.getEmail(), lienHe.getCongTy(),
				lienHe.getSdt(), lienHe.getDiaChi(), lienHe.getBinhLuan());
	}

}
