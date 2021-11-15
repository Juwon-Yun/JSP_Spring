package kr.or.teacher.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.ProductVO;
import kr.or.teacher.dao.ProductDao;
import kr.or.teacher.mapper.ProductMapper;
import kr.or.teacher.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao;
	
	@Autowired
	ProductMapper productMapper;
	
	//상품 목록
	@Override
	public List<Map<String, Object>> list() {
		return this.productMapper.list();
	}

	@Override
	public int insert(ProductVO productVo) {
		return this.productMapper.insert(productVo);
	}

	@Override
	public List<Map<String, Object>> update() {
		return this.productDao.update();
	}

	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return this.productDao.detail(map);
	}
	
	@Override
	public Map<String, Object> detail02(Map<String, Object> map){
		return this.productMapper.detail(map);
	}

	@Override
	public int goUpdate(ProductVO productVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("productId", productVo.getProductId());
		Map<String, Object> product = this.productMapper.detail(map);
		int result = 0;
		if(product.size() > 0) {
			MultipartFile [] files = productVo.getProductImage();
			String uploadFilename = "";
			for (MultipartFile multipartFile : files) {
				uploadFilename = multipartFile.getOriginalFilename();
			}
			if (uploadFilename != "") {
				productVo.setFilename(uploadFilename);
			}else {
				
			}
			result = this.productMapper.processUpdate(productVo);
		}//end if
		return result;
		
	}
}
