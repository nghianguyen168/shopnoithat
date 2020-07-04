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
import com.doan.noithat.models.DotKhuyenMai;
import com.doan.noithat.services.DotKhuyenMaiService;

@MultipartConfig
@Controller
@RequestMapping("admin/dotkhuyenmai")
public class AdminDotKhuyenMaiController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private DotKhuyenMaiService dotKhuyenMaiService;

	@GetMapping("index")
	public String index(Model model) {
		List<DotKhuyenMai> listDKM = dotKhuyenMaiService.findAll();
		model.addAttribute("listDKM", listDKM);
		return "admin.dotkhuyenmai.index";
	}

	@GetMapping("add")
	public String add(@ModelAttribute("dotKhuyenMai") DotKhuyenMai dotKhuyenMai, Model model) {
		return "admin.dotkhuyenmai.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("dotKhuyenMai") DotKhuyenMai dotKhuyenMai, BindingResult rs,
			RedirectAttributes rd, Model model, HttpServletRequest request) throws IllegalStateException, IOException {

		if (rs.hasErrors()) {
			return "admin.dotkhuyenmai.add";
		}
		if (dotKhuyenMaiService.add(dotKhuyenMai) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/dotkhuyenmai/index";
		}

		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
		return "admin.dotkhuyenmai.add";

	}

	@GetMapping({ "/del/{id}" })
	public String del(@PathVariable(value = "id") int id, ModelMap modelMap) {
		int delDKM = dotKhuyenMaiService.del(id);
		if (delDKM > 0) {
			return "redirect:/admin/dotkhuyenmai/index";
		} else {
			return "redirect:/admin/dotkhuyenmai/index";
		}

	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, Model model) {
		DotKhuyenMai dotKhuyenMaiItem = dotKhuyenMaiService.findOne(id);
		model.addAttribute("dotKhuyenMaiItem", dotKhuyenMaiItem);
		return "admin.dotkhuyenmai.edit";
	}

	@PostMapping("/editDKM/{id}")
	public String editDV(@ModelAttribute("dotKhuyenMai") DotKhuyenMai dotKhuyenMai, BindingResult rs,
			RedirectAttributes rd, @PathVariable(value = "id") int id, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		if (rs.hasErrors()) {
			return "admin.dotkhuyenmai.edit";
		}
		if (dotKhuyenMaiService.edit(dotKhuyenMai) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/dotkhuyenmai/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
		return "admin.dotkhuyenmai.add";

	}

}
