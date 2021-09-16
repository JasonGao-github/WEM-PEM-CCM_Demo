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

	@RequestMapping(value = "/projects_page")
	public String projectListRouting() {

		return "projectList";// test.jsp
	}

	@RequestMapping(value = "/approve_page")
	public String approveRouting() {

		return "approveProjects";// test.jsp
	}

	@RequestMapping(value = "/create_project_page")
	public String createProjectRouting() {

		return "createProject";// test.jsp
	}

	@RequestMapping(value = "/project_page")
	public String projectRouting() {

		return "project";// test.jsp
	}

	@RequestMapping(value = "/ccf_page")
	public String ccfRouting() {

		return "ccf";// test.jsp
	}

	@RequestMapping(value = "/quantity_input_page")
	public String quantityInputRouting() {

		return "quantityInput";// test.jsp
	}

	@RequestMapping(value = "/ncc_page")
	public String nccRouting() {

		return "ncc";// test.jsp
	}

	@RequestMapping(value = "/fim_page")
	public String fimRouting() {

		return "fim";// test.jsp
	}

	@RequestMapping(value = "/avoided_cost_page")
	public String acRouting() {

		return "avoidedCost";// test.jsp
	}

	@RequestMapping(value = "/financials_page")
	public String finRouting() {

		return "financials";// test.jsp
	}

	@RequestMapping(value = "/design_page")
	public String designRouting() {

		return "design";// test.jsp
	}

	@RequestMapping(value = "/conHandover_page")
	public String handoverRouting() {

		return "handover";// test.jsp
	}

	@RequestMapping(value = "/lcta_page")
	public String lctaRouting() {

		return "lcta";// test.jsp
	}

	@RequestMapping(value = "/contract_schedule_page")
	public String contScheRouting() {

		return "contractSchedule";// test.jsp
	}

}
