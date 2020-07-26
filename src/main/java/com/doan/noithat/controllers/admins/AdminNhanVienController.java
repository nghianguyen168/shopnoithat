package com.doan.noithat.controllers.admins;

import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doan.noithat.constants.GlobalsConstant;
import com.doan.noithat.models.NhanVien;
import com.doan.noithat.services.NhanVienService;

@Controller
@RequestMapping("admin/nhanvien")
public class AdminNhanVienController {

	@Autowired
	MessageSource messageSource;

	@Autowired
	private NhanVienService nhanVienService;

	@GetMapping("index")
	public String index(ModelMap modelMap) {
		List<NhanVien> listNV= nhanVienService.findAll();
		modelMap.addAttribute("listNV", listNV);
		return "admin.nhanvien.index";

	}

	@GetMapping("add")
	public String add() {
		return "admin.nhanvien.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("nhanVien") NhanVien nhanVien, BindingResult rs,
			RedirectAttributes rd) {
		if (rs.hasErrors()) {

			return "admin.nhanvien.add";
		}
		if (nhanVienService.add(nhanVien) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/nhanvien/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
		return "admin.nhanvien.add";
	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, ModelMap modelMap) {
		NhanVien nhanVienItem = nhanVienService.findOne(id);
		modelMap.addAttribute("nhanVienItem", nhanVienItem);
		return "admin.nhanvien.edit";
	}

	@PostMapping("/editNV/{id}")
	public String editSP(@ModelAttribute(value = "nhanVien") NhanVien nhanVien,
			@PathVariable(value = "id") int id, BindingResult rs, RedirectAttributes rd, ModelMap modelMap) {
		if (rs.hasErrors()) {
			return "admin.nhanvien.edit";
		}
		if (nhanVienService.edit(nhanVien) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/nhanvien/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
		return "admin.nhanvien.add";
	}
	
	@GetMapping({"/del/{id}"})
	public String del(@PathVariable(value = "id") int id) {
		int delNV = nhanVienService.del(id);
		if (delNV > 0) {
			return "redirect:/admin/nhanvien/index";
		} else {
			return "redirect:/admin/nhanvien/index";
		}

	}

}
