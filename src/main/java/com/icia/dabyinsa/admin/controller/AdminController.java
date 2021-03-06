package com.icia.dabyinsa.admin.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.dabyinsa.admin.dto.delivery.PaymentListDto;
import com.icia.dabyinsa.admin.dto.delivery.ShippedBeginListDto;
import com.icia.dabyinsa.admin.dto.delivery.ShippedCompleteListDto;
import com.icia.dabyinsa.admin.dto.delivery.ShippedEndListDto;
import com.icia.dabyinsa.admin.dto.delivery.ShippedStandbyListDto;
import com.icia.dabyinsa.admin.dto.order.OrderCancelDto;
import com.icia.dabyinsa.admin.dto.order.OrderChangeDto;
import com.icia.dabyinsa.admin.dto.order.OrderListDto;
import com.icia.dabyinsa.admin.dto.order.OrderRefundDto;
import com.icia.dabyinsa.admin.dto.order.OrderReturnsDto;
import com.icia.dabyinsa.admin.dto.product.prodinfoDto;
import com.icia.dabyinsa.admin.dto.product.productlistDto;
import com.icia.dabyinsa.admin.service.AdminService;
import com.icia.dabyinsa.admin.service.ButtonService;
import com.icia.dabyinsa.admin.service.GuestAdminService;
import com.icia.dabyinsa.admin.service.MemberAdminService;
import com.icia.dabyinsa.admin.service.MemberInfoService;
import com.icia.dabyinsa.user.dto.GuestDto;
import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.service.MemberService;

import lombok.extern.java.Log;

@Controller
@RequestMapping("admin")
@Log
@Secured("ROLE_ADMIN")
public class AdminController {
	
	private static final Logger LOGGER = 
			LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService as;

	@Autowired
	private MemberService ms;
	
	@Autowired
	private ButtonService bs;
	
	private ModelAndView mv;
	
	@Autowired
	private MemberAdminService mas;
	
	@Autowired
	private GuestAdminService gs;
	
	@Autowired
	private MemberInfoService mi;

	@GetMapping("/main")
	public String main(Model model, Principal p) {
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		return "admin/main";
	}

