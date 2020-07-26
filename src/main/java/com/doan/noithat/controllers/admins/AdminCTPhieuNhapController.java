package com.doan.noithat.controllers.admins;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doan.noithat.models.ChiTietPhieuNhap;
import com.doan.noithat.services.ChiTietPhieuNhapService;

@MultipartConfig
@Controller
@RequestMapping("admin/ctphieunhap")
public class AdminCTPhieuNhapController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private ChiTietPhieuNhapService chiTietPhieuNhapService;

	@GetMapping({ "/detail/{id}", "/detail" })
	public String detail(@PathVariable(value = "id") int id, ModelMap modelMap) {
		ChiTietPhieuNhap chiTietPhieuNhapItem = chiTietPhieuNhapService.findOne(id);
		modelMap.addAttribute("chiTietPhieuNhapItem", chiTietPhieuNhapItem);
		return "admin.ctphieunhap.index";
	}


}
