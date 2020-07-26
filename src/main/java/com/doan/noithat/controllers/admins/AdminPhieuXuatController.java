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
import com.doan.noithat.models.PhieuXuat;
import com.doan.noithat.services.PhieuXuatService;

@MultipartConfig
@Controller
@RequestMapping("admin/phieuxuat")
public class AdminPhieuXuatController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private PhieuXuatService phieuXuatService;

	@GetMapping("index")
	public String index(ModelMap modelMap) {
		List<PhieuXuat> listPhieuXuat = phieuXuatService.findAll();
		modelMap.addAttribute("listPhieuXuat", listPhieuXuat);
		return "admin.phieuxuat.index";
	}

	@GetMapping("add")
	public String add(@ModelAttribute("phieuXuat") PhieuXuat phieuXuat, ModelMap modelMap) {
		return "admin.phieuxuat.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("phieuXuat") PhieuXuat phieuXuat, BindingResult rs, RedirectAttributes rd,
			ModelMap modelMap, HttpServletRequest request) throws IllegalStateException, IOException {

		if (rs.hasErrors()) {
			return "admin.phieuxuat.add";
		}
		if (phieuXuatService.add(phieuXuat) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/phieuxuat/index";
		}

		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
		return "admin.phieuxuat.add";

	}

	@GetMapping({ "/del/{id}" })
	public String del(@PathVariable(value = "id") int id, ModelMap modelMap) {
		int delPhieuXuat = phieuXuatService.del(id);
		if (delPhieuXuat > 0) {
			return "redirect:/admin/phieuxuat/index";
		} else {
			return "redirect:/admin/phieuxuat/index";
		}

	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, ModelMap modelMap) {
		PhieuXuat phieuXuatItem = phieuXuatService.findOne(id);
		modelMap.addAttribute("phieuXuatItem", phieuXuatItem);
		return "admin.phieuxuat.edit";
	}

	@PostMapping("/editPX/{id}")
	public String editTK(@ModelAttribute("phieuXuat") PhieuXuat phieuXuat, BindingResult rs, RedirectAttributes rd,
			@PathVariable(value = "id") int id, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		if (rs.hasErrors()) {
			return "admin.phieuxuat.edit";
		}
		if (phieuXuatService.edit(phieuXuat) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/phieuxuat/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
		return "admin.phieuxuat.add";

	}

}
