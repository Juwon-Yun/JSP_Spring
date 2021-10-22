package kr.or.ddit.chap08.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class Cookies {
	//key는 문자열, value는 Cookie형의 객체를 담는 Map을 선언
	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
	
	//생성자 : Cookies 클래스를 통해 객체를 생성 시 request객체를  전달받음
	//웹 브라우저가 tomcat 서버에 요청 시 쿠키 목록을 함께 전달함
	public Cookies(HttpServletRequest request) {
		//request 객체 안에 있는 쿠키 목록을 받음
		Cookie[] cookies = request.getCookies();
		//cookie 객체의 getName() 메소드는 cookie가 null이면 NullPointException 발생..
		if(cookies != null) {
			for(int i=0; i < cookies.length; i++) {
				//ex) name : 유제이 => {"name":cookie}
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}
	
	//ex) cookieMap.get("name") => "name : 유제이" 쿠키 객체를 리턴
	public Cookie getCookie(String name) {
		return cookieMap.get(name);
	}
	
	//쿠키 명에 저장되어 있는 값을 리턴
	public String getValue(String name) throws IOException {
		Cookie cookie = cookieMap.get(name);
		
		if(cookie == null) {
			return null;
		}
		return URLDecoder.decode(cookie.getValue(), "utf-8");
	}
	
	//해당 쿠키가 있는지 체크
	public boolean exists(String name) {
		return cookieMap.get(name) != null;
	}
	
	//쿠키 생성(+수정)
	public static Cookie createCookie(String name, String value) throws UnsupportedEncodingException {
		//값은 한글 인코딩 처리
		return new Cookie(name, URLEncoder.encode(value, "utf-8"));
	}
	
	//쿠키 생성(+삭제)
	public static Cookie createCookie(String name, String value, int maxAge) throws UnsupportedEncodingException {
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		cookie.setMaxAge(maxAge);
		
		return cookie;
	} 
}






