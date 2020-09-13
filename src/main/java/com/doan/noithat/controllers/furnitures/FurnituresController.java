package com.doan.noithat.controllers.furnitures;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doan.noithat.constants.GlobalsConstant;
import com.doan.noithat.models.Banner;
import com.doan.noithat.models.ChiTietDonHang;
import com.doan.noithat.models.DanhMucSanPham;
import com.doan.noithat.models.DonHang;
import com.doan.noithat.models.GioHang;
import com.doan.noithat.models.SanPham;
import com.doan.noithat.models.TaiKhoan;
import com.doan.noithat.models.ThongTinDatHang;
import com.doan.noithat.services.BannerService;
import com.doan.noithat.services.ChiTietDonHangService;
import com.doan.noithat.services.DanhMucSanPhamService;
import com.doan.noithat.services.DonHangService;
import com.doan.noithat.services.GioHangService;
import com.doan.noithat.services.KhachHangService;
import com.doan.noithat.services.SanPhamService;
import com.doan.noithat.services.TaiKhoanService;
import com.doan.noithat.utils.PaginationUtil;

@Controller
@RequestMapping("furniture")
public class FurnituresController {

	@Autowired
	private SanPhamService sanPhamService;

	@Autowired
	private TaiKhoanService taiKhoanService;

	@Autowired
	private DanhMucSanPhamService danhMucSanPhamService;

	@Autowired
	private BCryptPasswordEncoder mahoa;

	@Autowired
	private GioHangService gioHangService;

	@Autowired
	private KhachHangService khachHangService;

	@Autowired
	private DonHangService donHangService;

	@Autowired
	private ChiTietDonHangService chiTietDonHangService;
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private BannerService bannerService;
	
	@ModelAttribute
	public void addCatList(Model model) {
		List<DanhMucSanPham> listDanhMuc = danhMucSanPhamService.findAll();
		model.addAttribute("listDanhMuc", listDanhMuc);
	}

	@GetMapping("index")
	public String index(Model model, Principal principal, HttpSession session) {
		String username = "";
		try {
			username = principal.getName();
			System.out.println(username);
		} catch (Exception e) {
			username = "";
		}
		if (!"".equals(username)) {
			TaiKhoan taiKhoan = taiKhoanService.findByUsername(username);
			session.setAttribute("taikhoan", taiKhoan);
			int size = 0;
			for (GioHang item : gioHangService.findAll(taiKhoan.getId())) {
				size = size + item.getSoluong();

			}
			model.addAttribute("sizeCart", size);
			model.addAttribute("cartList", gioHangService.findAll(taiKhoan.getId()));
		}
		List<Banner> bannerList = bannerService.findAll();
		
		List<SanPham> listSanPham = sanPhamService.findRD();
		List<SanPham> sanphammoiList = sanPhamService.findNew();
		List<SanPham> listKhuyenMai =sanPhamService.findDiscount();
		model.addAttribute("sanphammoiList", sanphammoiList);
		model.addAttribute("listKhuyenMai", listKhuyenMai);
		model.addAttribute("bannerList", bannerList);
		return "furniture.index";
	}

	@GetMapping({ "cat/{cid}/{page}", "cat/{cid}" })
	public String cat(@PathVariable(required = false, name = "page") Integer page, @PathVariable int cid, Model model) {
		if (page == null) {
			page = 1;
		}
		int offset = PaginationUtil.getOffsetCat(page);
		List<SanPham> listSanPham = sanPhamService.find_by_cat(offset, GlobalsConstant.LIMIT_PAGE_CAT, cid);

		int totalRow = sanPhamService.find_by_cat_All(cid).size();
		int totalPage = (int) Math.ceil((float) totalRow / GlobalsConstant.LIMIT_PAGE_CAT);

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("page", page);
		model.addAttribute("sanphamList", listSanPham);
		model.addAttribute("cid", cid);
		return "furniture.cat";
	}

	@GetMapping({ "detail", "detail/{id}" })
	public String detail(Model model, @PathVariable(required = false, name = "id") Integer id) {
		SanPham sanpham = sanPhamService.findOne(id);
		String[] hinhanh_Mota = sanpham.getHinhAnh_MoTa().split("\\|");
		for (int i = 0; i < hinhanh_Mota.length; i++) {
			System.out.println(hinhanh_Mota[i]);
		}
		model.addAttribute("hinhanh_Mota", hinhanh_Mota);
		model.addAttribute("sanpham", sanpham);
		return "furniture.detail";
	}

	@PostMapping("addCart")
	public @ResponseBody String addToCart(HttpServletRequest request) {
		String productID = request.getParameter("pID");
		System.out.println(productID);
		return productID;
	}

	@GetMapping("login")
	public String login() {
		System.out.println(mahoa.encode("123456"));
		System.out.println(mahoa.encode("Maiyeu97"));
		return "furniture.login";
	}
	
	@GetMapping("signup")
	public String signup() {
		return "furniture.signup";
	}
	
