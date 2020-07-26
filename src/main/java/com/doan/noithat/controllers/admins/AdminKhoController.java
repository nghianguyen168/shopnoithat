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
import com.doan.noithat.models.Kho;
import com.doan.noithat.services.impls.KhoServiceImpl;

@MultipartConfig
@Controller
@RequestMapping("admin/kho")
public class AdminKhoController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private KhoServiceImpl khoServiceImpl;

	@GetMapping("index")
	public String index(ModelMap modelMap) {
		List<Kho> listKho = khoServiceImpl.findAll();
		modelMap.addAttribute("listKho", listKho);
		return "admin.kho.index";
	}

	@GetMapping("add")
	public String add(@ModelAttribute("kho") Kho kho, ModelMap modelMap) {
		return "admin.kho.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("kho") Kho kho, BindingResult rs, RedirectAttributes rd,
			ModelMap modelMap, HttpServletRequest request) throws IllegalStateException, IOException {

		if (rs.hasErrors()) {
			return "admin.kho.add";
		}
		if (khoServiceImpl.add(kho) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/kho/index";
		}

		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
		return "admin.kho.add";

	}

	@GetMapping({ "/del/{id}" })
	public String del(@PathVariable(value = "id") int id, ModelMap modelMap) {
		int delKho = khoServiceImpl.del(id);
		if (delKho > 0) {
			return "redirect:/admin/kho/index";
		} else {
			return "redirect:/admin/kho/index";
		}

	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, ModelMap modelMap) {
		Kho khoItem = khoServiceImpl.findOne(id);
		modelMap.addAttribute("khoItem", khoItem);
		return "admin.kho.edit";
	}

	@PostMapping("/editK/{id}")
	public String editTK(@ModelAttribute("kho") Kho kho, BindingResult rs, RedirectAttributes rd,
			@PathVariable(value = "id") int id, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		if (rs.hasErrors()) {
			return "admin.kho.edit";
		}
		if (khoServiceImpl.edit(kho) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/kho/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
		return "admin.kho.add";

	}

}
