package kr.or.ddit.vo;

// lombok @Data를 이용해서 자동으로 getter, setter, toString, equals 를 생성한다, 
// 기본생성자는 default니 생략
// @Getter 는 getter만 만들고, @Setter는 setter만 만든다

public class BookVo {

	private String book_id;
	private String title;
	private String category;
	private String price;
	private String insert_date;
	
	public BookVo() {};
		
	public BookVo(String book_id, String title, String category, String price, String insert_date) {
		super();
		this.book_id = book_id;
		this.title = title;
		this.category = category;
		this.price = price;
		this.insert_date = insert_date;
	}
	
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(String insert_date) {
		this.insert_date = insert_date;
	}

	@Override
	public String toString() {
		return "BookVo [book_id=" + book_id + ", title=" + title + ", category=" + category + ", price=" + price
				+ ", insert_date=" + insert_date + "]";
	}

}
