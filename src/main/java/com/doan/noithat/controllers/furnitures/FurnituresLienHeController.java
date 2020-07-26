package com.doan.noithat.controllers.furnitures;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doan.noithat.constants.GlobalsConstant;
import com.doan.noithat.models.LienHe;
import com.doan.noithat.services.LienHeService;

@Controller
@RequestMapping("furniture/lienhe")
public class FurnituresLienHeController {

	@Autowired
	private LienHeService lienHeService;
	@Autowired
	MessageSource messageSource;

	@GetMapping("index")
	public String index(Model model) {

		return "furniture.lienhe.index";
	}

	@PostMapping("index")
	public String add(@Valid @ModelAttribute("lienHe") LienHe lienHe, BindingResult rs, RedirectAttributes rd,
			Model model, HttpServletRequest request) {
		if (rs.hasErrors()) {
			return "furniture.lienhe.index";
		}
		if(lienHeService.add(lienHe) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("lienhe_success", null, Locale.getDefault()));
			return "redirect:/furniture/lienhe/index";
		}

		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("lienhe_error", null, Locale.getDefault()));
		return "furniture.lienhe.index";
	}

}
