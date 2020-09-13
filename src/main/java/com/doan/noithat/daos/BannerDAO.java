package com.doan.noithat.daos;

import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.doan.noithat.models.Banner;

@Repository
public class BannerDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public static final String ADD_BANNER = "INSERT INTO banner(small_title,big_title,picture) VALUES(?,?,?)";
	public static final String EDIT_BANNER = "UPDATE banner SET small_title=?,big_title=?,picture=? WHERE id=?";
	public static final String DEL_BANNER = "DELETE FROM banner WHERE id=?";
	public static final String FIND_ALL = "SELECT * FROM banner ORDER BY id DESC";
	public static final String FIND_ONE = "SELECT * FROM banner WHERE id=?";

	public int add(Banner banner) {
		return jdbcTemplate.update(ADD_BANNER,
				new Object[] { banner.getSmall_title(), banner.getBig_title(), banner.getPicture() });
	}

	public int edit(Banner banner) {
		return jdbcTemplate.update(EDIT_BANNER,
				new Object[] { banner.getSmall_title(), banner.getBig_title(), banner.getPicture(), banner.getId() });

	}

	public int del(int id) {
		return jdbcTemplate.update(DEL_BANNER, id);
	}

	public List<Banner> findAll() {
		return jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<>(Banner.class));
	}

	public Banner findOne(int id) {
		return jdbcTemplate.queryForObject(FIND_ONE, new BeanPropertyRowMapper<>(Banner.class), id);
	}
}
