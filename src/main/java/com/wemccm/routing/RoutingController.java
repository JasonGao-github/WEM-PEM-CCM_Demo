package com.wemccm.routing;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoutingController {
	
	@RequestMapping(value = "/addUser_page")
	public String addUserRouting() {

		return "addUser";// test.jsp
	}
	
	@RequestMapping(value = "/login_page")
	public String loginRouting() {

		return "login";// test.jsp
	}

}
