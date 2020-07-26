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
import com.doan.noithat.models.PhieuNhap;
import com.doan.noithat.services.PhieuNhapService;

@MultipartConfig
@Controller
@RequestMapping("admin/phieunhap")
public class AdminPhieuNhapController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private PhieuNhapService phieuNhapService;

	@GetMapping("index")
	public String index(ModelMap modelMap) {
		List<PhieuNhap> listPhieuNhap = phieuNhapService.findAll();
		modelMap.addAttribute("listPhieuNhap", listPhieuNhap);
		return "admin.phieunhap.index";
	}

	@GetMapping("add")
	public String add(@ModelAttribute("phieuNhap") PhieuNhap phieuNhap, ModelMap modelMap) {
		return "admin.phieunhap.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("phieuNhap") PhieuNhap phieuNhap, BindingResult rs, RedirectAttributes rd,
			ModelMap modelMap, HttpServletRequest request) throws IllegalStateException, IOException {

		if (rs.hasErrors()) {
			return "admin.phieunhap.add";
		}
		if (phieuNhapService.add(phieuNhap) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/phieunhap/index";
		}

		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
		return "admin.phieunhap.add";

	}

	@GetMapping({ "/del/{id}" })
	public String del(@PathVariable(value = "id") int id, ModelMap modelMap) {
		int delPhieuNhap = phieuNhapService.del(id);
		if (delPhieuNhap > 0) {
			return "redirect:/admin/phieunhap/index";
		} else {
			return "redirect:/admin/phieunhap/index";
		}

	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, ModelMap modelMap) {
		PhieuNhap phieuNhapItem = phieuNhapService.findOne(id);
		modelMap.addAttribute("phieuNhapItem", phieuNhapItem);
		return "admin.phieunhap.edit";
	}

	@PostMapping("/editPN/{id}")
	public String editTK(@ModelAttribute("phieuNhap") PhieuNhap phieuNhap, BindingResult rs, RedirectAttributes rd,
			@PathVariable(value = "id") int id, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		if (rs.hasErrors()) {
			return "admin.phieunhap.edit";
		}
		if (phieuNhapService.edit(phieuNhap) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/phieunhap/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
		return "admin.phieunhap.add";

	}

}
