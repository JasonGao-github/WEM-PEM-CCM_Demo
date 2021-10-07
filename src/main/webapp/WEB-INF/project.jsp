<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ include file="common/checkSessionExist.jspf" %>

<!DOCTYPE html>

<head>
    <%@ include file="common/meta.jspf" %>
</head>

<body ng-app="main_app" id="main" ng-controller="controller">
<%@ include file="common/sidebar.jspf" %>
<section class="home_section">
    <div class="container-fluid contentWrapper">
        <div class="container content">
            <h1>Project Home</h1>
            <%--            <h3 id="TestH3"><%=userEmail%>--%>
            </h3>
            <%
                String[] pages = new String[]{"create_project_page", " ccf_page",
                        "quantity_input_page", "ncc_page", "fim_page",
                        "avoided_cost_page", "financials_page",
                        "design_page", "conHandover_page", "contract_schedule_page"};
                String[] titles = new String[]{"", "Customer Contribution",
                        "Quantity Input", "Non-contestable Cost Input", "FIM Input",
                        "Avoided Cost Input", "Financials",
                        "Design", "Connection Handover", "Contract Schedule"};
                for (int i = 1; i < pages.length; i++) {
            %>
            <h3><a href="<%= pages[i] %>"><%= titles[i] %>
            </a></h3>
            <% } %>
        </div>
    </div>
</section>

</body>
</html>
