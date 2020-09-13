package com.doan.noithat.configs;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource dataSource;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery("select TaiKhoan, MatKhau,enable from taikhoan where TaiKhoan=?")
				.authoritiesByUsernameQuery("select k.TaiKhoan,concat('ROLE_',v.PhanQuyen) from taikhoan  k inner join vaitro v on v.ID = k.IDVaiTro where TaiKhoan=?")
				.passwordEncoder(bCryptPasswordEncoder());
				
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		 
		http.authorizeRequests().and().csrf().disable().formLogin()
		.loginPage("/furniture/login").usernameParameter("username").passwordParameter("password")
		.defaultSuccessUrl("/furniture/index").failureUrl("/furniture/login?msg=Err").loginProcessingUrl("/furniture/login")
		.and().logout().logoutUrl("/furniture/logout").logoutSuccessUrl("/furniture/login").invalidateHttpSession(true).deleteCookies("JSESSIONID")
		.and().exceptionHandling().accessDeniedPage("/error403");
		
		http.authorizeRequests().antMatchers("/").permitAll();
		
	}
	
	
	

	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
	    return new BCryptPasswordEncoder();
	}
	@Bean
	public Md5PasswordEncoder md5PasswordEncoder() {
		return new Md5PasswordEncoder();
	}
}