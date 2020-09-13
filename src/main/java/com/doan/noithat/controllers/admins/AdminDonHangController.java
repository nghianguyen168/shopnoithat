package com.doan.noithat.controllers.admins;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doan.noithat.constants.GlobalsConstant;
import com.doan.noithat.models.ChiTietDonHang;
import com.doan.noithat.models.DonHang;
import com.doan.noithat.models.HinhThucThanhToan;
import com.doan.noithat.models.KhachHang;
import com.doan.noithat.services.ChiTietDonHangService;
import com.doan.noithat.services.DonHangService;
import com.doan.noithat.services.HinhThucThanhToanService;
import com.doan.noithat.services.KhachHangService;
import com.doan.noithat.utils.PaginationUtil;

@Controller
@RequestMapping("admin/donhang")
public class AdminDonHangController {

	@Autowired
	MessageSource messageSource;
	@Autowired
	private DonHangService donHangService;
	@Autowired
	private HinhThucThanhToanService hinhThucThanhToanService;
	@Autowired
	private KhachHangService khachHangSerivce;

	@Autowired
	private ChiTietDonHangService chiTietDonHangService;
	
	@GetMapping({ "index", "/index/{page}" })
	public String index(Model model, @PathVariable(required = false, name = "page") Integer page) {
		if (page == null) {
			page = 1;
		}
		int offset = PaginationUtil.getOffset(page);
		List<DonHang> listDonHang = donHangService.findAll(offset, GlobalsConstant.LIMIT_PAGE);
		int totalRow = donHangService.totalRow();
		int totalPage = (int) Math.ceil((float) totalRow / GlobalsConstant.LIMIT_PAGE);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("listDonHang", listDonHang);
		return "admin.donhang.index";

	}


	@GetMapping({ "/del/{id}" })
	public String del(@PathVariable(value = "id") int id, ModelMap modelMap) {
		int delDonHang = donHangService.del(id);
		if (delDonHang > 0) {
			return "redirect:/admin/donhang/index";
		} else {
			return "redirect:/admin/donhang/index";
		}

	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, Model model) {
		DonHang donHangItem = donHangService.findOne(id);
		List<KhachHang> listKhachHang = khachHangSerivce.findAll();
		List<HinhThucThanhToan> listHttt = hinhThucThanhToanService.findAll();
		model.addAttribute("donHangItem", donHangItem);
		model.addAttribute("listHttt", listHttt);
		model.addAttribute("listKhachHang", listKhachHang);
		return "admin.donhang.edit";
	}

	@PostMapping("/editDH/{id}")
	public String editDV(@ModelAttribute("donHang") DonHang donHang, BindingResult rs, RedirectAttributes rd,
			@PathVariable(value = "id") int id, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		if (rs.hasErrors()) {
			return "admin.donhang.edit";
		}
		if (donHangService.edit(donHang) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/donhang/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
		return "admin.donhang.add";

	}
	
	

}
