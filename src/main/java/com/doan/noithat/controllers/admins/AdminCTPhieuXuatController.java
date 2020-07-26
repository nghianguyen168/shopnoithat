package com.doan.noithat.controllers.admins;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doan.noithat.models.ChiTietPhieuXuat;
import com.doan.noithat.services.ChiTietPhieuXuatService;

@MultipartConfig
@Controller
@RequestMapping("admin/ctphieuxuat")
public class AdminCTPhieuXuatController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private ChiTietPhieuXuatService chiTietPhieuXuatService;

	@GetMapping({ "/detail/{id}", "/detail" })
	public String detail(@PathVariable(value = "id") int id, ModelMap modelMap) {
		ChiTietPhieuXuat chiTietPhieuXuatItem = chiTietPhieuXuatService.findOne(id);
		modelMap.addAttribute("chiTietPhieuXuatItem", chiTietPhieuXuatItem);
		System.out.println(chiTietPhieuXuatItem);
		return "admin.ctphieuxuat.index";
	}


}