	// ??????????????????
	@GetMapping("/adorderlist")
	public String adorderlist(Model model, 
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String keyword2,
			@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String searchOption2) {
		List<OrderListDto> oList = as.getOrderList(keyword, keyword2, searchOption, searchOption2);
		int count = as.getOrderListCount(keyword, keyword2, searchOption, searchOption2);
		log.info(keyword);
		log.info(keyword2);
		log.info(searchOption);
		log.info(searchOption2);
		System.out.println(oList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchOption2", searchOption2);
		map.put("oList", oList);
		map.put("count", count);
		map.put("keyword", keyword);
		map.put("keywor2", keyword2);

		model.addAttribute("map", map);
		return "admin/order/adorderlist";
	}

	
	// ??????
	@GetMapping("/adordercancel")
	public String adordercancel(Model model,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String keyword2,
			@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String searchOption2) {
		List<OrderCancelDto> ocList = as.getOrderCList(keyword, keyword2, searchOption, searchOption2);
		int count = as.getOrderCListCount(keyword, keyword2, searchOption, searchOption2);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchOption2", searchOption2);
		map.put("ocList", ocList);
		map.put("count", count);
		map.put("keyword", keyword);
		map.put("keywor2", keyword2);

		model.addAttribute("map", map);
		return "admin/order/adordercancel";
	}

	// ??????
	@GetMapping("/adorderchange")
	public String adorderchange(Model model,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String keyword2,
			@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String searchOption2) {
		List<OrderChangeDto> ocgList = as.getOrderCGList(keyword, keyword2, searchOption, searchOption2);
		int count = as.getOrderCGListCount(keyword, keyword2, searchOption, searchOption2);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchOption2", searchOption2);
		map.put("ocgList", ocgList);
		map.put("count", count);
		map.put("keyword", keyword);
		map.put("keywor2", keyword2);

		model.addAttribute("map", map);
		return "admin/order/adorderchange";
	}

	// ??????
	@GetMapping("/adordercashrefund")
	public String adordercashrefund(Model model,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String keyword2,
			@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String searchOption2) {
		List<OrderRefundDto> orList = as.getOrderRList(keyword, keyword2, searchOption, searchOption2);
		int count = as.getOrderRListCount(keyword, keyword2, searchOption, searchOption2);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchOption2", searchOption2);
		map.put("orList", orList);
		map.put("count", count);
		map.put("keyword", keyword);
		map.put("keywor2", keyword2);

		model.addAttribute("map", map);
		return "admin/order/adordercashrefund";
	}

	// ??????
	@GetMapping("/adorderreturns")
	public String adorderreturns(Model model,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String keyword2,
			@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String searchOption2) {
		List<OrderReturnsDto> ortList = as.getOrderRTList(keyword, keyword2, searchOption, searchOption2);
		int count = as.getOrderRTListCount(keyword, keyword2, searchOption, searchOption2);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchOption2", searchOption2);
		map.put("ortList", ortList);
		map.put("count", count);
		map.put("keyword", keyword);
		map.put("keywor2", keyword2);

		model.addAttribute("map", map);
		return "admin/order/adorderreturns";
	}

	// ?????????
	@GetMapping("/adpaymentlist")
	public String adpaymentlist(Model model,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String keyword2,
			@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String searchOption2) {
		List<PaymentListDto> pList = as.getPList(keyword, keyword2, searchOption, searchOption2);
		int count = as.getPListCount(keyword, keyword2, searchOption, searchOption2);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchOption2", searchOption2);
		map.put("pList", pList);
		map.put("count", count);
		map.put("keyword", keyword);
		map.put("keywor2", keyword2);

		model.addAttribute("map", map);
		return "admin/delivery/adpaymentlist";
	}

	// ???????????????
	@GetMapping("/adshippedbeginlist")
	public String adshippedbeginlist(Model model,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String keyword2,
			@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String searchOption2) {
		List<ShippedBeginListDto> sbList = as.getSBList(keyword, keyword2, searchOption, searchOption2);
		int count = as.getSBListCount(keyword, keyword2, searchOption, searchOption2);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchOption2", searchOption2);
		map.put("sbList", sbList);
		map.put("count", count);
		map.put("keyword", keyword);
		map.put("keywor2", keyword2);

		model.addAttribute("map", map);
		return "admin/delivery/adshippedbeginlist";
	}

	// ????????????
	@GetMapping("/adshippedstandbylist")
	public String adshippedstandbylist(Model model,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String keyword2,
			@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String searchOption2) {
		List<ShippedStandbyListDto> ssList = as.getSSList(keyword, keyword2, searchOption, searchOption2);
		int count = as.getSSListCount(keyword, keyword2, searchOption, searchOption2);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchOption2", searchOption2);
		map.put("ssList", ssList);
		map.put("count", count);
		map.put("keyword", keyword);
		map.put("keywor2", keyword2);

		model.addAttribute("map", map);
		return "admin/delivery/adshippedstandbylist";
	}


	// ?????????
	@GetMapping("/adshippedendlist")
	public String adshippedendlist(Model model,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String keyword2,
			@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String searchOption2) {
		List<ShippedEndListDto> seList = as.getSEList(keyword, keyword2, searchOption, searchOption2);
		int count = as.getSEListCount(keyword, keyword2, searchOption, searchOption2);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchOption2", searchOption2);
		map.put("seList", seList);
		map.put("count", count);
		map.put("keyword", keyword);
		map.put("keywor2", keyword2);

		model.addAttribute("map", map);
		return "admin/delivery/adshippedendlist";
	}

	// ????????????
	@GetMapping("/adshippedcompletelist")
	public String adshippedcompletelist(Model model,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String keyword2,
			@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String searchOption2) {
		List<ShippedCompleteListDto> scList = as.getSCList(keyword, keyword2, searchOption, searchOption2);
		int count = as.getSCListCount(keyword, keyword2, searchOption, searchOption2);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchOption2", searchOption2);
		map.put("scList", scList);
		map.put("count", count);
		map.put("keyword", keyword);
		map.put("keywor2", keyword2);

		model.addAttribute("map", map);
		return "admin/delivery/adshippedcompletelist";
	}


	// ?????? ?????? ?????????
	@PostMapping("/setnewproduct")
	public String setNewProduct(prodinfoDto pi,
			RedirectAttributes rttr, MultipartHttpServletRequest multi) throws Exception {


		System.out.println(pi);

		String view = as.NewProduct(pi, rttr, multi);	//????????? ??????????????? ??????????????? pi??? ??? ????????? ??????
		as.fileUpload(multi, pi.getProd_id());		//?????? ????????? ?????? ??????

		//return view;
		return "admin/product/newproduct";
	}



	@GetMapping("/newproduct")
	public String newproduct() {

		return "admin/product/newproduct";
	}

	// ???????????? ?????????
	@GetMapping("/productlist")
	public String productlist(Model model,
			@RequestParam(defaultValue = "") String plkeyword,
			@RequestParam(defaultValue = "") String plkeyword2,
			@RequestParam(defaultValue = "all") String plsearchOption,
			@RequestParam(defaultValue = "") String plsearchOption2) {
		List<productlistDto> plList = as.getPLList(plkeyword, plkeyword2, plsearchOption, plsearchOption2);

		int count = as.getPLListCount(plkeyword, plkeyword2, plsearchOption, plsearchOption2);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", plsearchOption);
		map.put("plList", plList);
		map.put("count", count);
		map.put("keyword", plkeyword);
		map.put("keywor2", plkeyword2);

		model.addAttribute("map", map);
		return "admin/product/productlist";

	}
	
	//?????? ?????? ????????? ????????? ??????
//	@GetMapping("/productlist")
//	public ModelAndView SearchList(Integer pageNum) {
		//pageNum??? ???????????? ?????????
		// 1. null - url??? ?????????????????? ???????????? ?????? ???
		//			????????? ???????????? ???????????? ??????.(???????????? ??????)
		// 2. ????????? ?????? ??????.
//		LOGGER.info("productlist()");
		
		//DB?????? ???????????? ???????????? ???????????? ??????.
//		mv = as.getSearchList(pageNum);

//		return mv;
//	}


	// ???????????? ?????????
	@GetMapping("/preview")
	public String preview() {
		return "admin/product/preview";

	}

	// ?????? ???????????? ?????????
	@GetMapping("/productload")
	public String productload() {
		return "admin/product/productload";
	}
	//????????????
	@PostMapping(value = "Check",
			produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Check(String admin_prod_code) {

		//?????? ?????? ???????????? DB??? ???????????? ???????????? Dao??? ??????.
		String res = as.Check(admin_prod_code);

		return res;
	}

	//?????? ?????? ??????
	@PostMapping("/pdelete")
	public String delete(HttpServletRequest request) throws Exception{

		String[] ajaxMsg = request.getParameterValues("valueArr");
		System.out.println("ajaxMsg : " + ajaxMsg[0]);
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++ ) {
			System.out.println(ajaxMsg[i]);
			bs.filedelete(ajaxMsg[i]);
			bs.pdelete(ajaxMsg[i]);
		}
		return "redirect:productlist";		
	}

	//?????? ??????
		@GetMapping("/memberadmin")
		public String memberadmin(Model model,
				@RequestParam(defaultValue = "") String mkeyword,
				@RequestParam(defaultValue = "") String mkeyword2,
				@RequestParam(defaultValue = "all") String msearchOption,
				@RequestParam(defaultValue = "") String msearchOption2) {
				List<MemberDto> mList = mas.getMemberList(mkeyword, mkeyword2, msearchOption, msearchOption2);
				int count = mas.getMemberListCount(mkeyword, mkeyword2, msearchOption, msearchOption2);
				int scount = mas.getMemberSeachListCount(mkeyword, mkeyword2, msearchOption, msearchOption2);
				System.out.println(mkeyword);
				System.out.println(mkeyword2);
				System.out.println(msearchOption);
				System.out.println(msearchOption2);
				log.info("mList : " + mList);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("msearchOption", msearchOption);
				map.put("msearchOption2", msearchOption2);
				map.put("mList", mList);
				map.put("count", count);
				map.put("scount", scount);
				map.put("mkeyword", mkeyword);
				map.put("mkeywor2", mkeyword2);
				
				model.addAttribute("map", map);
				return "admin/member/memberadmin";
		}
		
		//?????? ?????? ??????
		@RequestMapping(value = "/delete")
		public String ajaxTest(HttpServletRequest request) {
			
			String[] ajaxMsg = request.getParameterValues("valueArr");
			int size = ajaxMsg.length;
			for(int i=0; i<size; i++) {
				mas.delete(ajaxMsg[i]);
			}
			return "redirect:/admin/memberadmin";
		}
		
		
	//?????? ??????
	@GetMapping("/guestadmin")
	public String guestadmin(Model model, 
			@RequestParam(defaultValue = "") String gkeyword,
			@RequestParam(defaultValue = "") String gkeyword2,
			@RequestParam(defaultValue = "all") String gsearchOption,
			@RequestParam(defaultValue = "") String gsearchOption2) {
			System.out.println(gkeyword);
			System.out.println(gkeyword2);
			System.out.println(gsearchOption);
			System.out.println(gsearchOption2);
			List<GuestDto> gList = gs.getGuestList(gkeyword, gkeyword2, gsearchOption, gsearchOption2);
			int count = gs.getGListCount(gkeyword, gkeyword2, gsearchOption, gsearchOption2);
			int scount = gs.getGSearchListCount(gkeyword, gkeyword2, gsearchOption, gsearchOption2);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gsearchOption", gsearchOption);
			map.put("gsearchOption2", gsearchOption2);
			map.put("gList", gList);
			map.put("count", count);
			map.put("scount", scount);
			map.put("gkeyword", gkeyword);
			map.put("gkeyword2", gkeyword2);
			
			model.addAttribute("map", map);
			return "admin/member/guestadmin";
	}
	
	//?????? ?????? ??????
	@RequestMapping(value = "/guestDelete")
	public String ajaxGTest(HttpServletRequest request) {
		log.info("ajaxGTest()");
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			gs.delete(ajaxMsg[i]);
		}
		return "redirect:/admin/guestadmin";
	}

	
	//?????? ???????????? ??????
	@RequestMapping("memberinfo")
	public String memberinfo(String m_id, Model model) {
		model.addAttribute("mList", mi.memInfo(m_id));
		System.out.println("?????? ?????? ?????? ??????");
		System.out.println(mi.memInfo(m_id));
		return "admin/member/memberinfo";	
	}
		
	
	


}

