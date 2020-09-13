package com.doan.noithat.controllers.admins;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doan.noithat.constants.GlobalsConstant;
import com.doan.noithat.models.Banner;
import com.doan.noithat.services.BannerService;
import com.doan.noithat.utils.FileUtil;

@Controller
@RequestMapping("admin/banner")
public class AdminBannerController {

	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private BannerService bannerService;
	
	@GetMapping("/index")
	public String index(Model model) {
		List<Banner> bannerList = bannerService.findAll();
		System.out.println(bannerList.size());
		model.addAttribute("bannerList", bannerList);
		return "admin.banner.index";
	}
	
	@GetMapping("add")
	public String add() {
		return "admin.banner.add";
	}
	
	@PostMapping("add")
	public String add_post(@ModelAttribute("banner") Banner banner,@RequestParam("ha") MultipartFile picture,
			RedirectAttributes rd,HttpServletRequest request) throws IllegalStateException, IOException {
		
		String image = FileUtil.upload(picture, request);
		banner.setPicture(image);
		System.out.println(banner.getPicture());
		int add_banner = bannerService.add(banner);
		if(add_banner>0) {
			rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("success", null, Locale.getDefault()));
			return "redirect:/admin/banner/index";
		} else {
			rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("error", null, Locale.getDefault()));
			return "admin.banner.add";
		}
		
	}
	
	@GetMapping({"edit","edit/{id}"})
	public String edit_ban(@PathVariable int id,Model model) {
		Banner banner = bannerService.findOne(id);
		model.addAttribute("banner", banner);
		return "admin.banner.edit";
	}
	
	@PostMapping({"edit/{id}"})
	public String edit(@PathVariable int id,@ModelAttribute("banner") Banner banner, @RequestParam("ha") MultipartFile picture,HttpServletRequest request,RedirectAttributes rd) throws IllegalStateException, IOException {
		String image;
		String image_old = bannerService.findOne(id).getPicture();
		if("".equals(picture.getOriginalFilename())) {
			image = image_old;
		} else {
			FileUtil.delete(image_old, request);
			image = FileUtil.upload(picture, request);
		}
		
		banner.setPicture(image);
		banner.setId(id);
		int edit_Item = bannerService.edit(banner);
		if(edit_Item>0) {
			rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("success", null, Locale.getDefault()));
			return "redirect:/admin/banner/index";
		} else {
			rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("error", null, Locale.getDefault()));
			return "redirect:/admin/banner/edit";
		}
		
	}
	
	@GetMapping({"del/{id}"})
	public String del(@PathVariable int id,RedirectAttributes rd) {
		int delItem = bannerService.del(id);
		if(delItem>0) {
			rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("success", null, Locale.getDefault()));
			return "redirect:/admin/banner/index";
		} else {
			rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("error", null, Locale.getDefault()));
			return "redirect:/admin/banner/index";
		}
	}
	
}
