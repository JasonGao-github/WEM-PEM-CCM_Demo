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
    <link rel="stylesheet" href="<%=path%>static/css/addUser.css"/>
</head>

<body ng-app="main_app" id="main" ng-controller="controller">
<%@ include file="common/sidebar.jspf" %>
<section class="home_section">
    <div class="container-fluid contentWrapper">
        <div class="container content">
            <h1 style="margin: 2vh;">Quantity Input - Basic Data</h1>
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="card shadow mt-5 mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Quantity Input - Add Basic Data</h6>
                            <div class="dropdown no-arrow">
                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                </a>
                            </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <form>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="quantityInputItermGroupBasicData">Item Group</label>
                                            <select class="form-control" id="quantityInputItermGroupBasicData"
                                                    ng-model="quantityInputItemGroupIdBasicData">
                                                <option value="1">66kV Construction</option>
                                                <option value="2">HV Construction</option>
                                                <option value="3">LV Construction</option>
                                                <option value="4">HV line Switches, Isolation</option>
                                                <option value="5">Sub Assemblies</option>
                                                <option value="6">String Bare Conductor</option>
                                                <option value="7">String Insulated Conductors</option>
                                                <option value="8">Advanced Metering Infrastructure</option>
                                                <option value="9">Pole Substation Structure</option>
                                                <option value="10">Overhead Servicing</option>
                                                <option value="11">HV Cable Head Poles</option>
                                                <option value="12">StreetLighting,Major Road</option>
                                                <option value="13">StreetLighting,Minor Road</option>
                                                <option value="14">Lanterns, Globes, PE Cells</option>
                                                <option value="15">Underground Cable Construction - HV Termination &
                                                    Joints
                                                </option>
                                                <option value="16">Underground Cable Construction - LV Termination &
                                                    Joints
                                                </option>
                                                <option value="17">Underground Cable Only</option>
                                                <option value="18">Cable Installation</option>
                                                <option value="19">Cable Testing</option>
                                                <option value="20">Civil Reinstatements and miscellaneous</option>
                                                <option value="45">Underground Servicing</option>
                                                <option value="21">Indoor Substations</option>
                                                <option value="22">Indoor HV Switchgear</option>
                                                <option value="23">Install HV Switching Station</option>
                                                <option value="25">Install Transformer Cable Entry</option>
                                                <option value="24">Install Transformer Kiosk</option>
                                                <option value="26">Earthing, Pole HV Structure</option>
                                                <option value="27">Earthing, Kiosk Padmount Substation</option>
                                                <option value="28">Earthing, HV Switching Station</option>
                                                <option value="29">Earthing, Installation Methods</option>
                                                <option value="30">Design & Project Management Services - Standard
                                                    Projects
                                                </option>
                                                <option value="31">Minor - minimum charging activity for simplest scope
                                                    (supply available, offer letter only)
                                                </option>
                                                <option value="32">Type A - include new Pit, RW single LV pole
                                                    relocations, minor P/L, Line of mains (supply available, offer
                                                    letter only)
                                                </option>
                                                <option value="33">Type B - LV Underground project, OH or UG substation
                                                    upgrade with minor line works, Medium RW HV/LV relocations
                                                </option>
                                                <option value="34">Type C - URD project , New OH or UG substation, Large
                                                    RW HV/LV relocations
                                                </option>
                                                <option value="35">Type D - Project with combined OH and UG activities,
                                                    Industrial U/G Subdivisions with a substation, New Indoor
                                                    Substation, Complex RW projects
                                                </option>
                                                <option value="36">Major - project requiring customised number of hours
                                                    (single Hourly rate)
                                                </option>
                                                <option value="37">Other Design Services</option>
                                                <option value="38">Operating</option>
                                                <option value="39">Retirements</option>
                                                <option value="40">Additional Labour - Excludes plant</option>
                                                <option value="41">Additional Plant</option>
                                                <option value="42">Extra Overtime cost (for itemised activities)
                                                </option>
                                                <option value="43">Plant & Equipment</option>
                                                <option value="44">Subcontracts</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="quantityInputItemCodeBasicData">Item Code</label>
                                            <input id="quantityInputItemCodeBasicData"
                                                   ng-model="quantity_input_item_code_basic_data"
                                                   type="text"
                                                   class="form-control"
                                                   placeholder="Enter item code"/>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="userNewPasswordConfirm">Item Description</label>
                                            <input id="userNewPasswordConfirm"
                                                   ng-model="quantity_input_item_description_basic_data"
                                                   type="text"
                                                   class="form-control"
                                                   placeholder="Enter item description"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="quantityInputItemUnitBasicData">Item Unit</label>
                                            <select class="form-control" id="quantityInputItemUnitBasicData"
                                                    ng-model="quantity_input_item_unit_basic_data">
                                                <option value="Pole">Pole</option>
                                                <option value="Each">Each</option>
                                                <option value="Set">Set</option>
                                                <option value="Span">Span</option>
                                                <option value="per M">per M</option>
                                                <option value="Service">Service</option>
                                                <option value="Metre">Metre</option>
                                                <option value="Length">Length</option>
                                                <option value="m3">m3</option>
                                                <option value="m2">m2</option>
                                                <option value="Test">Test</option>
                                                <option value="Per LM">Per LM</option>
                                                <option value="Per project">Per project</option>
                                                <option value="Hour">Hour</option>
                                                <option value="Substation">Substation</option>
                                                <option value="Quote">Quote</option>
                                                <option value="Earth">Earth</option>
                                                <option value="Drawing">Drawing</option>
                                                <option value="Day">Day</option>
                                                <option value="Dollars">Dollars</option>
                                                <option value="Planned Outage">Planned Outage</option>
                                                <option value="per litre">per litre</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="quantityInputItemLabourBasicData">Labour Cost</label>
                                            <input id="quantityInputItemLabourBasicData"
                                                   ng-model="quantity_input_item_labour_basic_data"
                                                   type="text"
                                                   class="form-control"
                                                   placeholder="Enter labour cost"/>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="quantityInputItemMaterialBasicData">Material Cost</label>
                                            <input id="quantityInputItemMaterialBasicData"
                                                   ng-model="quantity_input_item_material_basic_data"
                                                   type="text"
                                                   class="form-control"
                                                   placeholder="Enter material cost"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="quantityInputItemPlantBasicData">Plant Cost</label>
                                            <input id="quantityInputItemPlantBasicData"
                                                   ng-model="quantity_input_item_plant_basic_data"
                                                   type="text"
                                                   class="form-control"
                                                   placeholder="Enter plant cost"/>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="quantityInputItemSubcontractBasicData">Subcontract</label>
                                            <input id="quantityInputItemSubcontractBasicData"
                                                   ng-model="quantity_input_item_subcontract_basic_data"
                                                   type="text"
                                                   class="form-control"
                                                   placeholder="Enter subcontract"/>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="quantityInputItemUnitRateBasicData">Unit Rate</label>
                                            <input id="quantityInputItemUnitRateBasicData"
                                                   ng-model="quantity_input_item_unit_rate_basic_data"
                                                   type="text"
                                                   class="form-control"
                                                   placeholder="Enter unit rate"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label for="quantityInputItemManHourBasicData">Man Hours</label>
                                            <input id="quantityInputItemManHourBasicData"
                                                   ng-model="quantity_input_item_man_hour_basic_data"
                                                   type="text"
                                                   class="form-control"
                                                   placeholder="Enter man hours"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" ng-show="quantity_input_basic_data_error">
                                    <div class="col">
                                        <h6 style="color: red">Error in data!</h6>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col">
                                        <button type="button" class="btn btn-primary"
                                                ng-click="submit_quantity_input_basic_data_item()">Submit Data
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Modal -->
<div class="modal fade" id="quantityInputBasicDataModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><b>Quantity Input Basic Data - Add Item Status</b></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h5 ng-show="quantityInputSuccess">Item added successfully!</h5>
                <h5 ng-show="quantityInputError">An error occurred!</h5>
            </div>
            <div class="modal-footer">
                <%--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<script>
    let sidebar = document.querySelector(".sidebar");
    let closeBtn = document.querySelector("#btn");

    closeBtn.addEventListener("click", () => {
        sidebar.classList.toggle("open");
        menuBtnChange();
    });

    function menuBtnChange() {
        if (sidebar.classList.contains("open")) {
            closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");
            document.getElementById("Jem-logo").style.visibility = "visible";
        } else {
            closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");
            document.getElementById("Jem-logo").style.visibility = "hidden";
        }
    }
</script>
</body>
</html>
