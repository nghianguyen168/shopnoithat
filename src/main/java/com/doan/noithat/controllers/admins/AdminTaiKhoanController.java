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
import com.doan.noithat.models.TaiKhoan;
import com.doan.noithat.services.TaiKhoanService;

@MultipartConfig
@Controller
@RequestMapping("admin/taikhoan")
public class AdminTaiKhoanController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private TaiKhoanService taiKhoanService;

	@GetMapping("index")
	public String index(ModelMap modelMap) {
		List<TaiKhoan> listTaiKhoan = taiKhoanService.findAll();
		modelMap.addAttribute("listTaiKhoan", listTaiKhoan);
		return "admin.taikhoan.index";
	}

	@GetMapping("add")
	public String add(@ModelAttribute("taiKhoan") TaiKhoan taiKhoan, ModelMap modelMap) {
		return "admin.taikhoan.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("taiKhoan") TaiKhoan taiKhoan, BindingResult rs, RedirectAttributes rd,
			ModelMap modelMap, HttpServletRequest request) throws IllegalStateException, IOException {

		if (rs.hasErrors()) {
			return "admin.taikhoan.add";
		}
		if (taiKhoanService.add(taiKhoan) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/taikhoan/index";
		}

		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
		return "admin.taikhoan.add";

	}

	@GetMapping({ "/del/{id}" })
	public String del(@PathVariable(value = "id") int id, ModelMap modelMap) {
		int delTaiKhoan = taiKhoanService.del(id);
		if (delTaiKhoan > 0) {
			return "redirect:/admin/taikhoan/index";
		} else {
			return "redirect:/admin/taikhoan/index";
		}

	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, ModelMap modelMap) {
		TaiKhoan taiKhoanItem = taiKhoanService.findOne(id);
		modelMap.addAttribute("taiKhoanItem", taiKhoanItem);
		return "admin.taikhoan.edit";
	}

	@PostMapping("/editTK/{id}")
	public String editTK(@ModelAttribute("taiKhoan") TaiKhoan taiKhoan, BindingResult rs, RedirectAttributes rd,
			@PathVariable(value = "id") int id, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		if (rs.hasErrors()) {
			return "admin.taikhoan.edit";
		}
		if (taiKhoanService.edit(taiKhoan) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/taikhoan/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
		return "admin.taikhoan.add";

	}

}
