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
import com.doan.noithat.models.KhuyenMai;
import com.doan.noithat.models.SanPham;
import com.doan.noithat.services.DotKhuyenMaiService;
import com.doan.noithat.services.KhuyenMaiService;
import com.doan.noithat.services.SanPhamService;

@MultipartConfig
@Controller
@RequestMapping("admin/khuyenmai")
public class AdminKhuyenMaiController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private KhuyenMaiService khuyenMaiService;
	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private DotKhuyenMaiService dotKhuyenMaiService;

	@GetMapping("index")
	public String index(Model model) {
		List<KhuyenMai> listKM = khuyenMaiService.findAll();
		model.addAttribute("listKM", listKM);
		return "admin.khuyenmai.index";
	}

	@GetMapping("add")
	public String add(@ModelAttribute("khuyenMai") KhuyenMai khuyenMai, Model model) {
		List<SanPham> sanPhamList = sanPhamService.findAll();
		List<DotKhuyenMai> dotKMList = dotKhuyenMaiService.findAll();
		model.addAttribute("sanPhamList", sanPhamList);
		model.addAttribute("dotKMList", dotKMList);
		return "admin.khuyenmai.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("khuyenMai") KhuyenMai khuyenMai, BindingResult rs, RedirectAttributes rd,
			Model model, HttpServletRequest request) throws IllegalStateException, IOException {

		if (rs.hasErrors()) {
			return "admin.khuyenmai.add";
		}
		if (khuyenMaiService.add(khuyenMai) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/khuyenmai/index";
		}

		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
		return "admin.khuyenmai.add";

	}

	@GetMapping({ "/del/{id}" })
	public String del(@PathVariable(value = "id") int id, ModelMap modelMap) {
		int delKM = khuyenMaiService.del(id);
		if (delKM > 0) {
			return "redirect:/admin/khuyenmai/index";
		} else {
			return "redirect:/admin/khuyenmai/index";
		}

	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, Model model) {
		KhuyenMai khuyenMaiItem = khuyenMaiService.findOne(id);
		List<SanPham> sanPhamList = sanPhamService.findAll();
		List<DotKhuyenMai> dotKMList = dotKhuyenMaiService.findAll();
		model.addAttribute("khuyenMaiItem", khuyenMaiItem);
		model.addAttribute("sanPhamList", sanPhamList);
		model.addAttribute("dotKMList", dotKMList);
		return "admin.khuyenmai.edit";
	}

	@PostMapping("/editKM/{id}")
	public String editDV(@ModelAttribute("khuyenMai") KhuyenMai khuyenMai, BindingResult rs, RedirectAttributes rd,
			@PathVariable(value = "id") int id, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		if (rs.hasErrors()) {
			return "admin.khuyenmai.edit";
		}
		if (khuyenMaiService.edit(khuyenMai) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/khuyenmai/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
		return "admin.khuyenmai.add";

	}

}
