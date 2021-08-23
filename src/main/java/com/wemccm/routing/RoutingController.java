package com.wemccm.routing;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RoutingController {

	@RequestMapping(value = "/login")
	public String routing() {

		return "login";// test.jsp
	}

}
