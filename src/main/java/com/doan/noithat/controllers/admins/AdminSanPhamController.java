package com.doan.noithat.controllers.admins;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doan.noithat.constants.GlobalsConstant;
import com.doan.noithat.models.DanhMucSanPham;
import com.doan.noithat.models.NhaCungCap;
import com.doan.noithat.models.SanPham;
import com.doan.noithat.services.DanhMucSanPhamService;
import com.doan.noithat.services.NhaCungCapService;
import com.doan.noithat.services.SanPhamService;
import com.doan.noithat.utils.FileUtil;
import com.doan.noithat.utils.PaginationUtil;

@MultipartConfig
@Controller
@RequestMapping("admin/sanpham")
public class AdminSanPhamController {
	@Autowired
	MessageSource messageSource;
	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private DanhMucSanPhamService danhMucSanPhamService;
	@Autowired
	private NhaCungCapService nhaCungCapService;

	@GetMapping({ "index", "/index/{page}" })
	public String index(Model model, @PathVariable(required = false, name = "page") Integer page) {
		if (page == null) {
			page = 1;
		}
		int offset = PaginationUtil.getOffset(page);
		List<SanPham> listSanPham = sanPhamService.findAll(offset, GlobalsConstant.LIMIT_PAGE);
		int totalRow = sanPhamService.totalRow();
		int totalPage = (int) Math.ceil((float) totalRow / GlobalsConstant.LIMIT_PAGE);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("listSanPham", listSanPham);
		return "admin.sanpham.index";

	}

	@GetMapping("add")
	public String add(@ModelAttribute("danhMucSanPham") DanhMucSanPham danhMucSanPham, ModelMap modelMap) {
		List<DanhMucSanPham> listDanhMuc = danhMucSanPhamService.findAll();
		List<NhaCungCap> listNhaCungCap = nhaCungCapService.findAll();
		modelMap.addAttribute("listDanhMuc", listDanhMuc);
		modelMap.addAttribute("listNhaCungCap", listNhaCungCap);
		return "admin.sanpham.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("sanPham") SanPham sanPham, BindingResult rs, RedirectAttributes rd,
			@RequestParam("hinhanh") MultipartFile hinhAnh,@RequestParam("hinhanhmota") List<MultipartFile> hinhanhmota, ModelMap modelMap, HttpServletRequest request,HttpServletRequest servletRequest)
			throws IllegalStateException, IOException {

		if (rs.hasErrors()) {
			return "admin.sanpham.add";
		}

		String fileName = FileUtil.upload(hinhAnh, request);
		sanPham.setHinhAnh(fileName);
		
		    //upload nhiều hình ảnh mô tả
		 	List<MultipartFile> files =hinhanhmota;
	        String fileNames = "";
	        if (null != files && files.size() > 0) 
	        {
	            for (MultipartFile multipartFile : files) {
	 
	                String fileName1 = multipartFile.getOriginalFilename();
	                fileNames = fileNames + "/"+fileName1;
	                File imageFile = new File(servletRequest.getServletContext().getRealPath("/anhmota"), fileName1);
	                System.out.println(imageFile);
	                try
	                {
	                    multipartFile.transferTo(imageFile);
	                } catch (IOException e) 
	                {
	                    e.printStackTrace();
	                }
	            }
	        }
	        sanPham.setHinhAnh_MoTa(fileNames);

		if (sanPhamService.add(sanPham) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/sanpham/index";
		}

		rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
		return "admin.sanpham.add";

	}

	@GetMapping({ "/del/{id}" })
	public String del(@PathVariable(value = "id") int id, ModelMap modelMap) {
		int delSanPham = sanPhamService.del(id);
		if (delSanPham > 0) {
			return "redirect:/admin/sanpham/index";
		} else {
			return "redirect:/admin/sanpham/index";
		}

	}

	@GetMapping({ "/edit/{id}", "/edit" })
	public String edit(@PathVariable(value = "id") int id, Model model) {
		List<DanhMucSanPham> listDanhMuc = danhMucSanPhamService.findAll();
		List<NhaCungCap> listNhaCungCap = nhaCungCapService.findAll();
		SanPham sanPhamItem = sanPhamService.findOne(id);
		model.addAttribute("listDanhMuc", listDanhMuc);
		model.addAttribute("listNhaCungCap", listNhaCungCap);
		model.addAttribute("sanPhamItem", sanPhamItem);
		return "admin.sanpham.edit";
	}

	@PostMapping("/editSP/{id}")
	public String editSP(@ModelAttribute("sanPham") SanPham sanPham, @RequestParam("hinhanh") MultipartFile hinhAnh,
			@PathVariable(value = "id") int id, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		String fileName = FileUtil.upload(hinhAnh, request);
		sanPham.setId(id);
		sanPham.setHinhAnh(fileName);
		sanPhamService.edit(sanPham);
		model.addAttribute("listSanPham", sanPhamService.findAll());
		return "redirect:/admin/sanpham/index";

	}

}
