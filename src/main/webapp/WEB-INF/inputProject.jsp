<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ include file="common/checkSessionExist.jspf"%>


<!DOCTYPE html>

<head>
<%@ include file="common/meta.jspf"%>
<link rel="stylesheet" href="<%=path%>static/css/CCF.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>
<script type="text/javascript"
	src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
</head>



<body ng-app="main_app" id="main" ng-controller="controller" ng-init="conn_handover_getData()">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content" id="content">
				<div class="row">
					<div class="col-12">
						<ul class="nav nav-pills"
							style="padding: 10px; border: 1px solid rgba(0,0,0,.125);border-radius: 15px;">
							<li class="nav-item">
								<a class="nav-link" href="project_page">Project Home</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="ccf_page">Customer Contribution</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="quantity_input_page">Quantity Input</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="ncc_page">Non-contestable Costs Input</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="fim_page">FIM Input</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="avoided_cost_page">Avoided Costs Input</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="financials_page">Financials</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="design_page">Design</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="conHandover_page">Connection Handover</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="contract_schedule_page">Contract Schedule</a>
							</li>
							<li class="nav-item">
								<a class="nav-link active" href="input_project_page">Inputs | Projects</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">Approvers</a>
							</li>
						</ul>
					</div>
				</div>
				
				<nav>
          <div class="title">
            Input Project
          </div>
        </nav>

        <div>
          <span class="item">Project Number</span>
          <input class="testing" type="text" placeholder="Type">
        </div>
        <div>
          <span class="item">Project Name</span>
          <input class="testing" type="text" placeholder="Type">
        </div>
        <div>
          <span class="item">Supply Address</span>
          <input class="testing" type="text" placeholder="Type">
        </div>
        <div>
          <span class="item">Show Contestable / Non Contestable Breakdown</span>
          <select name="group" id="group">
            <option value=""></option>
            <option value="No">No</option>
            <option value="Yes">Yes</option>
          </select>
        </div>
        <form class="form container" name="newUser" action="" method="POST" style="justify-content: center">

          <div class="basic">

            <div class="row">
              <h4 class="col-lg-4">Capex Breakdown by Cost Component</h4>
              <h6 class="col-lg-1">Total</h6>
              <h6 class="col-lg-1">Non-Contestable</h6>
              <h6 class="col-lg-1">Contestable</h6>
              <h6 class="col-lg-1">Reviewer Flags</h6>
            </div>

            <div class="row">
              <h4 class="col-lg-4">Connection Assets</h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              
            </div>

            <div class="light">
              <div class="row">
                <h4 class="col-lg-4">Design and Estimation costs</h4>
                <h4 class="col-lg-1"></h4>
                <h4 class="col-lg-1"></h4>
                <h4 class="col-lg-1"></h4>
                <h4 class="col-lg-1"></h4>
                
              </div>
            </div>


            <div class="row">
              <h4 class="col-lg-4">Tendering Costs</h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
             
            </div>

            <div class="light">
              <div class="row">
                <h6 class="col-lg-4">Contractor Management and Administration Costs</h6>
                <h6 class="col-lg-1"></h6>
                <h6 class="col-lg-1"></h6>
                <h6 class="col-lg-1"></h6>
                <h6 class="col-lg-1"></h6>
                
              </div>
            </div>



            <div class="row">
              <h4 class="col-lg-4">POther Project Costs</h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              
            </div>

            <div class="light">
              <div class="row">
                <h4 class="col-lg-4">Connection costs above Least Cost Technically Acceptable option</h4>
                <h4 class="col-lg-1"></h4>
                <h4 class="col-lg-1"></h4>
                <h4 class="col-lg-1"></h4>
                <h4 class="col-lg-1"></h4>
                
              </div>
            </div>



            <div class="row">
              <h4 class="col-lg-4">Customer initiated undergrounding and/or rearrangement of distribution</h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              
            </div>


            <div class="light">
              <div class="row">
                <h4 class="col-lg-4">Total Project Cost (as per PAS)</h4>
                <h4 class="col-lg-1"></h4>
                <h4 class="col-lg-1"></h4>
                <h4 class="col-lg-1"></h4>
                <h4 class="col-lg-1"></h4>
                
              </div>
            </div>



            <div class="row">
              <h4 class="col-lg-4">Pioneer Scheme charges (if applicable)</h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              
            </div>


            <div class="light">
              <div class="row">
                <h4 class="col-lg-4">Customer initated undergrounding/relocation of distribution assets</h4>
                <h4 class="col-lg-1"></h4>
                <h4 class="col-lg-1"></h4>
                <h4 class="col-lg-1"></h4>
                <h4 class="col-lg-1"></h4>
                
              </div>
            </div>



            <div class="row">
              <h4 class="col-lg-4">Less Application Fee / Pre Payment already paid (including GST)</h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              <h4 class="col-lg-1"></h4>
              
            </div>

            



            

          
          </div>


          <div>
            <ul class="pagination">
              <li><a href="#">«</a></li>
              <li><a class="active" href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#">6</a></li>
              <li><a href="#">7</a></li>
              <li><a href="#">»</a></li>
            </ul>
          </div>


          <div>
            <button class="savebtn">
              Submit
            </button>
          </div>

        </form>

			</div>
		</div>
	</section>
</body>
</html>
