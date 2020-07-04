package com.doan.noithat.controllers.furnitures;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doan.noithat.models.SanPham;
import com.doan.noithat.services.SanPhamService;

@Controller
@RequestMapping("furniture")
public class FurnituresController {
	
	@Autowired
	private SanPhamService sanPhamService;

	@GetMapping("index")
	public String index(Model model) {
		
		List<SanPham> listSanPham = sanPhamService.findRD();
		model.addAttribute("listSanPham", listSanPham);
		return "furniture.index";
	}
	
	
}
