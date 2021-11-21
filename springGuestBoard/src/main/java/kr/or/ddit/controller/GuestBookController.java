package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.impl.GuestBookServiceImpl;
import kr.or.ddit.util.ConvertClobToStringUtil;
import kr.or.ddit.util.CreateCookieUtil;
import kr.or.ddit.util.UploadFileUtil;
import kr.or.ddit.vo.ProductVO;

// 테이블을 DELETE, COMMIT 했을 경우(DROP은 복구안됨)
// FLASHBACK TABLE PRODUCT TO TIMESTAMP SYSDATE - 10/24/60;

@Controller
public class GuestBookController {
	
	@Autowired
	GuestBookServiceImpl guestBookService;
	
	private static final Logger logger = LoggerFactory.getLogger(GuestBookController.class);
	
	@RequestMapping("/welcome")
	public String welcome() {
		
		logger.info("welcome");
		
		return "/guestbook/welcome";
	}
	@RequestMapping("/menu")
	public String includeMenu() {
		return "/guestbook/menu";
	}
	@RequestMapping("/footer")
	public String includeFooter() {
		return "/guestbook/footer";
	}
	
	@RequestMapping(value = "products", method = RequestMethod.GET)
	public ModelAndView menu() {
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> list = this.guestBookService.list();
		String converdata = "";
		
		for (Map<String, Object> map : list) {
			for (String key  : map.keySet()) {
				if(key.equals("P_DESCRIPTION")) {
					try {
						converdata = ConvertClobToStringUtil.convert(map.get(key));
						map.put(key, converdata);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		logger.info("menu");
		
		mav.addObject("list",list);
		mav.setViewName("/guestbook/products");
		
		return mav;
	}
	
	@RequestMapping("/addProduct")
	public String addProduct() {
		
		logger.info("addProduct");
		
		return "/guestbook/addProduct";
		
	}
	
	// 상품 상세보기
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public ModelAndView product(@RequestParam String id, ModelAndView mav) {
		Map<String, Object> map = this.guestBookService.selectOne(id);
		String converdata = "";
		for (String key  : map.keySet()) {
			if(key.equals("P_DESCRIPTION")) {
				try {
					converdata = ConvertClobToStringUtil.convert(map.get(key));
					map.put(key, converdata);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		mav.addObject("map", map);
		mav.setViewName("/guestbook/product");
		return mav;
	}
	
	// 상품 등록 처리
	@RequestMapping(value = "/processAddProduct", method = RequestMethod.POST)
	public ModelAndView processAddProduct(@RequestParam Map<String, Object> map,
			MultipartHttpServletRequest  request) {
		MultipartFile file = request.getFile("productImage");
		String filename = UploadFileUtil.uploadFile(file);
		map.put("productImage", filename);
//		for (String key  : map.keySet()) {
//			System.out.println( String.format("키 : %s, 값 : %s", key, map.get(key)) );
//		}
		this.guestBookService.insert(map);
		return menu();
	}
	
	// 상품 수정 or 삭제
	@RequestMapping(value = "/editProduct", method = RequestMethod.GET)
	public ModelAndView editProduct(@RequestParam String edit) {
		ModelAndView mav = new ModelAndView();
		
		List<Map<String, Object>> list = this.guestBookService.list();
		String converdata = "";
		
		for (Map<String, Object> map : list) {
			for (String key  : map.keySet()) {
				if(key.equals("P_DESCRIPTION")) {
					try {
						converdata = ConvertClobToStringUtil.convert(map.get(key));
						map.put(key, converdata);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		mav.addObject("list",list);
		if(edit.equals("update")) {
			mav.addObject("edit", "update");
		}else if(edit.equals("delete")) {
			mav.addObject("edit", "delete");
		}
		mav.setViewName("/guestbook/editProduct");
		return mav;
	}
	
	// 상품 수정 화면 띄우기
	@RequestMapping(value = "/updateProduct", method = RequestMethod.GET)
	public ModelAndView updateProduct(@RequestParam String id) {
		ModelAndView mav = new ModelAndView();
		String converdata = "";
		Map<String, Object> map = this.guestBookService.selectOne(id);
		for (String key  : map.keySet()) {
			if(key.equals("P_DESCRIPTION")) {
				try {
					converdata = ConvertClobToStringUtil.convert(map.get(key));
					map.put(key, converdata);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		mav.addObject("map", map);
		mav.setViewName("/guestbook/updateProduct");
		return mav;
	}
	
	// 상품 수정하기
	@RequestMapping(value = "/processUpdateProduct", method = RequestMethod.POST)
	public ModelAndView processUpdateProduct(@RequestParam Map<String, Object> map,
			ModelAndView mav,
			MultipartHttpServletRequest  request) {
		MultipartFile file = request.getFile("productImage");
		String filename = UploadFileUtil.uploadFile(file);
		map.put("productImage", filename);
		this.guestBookService.update(map);
		return menu();
	}
	
	// 상품 삭제하기
	@RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
	public ModelAndView deleteProduct(@RequestParam String id) {
		this.guestBookService.delete(id);
		return menu();
	}
	
	//상품 장바구니 추가 데이터
	@RequestMapping(value = "/addCart", method=RequestMethod.POST)
	public ModelAndView getCartlist(@RequestParam String id
			, HttpServletRequest request
			, ModelAndView mav) {
		ProductVO product = new ProductVO();
		String converdata ="";
		
		// id 값 확인
		if(id == null) {
			mav.setViewName("/guestbook/product");
			return mav;
		}
		Map<String, Object> map =this.guestBookService.selectOne(id);
		
		// 상품 데이터 유무 확인
		if(map == null) {
			mav.setViewName("/guestbook/exceptionNoProductId");
			return mav;
		}
		
		for (String key  : map.keySet()) {
			if(key.equals("P_DESCRIPTION")) {
				try {
					converdata = ConvertClobToStringUtil.convert(map.get(key));
					map.put(key, converdata);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		product.setProductId(map.get("P_ID").toString());
		product.setPname(map.get("P_NAME").toString());
		product.setUnitPrice(map.get("P_UNITPRICE").toString());
		product.setDescription(map.get("P_DESCRIPTION").toString());
		product.setCategory(map.get("P_CATEGORY").toString());
		product.setManufacturer(map.get("P_MANUFACTURER").toString());
		product.setUnitsInStock(map.get("P_UNITSINSTOCK").toString());
		product.setCondition(map.get("P_CONDITION").toString());
		product.setFilename(map.get("P_FILENAME").toString());
		
		HttpSession session = request.getSession();
		List<ProductVO> list = (List<ProductVO>)session.getAttribute("cartlist");
		if(list == null) {
			list = new ArrayList<>();
			product.setQuantity(1);
			list.add(product);
		}else {
			ProductVO goodsQnt = new ProductVO();
			boolean chk = false;
			for(int i = 0; i < list.size(); i++) {
				goodsQnt = list.get(i);
				if(goodsQnt.getProductId().equals(id)) {
					int orderQuantity = goodsQnt.getQuantity() + 1;
					goodsQnt.setQuantity(orderQuantity);
					chk = true;
				}
			}
			if(!chk) {
				product.setQuantity(1);
				list.add(product);
			}
		}
		session.setAttribute("cartlist", list);
		mav.addObject("session", session);
		mav.addObject("id", id);
		mav.setViewName("/guestbook/cart");
		return mav;
	}
	
	//장바구니
	@RequestMapping("/cart")
	public ModelAndView cart(@RequestParam String cartId, HttpServletRequest request, ModelAndView mav) {
		mav.addObject("id", cartId);
		mav.setViewName("/guestbook/cart");
		return mav;
	}
	
	@RequestMapping("/deleteCart")
	public String deleteCart() {
		return "/guestbook/deleteCart";
	}
	@RequestMapping("/shippingInfo")
	public ModelAndView shippingInfo(@RequestParam String cartId, ModelAndView mav) {
		mav.addObject("cartId",cartId);
		mav.setViewName("/guestbook/shippingInfo");
		return mav;
	}
	@RequestMapping("/checkOutCancelld")
	public String checkOutCancelld() {
		return "/guestbook/checkOutCancelld";
	}
	@RequestMapping("/processShippingInfo")
	public ModelAndView processShippingInfo(HttpServletRequest request,HttpServletResponse response, ModelAndView mav) {
		CreateCookieUtil.addCookie("Shipping_cartId", request.getParameter("cartId"), response);
		CreateCookieUtil.addCookie("Shipping_name", request.getParameter("name"), response);
		CreateCookieUtil.addCookie("Shipping_shippingDate", request.getParameter("shippingDate"), response);
		CreateCookieUtil.addCookie("Shipping_country", request.getParameter("country"), response);
		CreateCookieUtil.addCookie("Shipping_zipcode", request.getParameter("zipCode"), response);
		CreateCookieUtil.addCookie("Shipping_addressName", request.getParameter("addressName"), response);
		mav.addObject("id", request.getParameter("cartId"));
		mav.addObject("response", response);
		mav.setViewName("/guestbook/orderConfirmation");
		return mav;
	}
	@RequestMapping("/orderConfirmation")
	public String orderConfirmation() {
		return "/guestbook/orderConfirmation";
	}
	@RequestMapping("/thankCustomer")
	public ModelAndView thankCustomer(@RequestParam Map<String, Object> map, ModelAndView mav) {
		mav.addObject("map", map);
		mav.setViewName("/guestbook/thankCustomer");
		return mav;
	}
	
}
