package com.doan.noithat.controllers.furnitures;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.doan.noithat.models.GioHang;
import com.doan.noithat.models.TaiKhoan;
import com.doan.noithat.models.ThongTinDatHang;
import com.doan.noithat.services.GioHangService;
import com.doan.noithat.services.KhachHangService;

@Controller
public class OrderController {

	@Autowired
	private GioHangService gioHangService;

	@Autowired
	private KhachHangService khachHangService;

	

}