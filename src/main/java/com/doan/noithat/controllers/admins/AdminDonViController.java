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
import com.doan.noithat.models.DonVi;
import com.doan.noithat.services.DonViService;

@MultipartConfig
@Controller
@RequestMapping("admin/donvi")
public class AdminDonViController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private DonViService donViService;

	@GetMapping("index")
	public String index(ModelMap modelMap) {
		List<DonVi> listDonVi = donViService.findAll();
		modelMap.addAttribute("listDonVi", listDonVi);
		return "admin.donvi.index";
	}

	@GetMapping("add")
	public String add(@ModelAttribute("donVi") DonVi donVi, ModelMap modelMap) {
		return "admin.donvi.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("donVi") DonVi donVi, BindingResult rs, RedirectAttributes rd,
			ModelMap modelMap, HttpServletRequest request) throws IllegalStateException, IOException {

		if (rs.hasErrors()) {
			return "admin.donvi.add";
		}
		if (donViService.add(donVi) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/donvi/index";
		}

		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
		return "admin.donvi.add";

	}

	@GetMapping({ "/del/{id}" })
	public String del(@PathVariable(value = "id") int id, ModelMap modelMap) {
		int delDonVi = donViService.del(id);
		if (delDonVi > 0) {
			return "redirect:/admin/donvi/index";
		} else {
			return "redirect:/admin/donvi/index";
		}

	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, ModelMap modelMap) {
		DonVi donViItem = donViService.findOne(id);
		modelMap.addAttribute("donViItem", donViItem);
		return "admin.donvi.edit";
	}

	@PostMapping("/editDV/{id}")
	public String editDV(@ModelAttribute("donVi") DonVi donVi, BindingResult rs, RedirectAttributes rd,
			@PathVariable(value = "id") int id, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		if (rs.hasErrors()) {
			return "admin.donvi.edit";
		}
		if (donViService.edit(donVi) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/donvi/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
		return "admin.donvi.add";

	}

}
