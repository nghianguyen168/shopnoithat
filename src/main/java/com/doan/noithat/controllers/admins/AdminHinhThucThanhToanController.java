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
import com.doan.noithat.models.HinhThucThanhToan;
import com.doan.noithat.services.HinhThucThanhToanService;

@MultipartConfig
@Controller
@RequestMapping("admin/hinhthuctt")
public class AdminHinhThucThanhToanController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private HinhThucThanhToanService hinhThucThanhToanService;

	@GetMapping("index")
	public String index(Model model) {
		List<HinhThucThanhToan> listHinhThucTT = hinhThucThanhToanService.findAll();
		model.addAttribute("listHinhThucTT", listHinhThucTT);
		return "admin.hinhthuctt.index";
	}

	@GetMapping("add")
	public String add(@ModelAttribute("thanhToan") HinhThucThanhToan thanhToan, ModelMap modelMap) {
		return "admin.hinhthuctt.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("thanhToan") HinhThucThanhToan thanhToan, BindingResult rs, RedirectAttributes rd,
			ModelMap modelMap, HttpServletRequest request) throws IllegalStateException, IOException {

		if (rs.hasErrors()) {
			return "admin.hinhthuctt.add";
		}
		if (hinhThucThanhToanService.add(thanhToan) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/hinhthuctt/index";
		}

		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
		return "admin.hinhthuctt.add";

	}

	@GetMapping({ "/del/{id}" })
	public String del(@PathVariable(value = "id") int id, Model model) {
		int delHttt = hinhThucThanhToanService.del(id);
		if (delHttt > 0) {
			return "redirect:/admin/hinhthuctt/index";
		} else {
			return "redirect:/admin/hinhthuctt/index";
		}

	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, Model model) {
		HinhThucThanhToan htttItem = hinhThucThanhToanService.findOne(id);
		model.addAttribute("htttItem", htttItem);
		return "admin.hinhthuctt.edit";
	}

	@PostMapping("/editHttt/{id}")
	public String editTK(@ModelAttribute("thanhToan") HinhThucThanhToan thanhToan, BindingResult rs, RedirectAttributes rd,
			@PathVariable(value = "id") int id, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		if (rs.hasErrors()) {
			return "admin.hinhthuctt.edit";
		}
		if (hinhThucThanhToanService.edit(thanhToan) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/hinhthuctt/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
		return "admin.hinhthuctt.add";

	}

}
