package kr.or.ddit.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CreateCookieUtil {
	public static void addCookie(String cookieName, String value, HttpServletResponse resp) {
		try {
			value = URLEncoder.encode(value, "utf-8").replaceAll("\\+", "%20");
		} catch (UnsupportedEncodingException e) {}
		
		resp.addCookie(new Cookie(cookieName,value));
		new Cookie(cookieName,value).setMaxAge(24 * 60 * 60);
	}
}
