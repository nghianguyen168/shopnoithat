package com.doan.noithat.controllers.admins;

import java.util.List;
import java.util.Locale;

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
import com.doan.noithat.models.NhaCungCap;
import com.doan.noithat.services.NhaCungCapService;
import com.doan.noithat.utils.PaginationUtil;

@Controller
@RequestMapping("admin/nhacungcap")
public class AdminNhaCungCapController {

	@Autowired
	MessageSource messageSource;

	@Autowired
	private NhaCungCapService nhaCungCapService;

	@GetMapping({"index","/index/{page}"})
	public String index(Model model,@PathVariable(required = false , name = "page") Integer page) {
		if (page == null) {
			page = 1;
		}
		int offset = PaginationUtil.getOffset(page);
		List<NhaCungCap> listNCC= nhaCungCapService.findAll(offset,GlobalsConstant.LIMIT_PAGE);
		int totalRow = nhaCungCapService.totalRow();
		int totalPage = (int) Math.ceil((float) totalRow/GlobalsConstant.LIMIT_PAGE);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("listNCC", listNCC);
		return "admin.nhacungcap.index";

	}

	@GetMapping("add")
	public String add() {
		return "admin.nhacungcap.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("nhaCungCap") NhaCungCap nhaCungCap, BindingResult rs,
			RedirectAttributes rd) {
		if (rs.hasErrors()) {

			return "admin.nhacungcap.add";
		}
		if (nhaCungCapService.add(nhaCungCap) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/nhacungcap/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
		return "admin.nhacungcap.add";
	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, ModelMap modelMap) {
		NhaCungCap nhaCungCapItem = nhaCungCapService.findOne(id);
		modelMap.addAttribute("nhaCungCapItem", nhaCungCapItem);
		return "admin.nhacungcap.edit";
	}

	@PostMapping("/editNCC/{id}")
	public String editSP(@ModelAttribute(value = "nhaCungCap") NhaCungCap nhaCungCap,
			@PathVariable(value = "id") int id, BindingResult rs, RedirectAttributes rd, ModelMap modelMap) {
		if (rs.hasErrors()) {
			return "admin.nhacungcap.edit";
		}
		if (nhaCungCapService.edit(nhaCungCap) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/nhacungcap/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
		return "admin.nhacungcap.add";
	}

	@GetMapping({ "/del/{id}" })
	public String del(@PathVariable(value = "id") int id) {
		int delNCC = nhaCungCapService.del(id);
		if (delNCC > 0) {
			return "redirect:/admin/nhacungcap/index";
		} else {
			return "redirect:/admin/nhacungcap/index";
		}

	}

}
