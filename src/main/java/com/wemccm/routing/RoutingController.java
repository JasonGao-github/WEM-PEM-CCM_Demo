package com.wemccm.routing;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoutingController {

	@RequestMapping(value = "/login")
	public String routing() {

		return "login";// test.jsp
	}

}
