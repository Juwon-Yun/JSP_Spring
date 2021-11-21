package kr.or.ddit.util.controller;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.util.service.UtilService;

/*
 * 	만약 JSON을 return하는 경우 
 * 
 */

@Controller
public class GoogleChartController {
	
	@Autowired
	UtilService utilService;
	
	@RequestMapping("/chart/chart02")
	public JSONObject chart02() throws Exception{
		return this.utilService.cartMoney();
	}
	
	
	
}
