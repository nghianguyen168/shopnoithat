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
import com.doan.noithat.models.DanhMucSanPham;
import com.doan.noithat.services.DanhMucSanPhamService;

@Controller
@RequestMapping("admin/danhmucsanpham")
public class AdminDanhMucSanPhamController {

	@Autowired
	MessageSource messageSource;

	@Autowired
	private DanhMucSanPhamService danhMucSanPhamService;

	@GetMapping("index")
	public String index(ModelMap modelMap) {
		List<DanhMucSanPham> listDMSP = danhMucSanPhamService.findAll();
		modelMap.addAttribute("listDMSP", listDMSP);
		return "admin.danhmucsanpham.index";

	}

	@GetMapping("add")
	public String add() {
		return "admin.danhmucsanpham.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("danhMucSanPham") DanhMucSanPham danhMucSanPham, BindingResult rs,
			RedirectAttributes rd) {
		if (rs.hasErrors()) {

			return "admin.danhmucsanpham.add";
		}
		if (danhMucSanPhamService.add(danhMucSanPham) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/danhmucsanpham/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
		return "admin.danhmucsanpham.add";
	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, ModelMap modelMap) {
		DanhMucSanPham danhMucSanPhamItem = danhMucSanPhamService.findOne(id);
		modelMap.addAttribute("danhMucSanPhamItem", danhMucSanPhamItem);
		System.out.println();
		return "admin.danhmucsanpham.edit";
	}

	@PostMapping("/editDMSP/{id}")
	public String editSP(@ModelAttribute(value = "danhMucSanPham") DanhMucSanPham danhMucSanPham,
			@PathVariable(value = "id") int id, BindingResult rs, RedirectAttributes rd, ModelMap modelMap) {
		if (rs.hasErrors()) {
			return "admin.danhmucsanpham.edit";
		}
		if (danhMucSanPhamService.edit(danhMucSanPham) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/danhmucsanpham/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
		return "admin.danhmucsanpham.add";
	}
	
	@GetMapping({"/del/{id}"})
	public String del(@PathVariable(value = "id") int id) {
		int delDanhMuciSanPham = danhMucSanPhamService.del(id);
		if (delDanhMuciSanPham > 0) {
			return "redirect:/admin/danhmucsanpham/index";
		} else {
			return "redirect:/admin/danhmucsanpham/index";
		}

	}

}
