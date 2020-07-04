package com.doan.noithat.controllers.admins;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

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
import com.doan.noithat.models.KhachHang;
import com.doan.noithat.services.KhachHangService;

@MultipartConfig
@Controller
@RequestMapping("admin/khachhang")
public class AdminKhachHangController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private KhachHangService khachHangService;

	@GetMapping("index")
	public String index(ModelMap modelMap) {
		List<KhachHang> listKhachHang = khachHangService.findAll();
		modelMap.addAttribute("listKhachHang", listKhachHang);

		return "admin.khachhang.index";
	}

	@GetMapping("add")
	public String add(ModelMap modelMap) {

		return "admin.khachhang.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("khachHang") KhachHang khachHang, BindingResult rs, RedirectAttributes rd,
			ModelMap modelMap, HttpServletRequest request) throws IllegalStateException, IOException {

		if (rs.hasErrors()) {
			return "admin.khachhang.add";
		}
		if (khachHangService.add(khachHang) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/khachhang/index";
		}

		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
		return "admin.khachhang.add";

	}

	@GetMapping({ "/del/{id}" })
	public String del(@PathVariable(value = "id") int id, ModelMap modelMap) {
		int delKhachHang = khachHangService.del(id);
		if (delKhachHang > 0) {
			return "redirect:/admin/khachhang/index";
		} else {
			return "redirect:/admin/khachhang/index";
		}

	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, ModelMap modelMap) {
		KhachHang khachHangItem = khachHangService.findOne(id);
		modelMap.addAttribute("khachHangItem", khachHangItem);
		return "admin.khachhang.edit";
	}

	@PostMapping("/editKH/{id}")
	public String editSP(@ModelAttribute("khachHang") KhachHang khachHang,BindingResult rs, RedirectAttributes rd, @PathVariable(value = "id") int id,
			Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		if (rs.hasErrors()) {
			return "admin.khachhang.edit";
		}
		if (khachHangService.edit(khachHang) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/khachhang/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
		return "admin.khachhang.add";

	}

}
