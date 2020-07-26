package com.doan.noithat.controllers.admins;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doan.noithat.models.ChiTietDonHang;
import com.doan.noithat.services.ChiTietDonHangService;

@MultipartConfig
@Controller
@RequestMapping("admin/ctdonhang")
public class AdminCTDonHangController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private ChiTietDonHangService chiTietDonHangService;
	
	

	@GetMapping({ "/detail/{id}", "/detail" })
	public String detail(@PathVariable(value = "id") int id, Model model) {
		ChiTietDonHang chiTietDonHangItem = chiTietDonHangService.findOne(id);
		model.addAttribute("chiTietDonHangItem", chiTietDonHangItem);
		return "admin.ctdonhang.index";
	}

}