	@PostMapping("signup")
	public String siguppost(@RequestParam("username") String username,@RequestParam("hoten") String hoten,@RequestParam("matkhau") String matkhau,@RequestParam("email") String email,@RequestParam("phone") String phone,RedirectAttributes rd){
		
		TaiKhoan taiKhoan = new TaiKhoan(0, username, hoten, mahoa.encode(matkhau), email, phone, "4");
		TaiKhoan checkTrung = taiKhoanService.findByUsername(username);
		if(checkTrung!=null) {
			rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("doublecat", null, Locale.getDefault()));
			return "furniture.signup";
		} else {
			int addUser = taiKhoanService.add_user(taiKhoan);
			if(addUser>0) {
				rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("success", null, Locale.getDefault()));
				return "furniture.login";
			} else {
				rd.addFlashAttribute(GlobalsConstant.MSG, messageSource.getMessage("error", null, Locale.getDefault()));
				return "furniture.signup";
			
		}
		}}

	/*
	 * @PostMapping("login") public String login(@RequestParam("username") String
	 * username,@RequestParam("password") String password) { String pass =
	 * StringUtil.md5(password); KhachHang khachhang =
	 * khachHangService.login(username, pass); if(khachhang !=null) { return
	 * "furniture.index"; } else { return "furniture.login"; } }
	 */
	@RequestMapping("/getCurrentUser")
	public @ResponseBody void getCurrentUser(Principal principal) {

		String username = principal.getName();
		System.out.println(username);
	}

	@PostMapping("/cartAjax")
	public @ResponseBody String addToCart(@RequestParam("id_sanpham") int id_sanpham,
			@RequestParam("ten_sanPham") String ten_sanPham, @RequestParam("soluong") int soluong,
			@RequestParam("hinhanh") String hinhanh, @RequestParam("id_user") int id_user, Model model) {
		GioHang gioHang = new GioHang(0, new SanPham(id_sanpham, ""), soluong, id_user, 0);
		if (gioHangService.checkExist(id_sanpham) != null) {
			gioHangService.add_to_cart_exist(id_sanpham, soluong);
		} else {
			int add_to_cart = gioHangService.add_to_cart(gioHang);
		}
		List<GioHang> gioHangList = gioHangService.findAll(id_user);
		System.out.println(gioHangList.size());
		int size = 0;
		for (GioHang item : gioHangService.findAll(id_user)) {
			size = size + item.getSoluong();

		}
		model.addAttribute("cartList", gioHangService.findAll(id_user));
		return Integer.toString(size);
	}

	@ModelAttribute
	public void sizeCart(Model model, HttpSession session) {
		if (session.getAttribute("taikhoan") != null) {
			TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute("taikhoan");
			int size = 0;
			for (GioHang item : gioHangService.findAll(taiKhoan.getId())) {
				size = size + item.getSoluong();

			}
			model.addAttribute("sizeCart", size);
		} else {
			model.addAttribute("sizeCart", 0);
		}
	}

	@ModelAttribute
	public void dropCart(Model model, HttpSession session) {
		if (session.getAttribute("taikhoan") != null) {
			TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute("taikhoan");
			model.addAttribute("cartList", gioHangService.findAll(taiKhoan.getId()));
		}

	}

	@GetMapping("/cart")
	public String cart(HttpSession session, Model model) {
		TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("taikhoan");
		List<GioHang> gioHangList = gioHangService.findAll(taikhoan.getId());
		model.addAttribute("gioHangList", gioHangList);
		return "furniture.cart";
	}

	@GetMapping("/cart/del")
	public @ResponseBody String del_cart_item(HttpSession session, @RequestParam("id_item_cart") int id_item,
			Model model) {

		/*
		 * if(gioHangService.checkExist(id_sanpham)!=null) {
		 * gioHangService.add_to_cart_exist(id_sanpham, soluong); } else { int
		 * add_to_cart = gioHangService.add_to_cart(gioHang); }
		 */
		int delItem = gioHangService.del_Item(id_item);
		if (delItem > 0) {
			TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("taikhoan");
			System.out.println("id item" + id_item);
			List<GioHang> gioHangList = gioHangService.findAll(taikhoan.getId());
			System.out.println(gioHangList.size());
			int size = 0;
			for (GioHang item : gioHangService.findAll(taikhoan.getId())) {
				size = size + item.getSoluong();

			}
			return Integer.toString(size);
		} else {
			return "";
		}

	}

	@PostMapping("/cart/update")
	public @ResponseBody String update_cart_item(HttpSession session, @RequestParam("id_item_cart") int id_item,
			@RequestParam("soluong") int soluong, Model model) {
		System.out.println("soluong" + soluong);
		System.out.println(id_item);

		int update = gioHangService.update_quanlity(id_item, soluong);
		if (update > 0) {
			TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("taikhoan");
			System.out.println("id item" + id_item);
			List<GioHang> gioHangList = gioHangService.findAll(taikhoan.getId());
			System.out.println(gioHangList.size());
			int size = 0;
			for (GioHang item : gioHangService.findAll(taikhoan.getId())) {
				size = size + item.getSoluong();

			}
			return Integer.toString(size);
		} else {
			return "";
		}

	}

	@GetMapping("invoice")
	public String invoice() {
		return "furniture.invoice";
	}

	@PostMapping("order")
	public String process(@ModelAttribute("thongTinDatHang") ThongTinDatHang thongTinDatHang, HttpSession session,
			Model model) {
		System.out.println(thongTinDatHang.getHoTen());
		TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute("taikhoan");
		List<GioHang> gioHangList = gioHangService.findAll(taiKhoan.getId());
		model.addAttribute("gioHangList", gioHangList);
		model.addAttribute("thongTinDatHang", thongTinDatHang);
		return "furniture.invoice";
	}

	public int num = 1;

	@PostMapping("invoice")
	public String invoice(@ModelAttribute("thongTinDatHang") ThongTinDatHang thongTinDatHang,
			@RequestParam("paymentMethod") int hinhthuc_tt, HttpSession session) {
		System.out.println(thongTinDatHang.getHoTen());
		System.out.println(hinhthuc_tt);
		System.out.println(thongTinDatHang.getSdt());
		TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("taikhoan");
		List<GioHang> gioHangs = gioHangService.findAll(taikhoan.getId());
		BigDecimal tongtien =new BigDecimal(0);
		int tongdon=0;
		for(GioHang gioHang:gioHangs) {
			tongtien = (gioHang.getSanPham().getGiaGoc().subtract(gioHang.getSanPham().getGiaKhuyenMai()).multiply(BigDecimal.valueOf(gioHang.getSoluong())));
			tongdon=tongdon+tongtien.intValue();
		}
		int id_donhang = java.time.LocalDate.now().getYear() * 10 + num;
		System.out.println("id" + id_donhang);
		if(hinhthuc_tt==3) {
			int order = donHangService.add_order(taikhoan, thongTinDatHang, tongdon, hinhthuc_tt, id_donhang);
			return "redirect:/pay?price="+tongtien;
		}
		if (hinhthuc_tt != 3) {
			int order = donHangService.add_order(taikhoan, thongTinDatHang, tongdon, hinhthuc_tt, id_donhang);

			if (order > 0) {
				for (GioHang item : gioHangs) {
					int add_chitiet_donhang = chiTietDonHangService.add(taikhoan, item, item.getSoluong(), id_donhang, 1);
					int del_from_cart = gioHangService.del_Item(item.getGiohang_id());
					int edit_quanlity = sanPhamService.update_quanlity(item.getSanPham().getId(), item.getSoluong());
				}

			}
		}
		num++;
		return "redirect:purchase";
	}
	
	@GetMapping("pay-success")
	public String paysuccess(@ModelAttribute("thongTinDatHang") ThongTinDatHang thongTinDatHang,
			@RequestParam("paymentMethod") int hinhthuc_tt, HttpSession session,RedirectAttributes rd) {
		System.out.println(thongTinDatHang.getHoTen());
		System.out.println(hinhthuc_tt);
		System.out.println(thongTinDatHang.getSdt());
		TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("taikhoan");
		List<GioHang> gioHangs = gioHangService.findAll(taikhoan.getId());
		BigDecimal tongtien =new BigDecimal(0);
		int tongdon=0;
		for(GioHang gioHang:gioHangs) {
			tongtien = (gioHang.getSanPham().getGiaGoc().subtract(gioHang.getSanPham().getGiaKhuyenMai()).multiply(BigDecimal.valueOf(gioHang.getSoluong())));
			tongdon=tongdon+tongtien.intValue();
		}
		int id_donhang = java.time.LocalDate.now().getYear() * 10 + num;
		System.out.println("id" + id_donhang);
	
			int order = donHangService.add_order(taikhoan, thongTinDatHang, tongdon, hinhthuc_tt, id_donhang);

			if (order > 0) {
				for (GioHang item : gioHangs) {
					int add_chitiet_donhang = chiTietDonHangService.add(taikhoan, item, item.getSoluong(), id_donhang, 1);
					int del_from_cart = gioHangService.del_Item(item.getGiohang_id());
					int edit_quanlity = sanPhamService.update_quanlity(item.getSanPham().getId(), item.getSoluong());
				}

			
		}
		num++;
		rd.addFlashAttribute(GlobalsConstant.MSG,
				messageSource.getMessage("success", null, Locale.getDefault()));
		return "redirect:purchase";
	}

	@GetMapping("purchase")
	public String order(HttpSession session,Model model) {
		TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("taikhoan");
		List<DonHang> donHangUser = donHangService.find_By_User(taikhoan);
		List<ChiTietDonHang> ctList=new ArrayList<ChiTietDonHang>();
		for(DonHang donhang:donHangUser) {
			List<ChiTietDonHang> list = chiTietDonHangService.findAllByOrder(donhang.getId());
			ctList.addAll(list);
		}
		System.out.println(ctList.size());
		model.addAttribute("donHangUser", donHangUser);
		model.addAttribute("ctList", ctList);
		return "furniture.order";
	}

}
