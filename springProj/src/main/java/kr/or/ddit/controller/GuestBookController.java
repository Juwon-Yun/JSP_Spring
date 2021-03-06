package kr.or.ddit.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Clob;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
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

import kr.or.ddit.service.impl.GuestBookService;
import kr.or.ddit.vo.Product;

@Controller
public class GuestBookController {
	
	@Autowired
	GuestBookService guestBookService;
	
	private static final Logger logger = LoggerFactory.getLogger(GuestBookController.class);
	
	@RequestMapping("welcome")
	public String welcome() {
		
		logger.info("welcome");
		
		return "guestbook/welcome";
	}
	@RequestMapping("/menu")
	public String includeMenu() {
		return "guestbook/menu";
	}
	@RequestMapping("/footer")
	public String includeFooter() {
		return "guestbook/footer";
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
						converdata = convert(map.get(key));
						map.put(key, converdata);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		logger.info("menu");
		
		mav.addObject("list",list);
		mav.setViewName("guestbook/products");
		
		return mav;
	}
	
	@RequestMapping("/addProduct")
	public String addProduct() {
		
		logger.info("addProduct");
		
		return "guestbook/addProduct";
		
	}
	
	// ?????? ????????????
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public ModelAndView product(@RequestParam String id, ModelAndView mav) {
		Map<String, Object> map = this.guestBookService.selectOne(id);
		String converdata = "";
		for (String key  : map.keySet()) {
			if(key.equals("P_DESCRIPTION")) {
				try {
					converdata = convert(map.get(key));
					map.put(key, converdata);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		mav.addObject("map", map);
		mav.setViewName("guestbook/product");
		return mav;
	}
	
	// ?????? ?????? ??????
	@RequestMapping(value = "/processAddProduct", method = RequestMethod.POST)
	public ModelAndView processAddProduct(@RequestParam Map<String, Object> map,
			MultipartHttpServletRequest  request) {
		MultipartFile file = request.getFile("productImage");
		String filename = uploadFile(file);
		map.put("productImage", filename);
//		for (String key  : map.keySet()) {
//			System.out.println( String.format("??? : %s, ??? : %s", key, map.get(key)) );
//		}
		this.guestBookService.insert(map);
		return menu();
	}
	
	// ?????? ?????? or ??????
	@RequestMapping(value = "/editProduct", method = RequestMethod.GET)
	public ModelAndView editProduct(@RequestParam String edit) {
		ModelAndView mav = new ModelAndView();
		
		List<Map<String, Object>> list = this.guestBookService.list();
		String converdata = "";
		
		for (Map<String, Object> map : list) {
			for (String key  : map.keySet()) {
				if(key.equals("P_DESCRIPTION")) {
					try {
						converdata = convert(map.get(key));
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
		mav.setViewName("guestbook/editProduct");
		return mav;
	}
	
	// ?????? ?????? ?????? ?????????
	@RequestMapping(value = "/updateProduct", method = RequestMethod.GET)
	public ModelAndView updateProduct(@RequestParam String id) {
		ModelAndView mav = new ModelAndView();
		String converdata = "";
		Map<String, Object> map = this.guestBookService.selectOne(id);
		for (String key  : map.keySet()) {
			if(key.equals("P_DESCRIPTION")) {
				try {
					converdata = convert(map.get(key));
					map.put(key, converdata);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		mav.addObject("map", map);
		mav.setViewName("guestbook/updateProduct");
		return mav;
	}
	
	// ?????? ????????????
	@RequestMapping(value = "/processUpdateProduct", method = RequestMethod.POST)
	public ModelAndView processUpdateProduct(@RequestParam Map<String, Object> map,
			ModelAndView mav,
			MultipartHttpServletRequest  request) {
		MultipartFile file = request.getFile("productImage");
		String filename = uploadFile(file);
		map.put("productImage", filename);
		this.guestBookService.update(map);
		return menu();
	}
	
	// ?????? ????????????
	@RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
	public ModelAndView deleteProduct(@RequestParam String id) {
		this.guestBookService.delete(id);
		return menu();
	}
	
	//?????? ???????????? ?????? ?????????
	@RequestMapping(value = "/addCart", method=RequestMethod.POST)
	public ModelAndView getCartlist(@RequestParam String id, HttpServletRequest request, ModelAndView mav) {
		if(id == null) {
			mav.setViewName("guestbook/product");
			return mav;
		}
		Product product = new Product();
		String converdata ="";
		Map<String, Object> map =this.guestBookService.selectOne(id);
		if(map == null) {
			mav.setViewName("guestbook/exceptionNoProductId");
			return mav;
		}
		
		for (String key  : map.keySet()) {
			if(key.equals("P_DESCRIPTION")) {
				try {
					converdata = convert(map.get(key));
					map.put(key, converdata);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		product.setProductId(map.get("P_ID").toString());
		product.setPname(map.get("P_NAME").toString());
		product.setUnitprice(map.get("P_UNITPRICE").toString());
		product.setDescription(map.get("P_DESCRIPTION").toString());
		product.setCategory(map.get("P_CATEGORY").toString());
		product.setManufacturer(map.get("P_MANUFACTURER").toString());
		product.setUnitsinstock(map.get("P_UNITSINSTOCK").toString());
		product.setCondition(map.get("P_CONDITION").toString());
		product.setFilename(map.get("P_FILENAME").toString());
		
		HttpSession session = request.getSession();
		List<Product> list = (List<Product>)session.getAttribute("cartlist");
		if(list == null) {
			list = new ArrayList<>();
			product.setQuantity(1);
			list.add(product);
		}else {
			Product goodsQnt = new Product();
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
		mav.setViewName("guestbook/cart");
		return mav;
	}
	
	//????????????
	@RequestMapping("/cart")
	public ModelAndView cart(@RequestParam String id, HttpServletRequest request, ModelAndView mav) {
		mav.addObject("id", id);
		mav.setViewName("guestbook/cart");
		return mav;
	}
	
	@RequestMapping("/deleteCart")
	public String deleteCart() {
		return "guestbook/deleteCart";
	}
	@RequestMapping("/shippingInfo")
	public ModelAndView shippingInfo(@RequestParam String cartId, ModelAndView mav) {
		mav.addObject("cartId",cartId);
		mav.setViewName("guestbook/shippingInfo");
		return mav;
	}
	@RequestMapping("/checkOutCancelld")
	public String checkOutCancelld() {
		return "guestbook/checkOutCancelld";
	}
	@RequestMapping("/processShippingInfo")
	public ModelAndView processShippingInfo(HttpServletRequest request,HttpServletResponse response, ModelAndView mav) {
		addCookie("Shipping_cartId", request.getParameter("cartId"), response);
		addCookie("Shipping_name", request.getParameter("name"), response);
		addCookie("Shipping_shippingDate", request.getParameter("shippingDate"), response);
		addCookie("Shipping_country", request.getParameter("country"), response);
		addCookie("Shipping_zipcode", request.getParameter("zipCode"), response);
		addCookie("Shipping_addressName", request.getParameter("addressName"), response);
		mav.addObject("id", request.getParameter("cartId"));
		mav.addObject("response", response);
		mav.setViewName("guestbook/orderConfirmation");
		return mav;
	}
	@RequestMapping("/orderConfirmation")
	public String orderConfirmation() {
		return "guestbook/orderConfirmation";
	}
	@RequestMapping("/thankCustomer")
	public ModelAndView thankCustomer(@RequestParam Map<String, Object> map, ModelAndView mav) {
		mav.addObject("map", map);
		mav.setViewName("guestbook/thankCustomer");
		return mav;
	}
	
	
	public String convert(Object targetData) throws Exception{
		StringBuffer buffer = new StringBuffer();
		BufferedReader reader = new BufferedReader(((Clob)targetData).getCharacterStream());
		String dummy = "";
		while((dummy = reader.readLine()) != null){
			buffer.append(dummy);
		}
		reader.close();
		return buffer.toString();
	}
	
	public String uploadFile(MultipartFile file) {
		String path = "E:\\Java_workspace\\6.jspSpring\\springProj\\src\\main\\webapp\\resources\\images";
		String fileName = file.getOriginalFilename();
		File target = new File(path, fileName);
		
		if ( ! new File(path).exists()) {
            new File(path).mkdirs();
        }
		
		if(target.exists()) {
			UUID uuid = UUID.randomUUID();
			fileName = uuid.toString() + fileName ;
			File target2 = new File(path, fileName);
			//????????? ??????????????? ??????
			try {file.transferTo(target2);} catch(Exception e) {e.printStackTrace();}    
		}else {
			//????????? ????????? ??????
			try {file.transferTo(target);} catch(Exception e) {e.printStackTrace();}    
		}
		
        return fileName;
	}
	
	public void addCookie(String cookieName, String value, HttpServletResponse resp) {
		try {
			value = URLEncoder.encode(value, "utf-8").replaceAll("\\+", "%20");
		} catch (UnsupportedEncodingException e) {}
		
		resp.addCookie(new Cookie(cookieName,value));
		new Cookie(cookieName,value).setMaxAge(24 * 60 * 60);
	}
	
}
