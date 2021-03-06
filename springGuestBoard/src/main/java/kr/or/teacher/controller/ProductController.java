package kr.or.teacher.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.ddit.util.UploadFileUtil;
import kr.or.ddit.vo.ProductVO;
import kr.or.teacher.serviceImpl.ProductServiceImpl;

@Controller
@RequestMapping("/guestbook_teacher")
public class ProductController {
	
	@Autowired
	ProductServiceImpl productServiceImpl;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value= "/welcome", method = RequestMethod.GET)
	public String welcome() {
		return "guestbook_teacher/welcome";
	}
	
	// /product/menu
	@RequestMapping("/menu")
	public String menu() {
		return "guestbook_teacher/menu";
	}
	
	// /product/footer
	@RequestMapping("/footer")
	public String footer() {
		//forwarding
		return "guestbook_teacher/footer";
	}
	
	//상품등록 폼
	// /product/addProduct
	@RequestMapping("/addProduct")
	public String addProduct() {
		return "guestbook_teacher/addProduct";
	}
	
	//상품 등록 폼으로부터 전달된 정보를 DB저장
	@RequestMapping("/addProductPost")
	public String addProductPost(@ModelAttribute ProductVO productVo, HttpServletRequest request) {
		
		logger.info("productVo => " + productVo);
		// 업로드 될 폴더 설정
		String uploadFolder = UploadFileUtil.uploadFolder;
		
		String uploadFolderPath = UploadFileUtil.getFolder();
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		
		MultipartFile[] uploadFile = productVo.getProductImage();
		
		for(MultipartFile multipartfile : uploadFile) {
			String uploadFileName = multipartfile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			productVo.setFilename(uploadFolderPath + "/" + uploadFileName);
			
			File saveFile = new File(uploadPath, uploadFileName);
			try {
				multipartfile.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		int result = this.productServiceImpl.insert(productVo);
		
		// 상품 목록 출력
		return "redirect:/guestbook_teacher/products";
	}
		
		// cos.jar가 잘 안되어서 주석처리
//		String filename = "";
//		// 웹 어플리케이션상의 절대 경로
//		String realFolder = "E:\\Java_workspace\\6.jspSpring\\springGuestBoard\\src\\main\\webapp\\resources\\images";
//		
//		String encType = "UTF-8";
//		
//		//최대 업로드될 파일의 크기 5Mb
//		int maxSize = 5 * 1024 * 1024;
//		
//		//업로드 처리(cos.jar) 패키지 사용
//		try {
//			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
//			
//			Integer price;
//			Long stock;
//			
//			if(productVo.getUnitprice().isEmpty()){
//				price = 0;
//			}else{
//				price = Integer.valueOf(productVo.getUnitprice());
//			}
//			
//			if(productVo.getUnitsinstock().isEmpty()){
//				stock = 0L;		
//			}else{
//				stock = Long.valueOf(productVo.getUnitsinstock());
//			}
//			// 파라미터 목록에서 파일 객체 인 경우....
//			Enumeration files = multi.getFileNames();
//			// 파일 객체의 이름을 가져옴
//			String fname = (String)files.nextElement();
//			// 파일 객체의 이름에 해당되는 실제 파일명을 가져옴
//			String fileName = multi.getFilesystemName(fname);
//			
//			// product vo 객체에 파일명 필드에 세팅
//			productVo.setFilename(fileName);
//			
//			// 상품 정보 입력
//			int result = this.productServiceImpl.insert(productVo);
//			
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
	
	//상품목록 리스트
	@RequestMapping("/products")
	public String products(Model model) {
		List<Map<String, Object>> list = 
				this.productServiceImpl.list();		
		
		if(list.size()>0) {
			logger.info("list : " + list.get(0).toString());
		}
		
		model.addAttribute("list", list);
		
		return "guestbook_teacher/products";
	}
	
	//상품 수정/삭제 폼
	// /product/editProduct
	@RequestMapping(value="/editProduct", method=RequestMethod.GET)
	public String editProduct(Model model,@RequestParam String edit) {
		List<Map<String, Object>> list = this.productServiceImpl.update();
		
		/*
		 	**Model, ModelMap Vs ModelAndView 차이점
			데이터만 저장한다 vs 데이터와 이동하고자 하는 View Page를 같이 저장한다
			
			**Model, ModelMap 공통점

			model.addAttribute("변수명");
			modelMap.addAttribute("변수명");
			둘 다 addAttribute를 사용함
 			Model or ModelMap에 데이터만 저장 후 View에서 사용목적

			**Model, ModelMap 차이점

			Model - 인터페이스
			ModelMap - 클래스
		 */
		model.addAttribute("edit", edit);
		model.addAttribute("list", list);
		return "guestbook_teacher/editProduct";
	}
	
	@GetMapping("/product")
	public String Product(String id, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("productId", id);
		
		Map<String, Object> resultMap = this.productServiceImpl.detail(map);
		
		model.addAttribute("result", resultMap);
		
		//forwarding
		return "guestbook_teacher/product";
	}
	
	// 상품코드에 해당되는 상품이 없을 때
	@RequestMapping("/exceptionNoProductId")
	public void exceptionNoProductId() {
		logger.info("exceptionNoProductId");
	}
	
	// 상품 주문
	@RequestMapping(value="/addCart", method = RequestMethod.GET)
	public String addCart(String id, Model model) {
		logger.info("addCart");
		
		model.addAttribute("id", id);
		
		return "guestbook_teacher/addCart";
	}
	
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	public String addCart(String id, HttpServletRequest request) { 
		HttpSession session = request.getSession();
		
		Map<String, Object> map = new HashMap<>();
		
			if(map != null){//1행이 존재하면..
				ProductVO product = new ProductVO();
			
				product.setProductId(map.get("P_ID").toString());
				product.setPname(map.get("P_NAME").toString());
				product.setUnitPrice(map.get("P_UNITPRICE").toString()); 
				product.setDescription(map.get("P_DESCRIPTION").toString());
				product.setCategory(map.get("P_CATEGORY").toString()); 
				product.setManufacturer(map.get("P_MANUFACTURER").toString()); 
	 			product.setUnitsInStock(map.get("P_UNITSINSTOCK").toString()); 
				product.setCondition(map.get("P_CONDITION").toString()); 
				product.setFilename(map.get("P_FILENAME").toString()); 

				List<ProductVO> list 
					= (List<ProductVO>)session.getAttribute("cartlist");
				
				if(list==null){	//장바구니에 담긴 상품이 없다면..
					list = new ArrayList<ProductVO>();
					product.setQuantity(1);
					list.add(product);
					session.setAttribute("cartlist", list);
				}else{//장바구니에 상품들이 무엇인지 담겨있다면				
					ProductVO goodsQnt = new ProductVO();
					boolean chk = false;
					for(int i=0;i<list.size();i++){
						goodsQnt = list.get(i);
						if(goodsQnt.getProductId().equals(id)){
							int orderQuantity = goodsQnt.getQuantity() + 1;
							goodsQnt.setQuantity(orderQuantity);
							
							chk = true;
						}
					}
					//새로운 상품 추가
					if(chk==false){
						product.setQuantity(1);
						list.add(product);	
					}
				}
			}
		return "redirect:/guestbook_teacher/product?id="+id;
	}
	
	//장바구니
	@GetMapping("/Cart")
	public String Cart(HttpServletRequest request, Model model) {
		logger.info("Cart");
		
		HttpSession session = request.getSession();
		
		int sum = 0;
		List<ProductVO> cartList 
		= (List<ProductVO>)session.getAttribute("cartlist");
		if(cartList==null){
			cartList = new ArrayList<ProductVO>();
		}
		for(int i=0;i<cartList.size();i++){
			ProductVO product = cartList.get(i);
			int total = Integer.parseInt( product.getUnitPrice() ) * product.getQuantity();
			sum = sum + total;
		}//end for
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("sum", sum);
		
		return "guestbook_teacher/Cart";
	}
	
	// 주문하기 폼
	@RequestMapping("/shippingInfo")
	public String shippingInfo() {
		return "guestbook_teacher/shippingInfo";
	}

	@RequestMapping(value = "/processShippingInfo" , method = RequestMethod.POST)
	public String processShippingInfo(@RequestParam Map<String, Object> map, HttpServletResponse response) {
		logger.info("map => ", map);
		
		Cookie cartId = null;
		Cookie name = null;
		Cookie shippingDate = null;
		Cookie country = null;
		Cookie zipCode = null;
		Cookie addressName = null;
		
		try {
			cartId = new Cookie("Shipping_cartId", URLEncoder.encode(map.get("cartId").toString(), "UTF-8"));
			name = new Cookie("Shipping_name", URLEncoder.encode(map.get("name").toString(), "UTF-8"));
			shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(map.get("shippingDate").toString(), "UTF-8"));
			country = new Cookie("Shipping_country", URLEncoder.encode(map.get("country").toString(), "UTF-8"));
			zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(map.get("zipCode").toString(), "UTF-8"));
			addressName = new Cookie("Shipping_addressName", URLEncoder.encode(map.get("addressName").toString(), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		cartId.setMaxAge(24 * 60 *60);
		name.setMaxAge(24 * 60 *60);
		zipCode.setMaxAge(24 * 60 *60);
		country.setMaxAge(24 * 60 *60);
		addressName.setMaxAge(24 * 60 *60);
		
		response.addCookie(cartId);
		response.addCookie(name);
		response.addCookie(shippingDate);
		response.addCookie(country);
		response.addCookie(zipCode);
		response.addCookie(addressName);
		
		return "redirect:/guestbook_teacher/orderConfirmation";
	}
	
	// 상품 수정
	@RequestMapping("/updateProduct")
	public String updateProduct(String id, Model model) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("productId", id);
		
		Map<String, Object> result = this.productServiceImpl.detail02(map);
		
		model.addAttribute("result", result);
		
		return "guestbook_teacher/updateProduct";
	}
	
	// 상품 수정
	@RequestMapping(value = "processUpdateProduct", method = RequestMethod.POST)
	public String processUpdateProduct(@ModelAttribute ProductVO productVo) {
		logger.info("productVo => " + productVo.toString());
		
		this.productServiceImpl.goUpdate(productVo);
		
		return "redirect:/guestbook_teacher/editProduct?edit=update";
	}
	
}// end class













