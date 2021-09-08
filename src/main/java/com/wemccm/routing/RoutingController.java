package com.wemccm.routing;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoutingController {

	@RequestMapping(value = "/login_page")
	public String loginRouting() {

		return "login";// test.jsp
	}

	@RequestMapping(value = "/dashboard_page")
	public String dashboardRouting() {

		return "dashboard";// test.jsp
	}

	@RequestMapping(value = "/addUser_page")
	public String addUserRouting() {

		return "addUser";// test.jsp
	}

	@RequestMapping(value = "/project_list_page")
	public String projectListRouting() {

		return "projectList";// test.jsp
	}

	@RequestMapping(value = "/create_project_page")
	public String createProjectRouting() {

		return "createProject";// test.jsp
	}

	@RequestMapping(value = "/ccf_page")
	public String ccfRouting() {

		return "ccf";// test.jsp
	}

	@RequestMapping(value = "/fim_page")
	public String fimRouting() {

		return "fim";// test.jsp
	}

	@RequestMapping(value = "/lcta_page")
	public String lctaRouting() {

		return "lcta";// test.jsp
	}

	@RequestMapping(value = "/financial_page")
	public String financialRouting() {

		return "projectList";// test.jsp
	}

}
