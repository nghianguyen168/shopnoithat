package com.doan.noithat.controllers.admins;

import java.util.List;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doan.noithat.models.ChiTietDonHang;
import com.doan.noithat.models.DonHang;
import com.doan.noithat.services.ChiTietDonHangService;
import com.doan.noithat.services.DonHangService;

@MultipartConfig
@Controller
@RequestMapping("admin/ctdonhang")
public class AdminCTDonHangController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private ChiTietDonHangService chiTietDonHangService;
	
	@Autowired
	private DonHangService donHangService;

	@GetMapping({"detail","detail/{id}"})
	public String detail(@PathVariable int id,Model model) {
		DonHang donhhang = donHangService.findOne(id);
		List<ChiTietDonHang> listOrder = chiTietDonHangService.findAllByOrder(id);
		System.out.println(donhhang.getDiaChiNguoiMua());
		
		model.addAttribute("donhang", donhhang);
		model.addAttribute("listOrder", listOrder);
		return "admin.donhang.detail";
	}

}
