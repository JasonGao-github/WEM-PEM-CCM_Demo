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
    <link rel="stylesheet" href="<%=path%>static/css/viewProject.css"/>
</head>

<body ng-app="main_app" id="main" ng-controller="controller">
<%@ include file="common/sidebar.jspf" %>
<section class="home_section">
    <div class="container-fluid contentWrapper" ng-init="get_all_projects()">
        <div class="container content">
           <h3 style="margin: 1vh;">View all projects</h3>
        <nav>
          <div>
            <span class="Jemena-WBS">
              Jemena WBS
            </span>
            <input  class="try" type="text" ng-model="jemenaWBS">
            <span class="Jemena-WBS">
              Project Title
            </span>
            <input class="try" type="text" ng-model="projectTitle">
            <span class="Jemena-WBS">
              Project Type
            </span>
            <select class="form-select form-select-sm" aria-label=".form-select-sm " ng-model="projectTypeId">
              <option ng-repeat="type in project_types" value="{{type.id}}">{{type.name}}</option>
            </select>
          </div>
          <div>
            <span class="Jemena-WBS">
              Zinfra WBS
            </span>
            <input class="try" type="text" ng-model="zinfraWBS">
            <span class="Jemena-WBS">
              Inquiry Number
            </span>
            <input class="try" type="text" ng-model="inquiryNumber">
            <span class="Jemena-WBS">
              Jemena SAP PM Order
            </span>
            <input class="try" type="text" ng-model="jemenaSapPmOrder">
          </div>
        </nav>
        <div>
          <button class="search" ng-click="">Search</button>
        </div>
        <div class="test">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Inquiry Number</th>
                <th scope="col">Project Title</th>
                <th scope="col">Project Type</th>
                <th scope="col">User Created</th>
                <th scope="col">Status</th>
                <th scope="col">Jemena WBS</th>
                <th scope="col">Zinfra WBS</th>
                <th scope="col">Date</th>
                <th scope="col">Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr ng-repeat="project in project_list">
                <th scope="row">{{project.inquiryNumber}}</th>
                <td>{{project.projectTitle}}</td>
                <td>{{project_types[project.projectTypeId - 1].name}}</td>
                <td>{{project.inquiryNumber}}</td>
                <td>{{project.inquiryNumber}}</td>
                <td>{{project.inquiryNumber}}</td>
                <td>{{project.inquiryNumber}}</td>
                <td>{{project.inquiryNumber}}</td>
                <td><button class="share">View</button></td>
              </tr>
            </tbody>
          </table>
        </div>
        
        
        <nav aria-label="Page navigation">
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
       
       
       
       




        </div>
    </div>
</section>
</body>
</html>
