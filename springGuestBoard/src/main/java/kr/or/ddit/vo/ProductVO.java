package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private String productId;	//상품 아이디
	private String pname;	//상품명
	private String unitPrice;	//상품 가격
	private String description; //상품 설명
	private String category;	//제조사
	private String manufacturer;	//분류
	private String unitsInStock;	//재고 수
	private String condition;	//신상품 or 중고품 or 재생품
	private String filename;	//이미지 파일명
	//테이블 컬럼에는 없지만 필요해서 만듬
	private int quantity;	//장바구니에 담은 개수
	
	private MultipartFile[] productImage;
	
	//기본 생성자
	public ProductVO() {
		super();
	}
	
	//생성자
	public ProductVO(String productId, String pname, String unitprice) {
		super();
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitprice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(String unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public MultipartFile[] getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile[] productImage) {
		this.productImage = productImage;
	}

	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", pname=" + pname + ", unitPrice=" + unitPrice + ", description="
				+ description + ", category=" + category + ", manufacturer=" + manufacturer + ", unitsInStock="
				+ unitsInStock + ", condition=" + condition + ", filename=" + filename + ", quantity=" + quantity
				+ ", productImage=" + productImage + "]";
	}
	
}
