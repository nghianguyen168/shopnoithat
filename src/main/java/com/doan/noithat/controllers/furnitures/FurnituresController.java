package com.doan.noithat.controllers.furnitures;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doan.noithat.constants.GlobalsConstant;
import com.doan.noithat.models.DanhMucSanPham;
import com.doan.noithat.models.SanPham;
import com.doan.noithat.services.DanhMucSanPhamService;
import com.doan.noithat.services.SanPhamService;
import com.doan.noithat.utils.PaginationUtil;

@Controller
@RequestMapping("furniture")
public class FurnituresController {
	
	@Autowired
	private SanPhamService sanPhamService;

	@Autowired
	private DanhMucSanPhamService danhMucSanPhamService;
	
	@ModelAttribute
	public void addCatList(Model model) {
		List<DanhMucSanPham> listDanhMuc = danhMucSanPhamService.findAll();
		model.addAttribute("listDanhMuc", listDanhMuc);
	}
	
	@GetMapping("index")
	public String index(Model model) {
		
		List<SanPham> listSanPham = sanPhamService.findRD();
		List<SanPham> sanphammoiList = sanPhamService.findNew();
		model.addAttribute("sanphammoiList", sanphammoiList);
		return "furniture.index";
	}
	
	@GetMapping({"cat/{cid}/{page}","cat/{cid}"})
	public String cat(@PathVariable(required = false, name ="page") Integer page,@PathVariable int cid,Model model) {
		if (page == null) {
			page = 1;
		}
		int offset = PaginationUtil.getOffsetCat(page);
		List<SanPham> listSanPham = sanPhamService.find_by_cat(offset, GlobalsConstant.LIMIT_PAGE_CAT,cid);
		
		int totalRow = sanPhamService.find_by_cat_All(cid).size();
		int totalPage = (int) Math.ceil((float) totalRow / GlobalsConstant.LIMIT_PAGE_CAT);
		
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("page", page);
		model.addAttribute("sanphamList", listSanPham);
		model.addAttribute("cid", cid);
		return "furniture.cat";
		}
	
	@GetMapping({"detail","detail/{id}"})
	public String detail(Model model,@PathVariable(required = false,name = "id") Integer id) {
		SanPham sanpham = sanPhamService.findOne(id);
		model.addAttribute("sanpham", sanpham);
		return "furniture.detail";
	}
	
	
	@PostMapping("addCart")
	public @ResponseBody  String addToCart(HttpServletRequest request) {
		String productID =request.getParameter("pID");
		System.out.println(productID);
		return productID;
	}
	
	@GetMapping("login")
	public String login() {
		return "furniture.login";
	}
}

