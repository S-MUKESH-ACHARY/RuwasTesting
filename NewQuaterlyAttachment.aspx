<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewQuaterlyAttachment.aspx.cs" Inherits="RUWAS.QuaterlyNewAttachment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("dataEntryId").classList.add("DE");
            getFinancialYr();
            loadTechnology();
            fetchLC();
            getDistrict();
            FundingSourceInformation();
        })
        function save() {
            var financialYr = $("#financialYrId").val();
            if (financialYr == "") {
                $("#financialYrId").addClass("is-invalid");
                $("#financialYrId").focus();
                return false;
            } else {
                $("#financialYrId").removeClass("is-invalid");
                $("#financialYrId").addClass("is-valid");
            }
            var workPlan = $("#workplanId").val();
            if (workPlan == "") {
                $("#workplanId").addClass("is-invalid");
                $("#workplanId").focus();
                return false;
            } else {
                $("#workplanId").removeClass("is-invalid");
                $("#workplanId").addClass("is-valid");
            }
            var localGovernment = $("#localGovernmentId").val();
            if (localGovernment == "") {
                $("#localGovernmentId").addClass("is-invalid");
                $("#localGovernmentId").focus();
                return false;
            } else {
                $("#localGovernmentId").removeClass("is-invalid");
                $("#localGovernmentId").addClass("is-valid");
            }
            var category = $("#categoryId").val();
            if (category == "") {
                $("#categoryId").addClass("is-invalid");
                $("#categoryId").focus();
                return false;
            } else {
                $("#categoryId").removeClass("is-invalid");
                $("#categoryId").addClass("is-valid");
            }
            var quarter = $("#quarterId").val();
            if (quarter == "") {
                $("#quarterId").addClass("is-invalid");
                $("#quarterId").focus();
                return false;
            } else {
                $("#quarterId").removeClass("is-invalid");
                $("#quarterId").addClass("is-valid");
            }
            var slctTechnology = $("#slctTechnologyId").val();
            if (slctTechnology == "") {
                $("#slctTechnologyId").addClass("is-invalid");
                $("#slctTechnologyId").focus();
                return false;
            } else {
                $("#slctTechnologyId").removeClass("is-invalid");
                $("#slctTechnologyId").addClass("is-valid");
            }
            var slctDistrict = $("#slctDistrictId").val();
            if (slctDistrict == "") {
                $("#slctDistrictId").addClass("is-invalid");
                $("#slctDistrictId").focus();
                return false;
            } else {
                $("#slctDistrictId").removeClass("is-invalid");
                $("#slctDistrictId").addClass("is-valid");
            }
            var county = $("#countyId").val();
            if (county == "") {
                $("#countyId").addClass("is-invalid");
                $("#countyId").focus();
                return false;
            } else {
                $("#countyId").removeClass("is-invalid");
                $("#countyId").addClass("is-valid");
            }
            var sub_County = $("#sub_CountyId").val();
            if (sub_County == "") {
                $("#sub_CountyId").addClass("is-invalid");
                $("#sub_CountyId").focus();
                return false;
            } else {
                $("#sub_CountyId").removeClass("is-invalid");
                $("#sub_CountyId").addClass("is-valid");
            }
            var SlctParish = $("#SlctParishId").val();
            if (SlctParish == "") {
                $("#SlctParishId").addClass("is-invalid");
                $("#SlctParishId").focus();
                return false;
            } else {
                $("#SlctParishId").removeClass("is-invalid");
                $("#SlctParishId").addClass("is-valid");
            }
            var SlctVillage = $("#SlctVillageId").val();
            if (SlctVillage == "") {
                $("#SlctVillageId").addClass("is-invalid");
                $("#SlctVillageId").focus();
                return false;
            } else {
                $("#SlctVillageId").removeClass("is-invalid");
                $("#SlctVillageId").addClass("is-valid");
            }
            let locationType = $("input[name='locationType']:checked").val();
            if (locationType == "UTM") {
                let UTMZone = $("#slctUTMZone").val();
                if (UTMZone == "") {
                    $("#slctUTMZone").addClass("is-invalid");
                    $("#slctUTMZone").focus();
                    return false;
                } else {
                    $("#slctUTMZone").removeClass("is-invalid");
                    $("#slctUTMZone").addClass("is-valid");
                }
                let UTMEasting = $("#txtUTMEasting").val();
                if (UTMEasting == "") {
                    $("#txtUTMEasting").addClass("is-invalid");
                    $("#txtUTMEasting").focus();
                    return false;
                } else {
                    $("#txtUTMEasting").removeClass("is-invalid");
                    $("#txtUTMEasting").addClass("is-valid");
                }
                let UTMNorthing = $("#txtUTMNorthing").val();
                if (UTMNorthing == "") {
                    $("#txtUTMNorthing").addClass("is-invalid");
                    $("#txtUTMNorthing").focus();
                    return false;
                } else {
                    $("#txtUTMNorthing").removeClass("is-invalid");
                    $("#txtUTMNorthing").addClass("is-valid");
                }

            }
            else if (locationType == "Lat/Long") {
                let Latitude = $("#txtLatitude").val();
                if (Latitude == "") {
                    $("#txtLatitude").addClass("is-invalid");
                    $("#txtLatitude").focus();
                    return false;
                } else {
                    $("#txtLatitude").removeClass("is-invalid");
                    $("#txtLatitude").addClass("is-valid");
                }
                let Longitude = $("#txtLongitude").val();
                if (Longitude == "") {
                    $("#txtLongitude").addClass("is-invalid");
                    $("#txtLongitude").focus();
                    return false;
                } else {
                    $("#txtLongitude").removeClass("is-invalid");
                    $("#txtLongitude").addClass("is-valid");
                }
            }
            else if (locationType == "DMS") {
                let Deg = $("#txtDeg").val();
                if (Deg == "") {
                    $("#txtDeg").addClass("is-invalid");
                    $("#txtDeg").focus();
                    return false;
                } else {
                    $("#txtDeg").removeClass("is-invalid");
                    $("#txtDeg").addClass("is-valid");
                }
                let Min = $("#txtMin").val();
                if (Min == "") {
                    $("#txtMin").addClass("is-invalid");
                    $("#txtMin").focus();
                    return false;
                } else {
                    $("#txtMin").removeClass("is-invalid");
                    $("#txtMin").addClass("is-valid");
                }
                let Sec = $("#txtSec").val();
                if (Sec == "") {
                    $("#txtSec").addClass("is-invalid");
                    $("#txtSec").focus();
                    return false;
                } else {
                    $("#txtSec").removeClass("is-invalid");
                    $("#txtSec").addClass("is-valid");
                }
                let Deg1 = $("#txtDeg1").val();
                if (Deg1 == "") {
                    $("#txtDeg1").addClass("is-invalid");
                    $("#txtDeg1").focus();
                    return false;
                } else {
                    $("#txtDeg1").removeClass("is-invalid");
                    $("#txtDeg1").addClass("is-valid");
                }
                let Min1 = $("#txtMin1").val();
                if (Min1 == "") {
                    $("#txtMin1").addClass("is-invalid");
                    $("#txtMin1").focus();
                    return false;
                } else {
                    $("#txtMin1").removeClass("is-invalid");
                    $("#txtMin1").addClass("is-valid");
                }
                let Sec1 = $("#txtSec1").val();
                if (Sec1 == "") {
                    $("#txtSec1").addClass("is-invalid");
                    $("#txtSec1").focus();
                    return false;
                } else {
                    $("#txtSec1").removeClass("is-invalid");
                    $("#txtSec1").addClass("is-valid");
                }
            }
            var sourceNumber = $("#sourceNumberId").val();
            if (sourceNumber == "") {
                $("#sourceNumberId").addClass("is-invalid");
                $("#sourceNumberId").focus();
                return false;
            } else {
                $("#sourceNumberId").removeClass("is-invalid");
                $("#sourceNumberId").addClass("is-valid");
            }
            var nameOfWaterSource = $("#nameOfWaterSourceId").val();
            if (nameOfWaterSource == "") {
                $("#nameOfWaterSourceId").addClass("is-invalid");
                $("#nameOfWaterSourceId").focus();
                return false;
            } else {
                $("#nameOfWaterSourceId").removeClass("is-invalid");
                $("#nameOfWaterSourceId").addClass("is-valid");
            }
            var SlctFundSourceType = $("#SlctFundSourceTypeId").val();
            if (SlctFundSourceType == "") {
                $("#SlctFundSourceTypeId").addClass("is-invalid");
                $("#SlctFundSourceTypeId").focus();
                return false;
            } else {
                $("#SlctFundSourceTypeId").removeClass("is-invalid");
                $("#SlctFundSourceTypeId").addClass("is-valid");
            }
            var funderName = $("#funderNameId").val();
            if (funderName == "") {
                $("#funderNameId").addClass("is-invalid");
                $("#funderNameId").focus();
                return false;
            } else {
                $("#funderNameId").removeClass("is-invalid");
                $("#funderNameId").addClass("is-valid");
            }
            var investmentCost = $("#investmentCostId").val();
            if (investmentCost == "") {
                $("#investmentCostId").addClass("is-invalid");
                $("#investmentCostId").focus();
                return false;
            } else {
                $("#investmentCostId").removeClass("is-invalid");
                $("#investmentCostId").addClass("is-valid");
            }
            var title = $("#titleId").val();
            if (title == "") {
                $("#titleId").addClass("is-invalid");
                $("#titleId").focus();
                return false;
            } else {
                $("#titleId").removeClass("is-invalid");
                $("#titleId").addClass("is-valid");
            }
            var paymentProof1 = $("#txtPaymentProof1").val();
            if (paymentProof1 == "") {
                $("#txtPaymentProof1").addClass("is-invalid");
                $("#txtPaymentProof1").focus();
                return false;
            } else {
                $("#txtPaymentProof1").removeClass("is-invalid");
                $("#txtPaymentProof1").addClass("is-valid");
            }
            alert("Saved Successfully.");
        }
        //function addNewRow() {
        //    let row = '<tr class="row m-1 p-1">';
        //    row += '<td class="col-3"><div class="form-floating"><input type="number" min="1" class="form-control" id="sourceNumberId" title="Enter the Source Number" placeholder="Enter Source Number" /><label for="sourceNumberId">Source Number</label></div></td >';
        //    row += '<td class="col-3"><div class="form-floating"><input type="text" id="nameOfWaterSourceId" class="form-control" title="Enter the Name of Water Source" placeholder="Enter Name of Water Source" /><label for="nameOfWaterSourceId">Name of Water Source</label></div></td>';
        //    row += '<td class="col-3 mt-2"><button type="button" class="btn btn-light" onclick = "addNewRow()"><i class="fa-solid fa-circle-plus fa-1x"></i></button >&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-light" onclick="removeNewRow(this)"><i class="fa-solid fa-circle-minus fa-1x"></i></button></td>';
        //    row += '</tr>';
        //    $("#add_table").append(row);
        //}
        //function removeNewRow(child) {
        //    let rowLength = document.getElementById("add_table").rows.length;
        //    if (rowLength == 2) {
        //        alert("First row can't be deleted");
        //        return;
        //    }
        //    else {
        //        child.parentNode.parentNode.remove();
        //    }
        //}
        function getLocationType() {
            var chkBoxValue = $("input[name='locationType']:checked").val();
            if (chkBoxValue == "UTM") {
                $("#UTMLocationType").css("display", "block");
                $("#LatLongLocationType").css("display", "none");
                $("#DMSLocationType").css("display", "none")
            } else if (chkBoxValue == "Lat/Long") {
                $("#UTMLocationType").css("display", "none");
                $("#LatLongLocationType").css("display", "block");
                $("#DMSLocationType").css("display", "none")
            } else if (chkBoxValue == "DMS") {
                $("#UTMLocationType").css("display", "none");
                $("#LatLongLocationType").css("display", "none");
                $("#DMSLocationType").css("display", "block")
            }
        }
        function getFinancialYr() {
            var data = { 'op': 'FetchFinancialYear' }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let AddFinancialYr = $("#slctFinancialYearId");
                    sms.forEach(function (item) {
                        let option = document.createElement('option');
                        option.value = item.FinancialYr;
                        option.text = item.FinancialYrName;
                        AddFinancialYr.append(option);
                    })
                    sms.forEach(function (item) {
                        if (item.IsActive == 1) {
                            $("#slctFinancialYearId").val(item.FinancialYr);
                        }
                    });
                } else {
                    alert(sms);
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function fetchLC() {
            let data = { "op": "FetchLC" };
            let s = function (sms) {
                if (Array.isArray(sms)) {
                    let LC = document.getElementById("localGovernmentId");
                    sms.forEach((msg) => {
                        let option = document.createElement('option');
                        option.value = msg.LCId;
                        option.text = msg.LCName;
                        LC.appendChild(option);
                    })
                }
                else {
                    alert(sms);
                }
            }
            let e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function loadTechnology() {
            var data = { 'op': 'FetchTeachnologyTable' };
            var s = function (sms) {
                console.log(sms);
                if (Array.isArray(sms)) {
                    let teachnology = $("#slctTechnologyId");
                    sms.forEach(function (msg) {
                        let option = document.createElement('option');
                        option.value = msg.TechnologyId;
                        option.text = msg.TechnologyName;
                        teachnology.append(option);
                    })
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function getDistrict() {
            var data = { "op": "FetchLC" }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let District = document.getElementById("slctDistrictId");
                    sms.forEach((msg) => {
                        let option = document.createElement('option');
                        option.value = msg.LCId;
                        option.text = msg.LCName;
                        District.appendChild(option);
                    })
                }
                else {
                    alert(sms);
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e)
        }
        function getSubCounty() {
            let districtId = document.getElementById("slctDistrictId").value;
            alert(districtId);
            var data = { 'op': 'FetchSubCountyOfDistrict', 'districtId': districtId }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let SubCounty = document.getElementById("sub_CountyId");
                    SubCounty.innerHTML = "";
                    let ParishId = document.getElementById("SlctParishId");
                    ParishId.innerHTML = "";
                    sms.forEach((item) => {
                        let option = document.createElement('option');
                        option.value = item.SubCountyId;
                        option.text = item.SubCountyName;
                        SubCounty.appendChild(option);
                    })
                } else {
                    let SubCounty = document.getElementById("sub_CountyId");
                    SubCounty.innerHTML = "";
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function getParish() {
            let sub_CountyId = $("#sub_CountyId").val();
            var data = { 'op': 'FetchParishOfSubcounty', 'sub_CountyId': sub_CountyId }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let ParishId = document.getElementById("SlctParishId");
                    ParishId.innerHTML = "";
                    sms.forEach(function (item) {
                        let option = document.createElement('option');
                        option.value = item.ParishId;
                        option.text = item.ParishName;
                        ParishId.appendChild(option);
                    })
                }
                else {
                    let ParishId = document.getElementById("SlctParishId");
                    ParishId.innerHTML = "";
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function getVillage() {
            let ParishId = $("#SlctParishId").val();
            var data = { 'op': 'VillageOfParish', 'ParishId': ParishId }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let Village = document.getElementById("SlctVillageId");
                    Village.innerHTML = "";
                    sms.forEach(function (item) {
                        let option = document.createElement('option');
                        option.value = item.VillageId;
                        option.text = item.VillageName;
                        Village.appendChild(option);
                    })
                }
                else {
                    let Village = document.getElementById("SlctVillageId");
                    Village.innerHTML = "";
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function FundingSourceInformation() {
            var data = { 'op': 'FundingSourceInformation' }
            var s = function (sms) {
                let FundingSource = document.getElementById('SlctFundSourceTypeId');
                if (Array.isArray(sms)) {
                    sms.forEach(function (item) {
                        let option = document.createElement('option');
                        option.value = item.FundingSourceId;
                        option.text = item.FundingSourceName;
                        FundingSource.appendChild(option);
                    })
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }

        
        function CallHandler(d, s, e) {
            $.ajax({
                type: "GET",
                url: "RuwasHandler.axd",
                dataType: "json",
                contentType: "json/application",
                async: true,
                cache: true,
                success: s,
                error: e,
                data: d
            })
        }
    </script>
    <style>
         label,th,td,li{
            /*font-size:17px;*/
            font-weight:500;
         }
         span {
            font-size: 13px;
            font-weight: bold;
            color:red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container-fluid">
        <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb d-flex justify-content-start">
                <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='QuarterlyAttachments.aspx'"></i>&nbsp;&nbsp;Data Entry</li>
                <li class="breadcrumb-item h6 active">Quarterly Attachments</li>
                <li class="breadcrumb-item h6">New Quarterly Attachment</li>
            </ol>

        </nav>
        <div class="card shadow mb-5 bg-white rounded">
            <div class="card-header  text-center h5 alert alert-info">
                New Quarterly Attachment
            </div>
            <div>
                <div>
                    <div><strong class="ms-3">1.Basic Information</strong></div>
                    <div class="row p-2 m-1">
                        <div class="col-lg-3 col-12">
                                            <div class="form-floating">
                                                <select class="form-select" id="slctFinancialYearId" title="Financial Year">
                                                    <option value="">Choose from List</option>
                                                </select>
                                                <label class="slctFinancialYearId">Financial Year <span>*</span></label>
                                                <span class="invalid-feedback is-invalid">please select Financial year</span>
                                            </div>
                                        </div>
                        <%--<div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <input disabled type="text" id="workplanId" class="form-control" title="Enter the Workplan Id" placeholder="Workplan Id" />
                                <label for="workplanId">Workplan Id</label>
                                <span class="invalid-feedback is-invalid">please enter the workplan id</span>
                            </div>
                        </div>--%>
                    </div>
                    <div class="row p-1 m-1 mb-4">
                        <div class="col-lg-3 col-sm-6">
                                            <div class="form-floating">
                                                <select class="form-select" id="localGovernmentId" aria-label="A">
                                                    <option value="">Choose from List</option>
                                                </select>
                                                <label for="localGovernmentId">Local Government <span>*</span></label>
                                                <span class="invalid-feedback is-invalid">please select from list</span>
                                            </div>
                                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="categoryId" title="Category">
                                    <option value="">Choose from List</option>
                                    <option value="1">New water sources constructed in this quarter</option>
                                    <option value="2">Water sources rehabilitated in this quarter</option>
                                    <option value="3">Example Three</option>
                                </select>
                                <label for="categoryId">Category <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="quarterId" title="Quarter">
                                    <option value="">Choose from List</option>
                                    <option value="1">Q One (July-Sept)</option>
                                    <option value="2">Q Two (Oct-Dec)</option>
                                    <option value="3">Q Three (Jan-March)</option>
                                    <option value="4">Q Four (Apr-Jun)</option>
                                </select>
                                <label for="quarterId">Quarter <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="slctTechnologyId" title="Technology">
                                    <option value="">Choose from List</option>
                                    
                                </select>
                                <label for="slctTechnologyId">Technology <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                    </div>
                    <div class="row ms-2"><strong>2.Location Information</strong></div>
                    <div class="row p-1 m-1">
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="slctDistrictId" title="District" onchange="getSubCounty()">
                                    <option value="">Choose from List</option>
                                    
                                </select>
                                <label for="slctDistrictId">District <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="countyId" title="County">
                                    <option value="">Choose from List</option>
                                    <option value="1">Example One</option>
                                    <option value="2">Example Two</option>
                                    <option value="3">Example Three</option>
                                </select>
                                <label for="countyId">County <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select id="sub_CountyId" class="form-select" title="Sub-County" onchange="getParish()">
                                    <option value="">Choose from List</option>
                                    
                                </select>
                                <label for="sub_CountyId">Sub-County <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>

                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="SlctParishId" title="Parish" onchange=" getVillage()">
                                    <option value="">Choose from List</option>
                                   
                                </select>
                                <label for="SlctParishId">Parish <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                    </div>
                    <div class="row p-1 m-1">
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="SlctVillageId" title="Village">
                                    <option value="">Choose from List</option>
                                    <%--<option value="1">Example One</option>
                                    <option value="2">Example Two</option>
                                    <option value="3">Example Three</option>--%>
                                </select>
                                <label for="SlctVillageId">Village <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex p-1 ms-3">
                        <div class="form-check form-switch m-1">
                            <input class="form-check-input" type="radio" role="switch" checked name="locationType" value="UTM" onclick="getLocationType()">
                            <label class="form-check-label">UTM</label>
                        </div>

                        <div class="form-check form-switch m-1">
                            <input class="form-check-input" type="radio" role="switch" name="locationType" value="Lat/Long" onclick="getLocationType()">
                            <label class="form-check-label">Lat/Long</label>
                        </div>
                        <div class="form-check form-switch m-1">
                            <input class="form-check-input" type="radio" role="switch" name="locationType" value="DMS" onclick="getLocationType()">
                            <label class="form-check-label">DMS</label>
                        </div>
                    </div>
                    <div id="UTMLocationType">
                        <div class="row p-1 m-2 mb-4">
                            <div class="col-3">
                                <div class="form-floating">
                                    <select class="form-select" title="UTM Zone" placeholder="UTM Zone" id="slctUTMZone">
                                        <option value="">choose from list</option>
                                        <option>35N</option>
                                        <option>35S</option>
                                        <option>36N</option>
                                        <option>36S</option>
                                    </select>
                                    <label>UTM Zone</label>
                                    <span class="invalid-feedback is-invalid">please select UTM Zone</span>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-floating">
                                    <input type="number" class="form-control" title="UTM Easting" placeholder="UTM Easting" id="txtUTMEasting" />
                                    <label>UTM Easting</label>
                                    <span class="invalid-feedback is-invalid">please enter UTM easting</span>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-floating">
                                    <input type="number" class="form-control" title="UTM Northing" placeholder="UTM Northing" id="txtUTMNorthing" />
                                    <label>UTM Northing</label>
                                    <span class="invalid-feedback is-invalid">please enter UTM Northing</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="LatLongLocationType" style="display: none">
                        <div class="row p-1 m-2 mb-4">
                            <div class="col-3">
                                <div class="form-floating">
                                    <input type="number" class="form-control" title="Lattitude" placeholder="Lattitude" id="txtLatitude" />
                                    <label>Latitude</label>
                                    <span class="invalid-feedback is-invalid">please enter latitude</span>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-floating">
                                    <input type="number" class="form-control" title="Longitude" placeholder="Longitude" id="txtLongitude" />
                                    <label>Longitude</label>
                                    <span class="invalid-feedback is-invalid">please enter longitude</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="DMSLocationType" style="display: none">
                        <div class="row p-1 m-2">
                            <div class="col-2 d-flex">
                                <input type="number" class="form-control" id="txtDeg" />&nbsp;<div class="pt-1">Deg</div>
                                <span class="invalid-feedback is-invalid">*</span>
                            </div>
                            <div class="col-2 d-flex">
                                <input type="number" class="form-control" id="txtMin" />&nbsp;<div class="pt-1">Min</div>
                                <span class="invalid-feedback is-invalid">*</span>
                            </div>
                            <div class="col-2 d-flex">
                                <input type="number" class="form-control" id="txtSec" />&nbsp;<div class="pt-1">Sec</div>
                                <span class="invalid-feedback is-invalid">*</span>
                            </div>
                            <div class="col-2">
                                <select class="form-select">
                                    <option>E</option>
                                    <option>W</option>
                                    <option>N</option>
                                    <option>S</option>
                                </select>
                            </div>
                        </div>
                        <div class="row p-1 m-2 mb-4">
                            <div class="col-2 d-flex">
                                <input type="number" class="form-control" id="txtDeg1" />&nbsp;<div class="pt-1">Deg</div>
                                <span class="invalid-feedback is-invalid">*</span>
                            </div>
                            <div class="col-2 d-flex">
                                <input type="number" class="form-control" id="txtMin1" />&nbsp;<div class="pt-1">Min</div>
                                <span class="invalid-feedback is-invalid">*</span>
                            </div>
                            <div class="col-2 d-flex">
                                <input type="number" class="form-control" id="txtSec1" />&nbsp;<div class="pt-1">Sec</div>
                                <span class="invalid-feedback is-invalid">*</span>
                            </div>
                            <div class="col-2">
                                <select class="form-select">
                                    <option>E</option>
                                    <option>W</option>
                                    <option>N</option>
                                    <option>S</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <table class="w-100 m-2" id="add_table">
                        <tr>
                            <td>
                                <div class="row ms-2"><strong>3.Source Information</strong></div>
                            </td>
                        </tr>
                        <tr class="row m-1 p-1">
                            <td class="col-3">
                                <div class="form-floating">
                                    <input type="number" min="1" class="form-control" id="sourceNumberId" title="Enter the Source Number" placeholder="Enter Source Number" />
                                    <label for="sourceNumberId">Source Number <span>*</span></label>
                                    <span class="invalid-feedback is-invalid">please enter the source number</span>
                                </div>
                            </td>
                            <td class="col-3">
                                <div class="form-floating">
                                    <input type=" text" id="nameOfWaterSourceId" class="form-control" title="Enter the Name of Water Source" placeholder="Enter Name of Water Source" />
                                    <label for="nameOfWaterSourceId">Name of Water Source <span>*</span></label>
                                    <span class="invalid-feedback is-invalid">please enter the name of water source</span>
                                </div>
                            </td>
                           <%-- <td class="col-3 mt-2">
                                <button type="button" class="btn btn-light" onclick="addNewRow()"><i class="fa-solid fa-circle-plus fa-1x"></i></button>
                                &nbsp;&nbsp;
                                <button type="button" class="btn btn-light" onclick="removeNewRow(this)"><i class="fa-solid fa-circle-minus fa-1x"></i></button>
                            </td>--%>
                        </tr>
                    </table>
                    <div class="row ms-2 mt-4"><strong>4.Funding Information</strong></div>
                    <div class="row m-1 p-1">
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="SlctFundSourceTypeId" title="Fund Source Type">
                                    <option value="">Choose from List</option>
                                </select>
                                <label for="SlctFundSourceTypeId">Fund Source Type <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="funderNameId" placeholder="Enter the Name of Funder" title="Enter the Name of Funder" />
                                <label for="funderNameId">Funder Name <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please enter the name of funder</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <input type="number" id="investmentCostId" class="form-control" placeholder="Enter the Investment Cost in USX(000)" title="Enter the Investment Cost in USX(000)" />
                                <label for="investmentCostId">Investment Cost UGX(000) <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please enter the Investment Cost in USX(000)</span>
                            </div>
                        </div>
                    </div>
                    <div class="row ms-2 mt-4">
                        <strong>5.Attachments</strong>
                    </div>
                    <div class="row m-1 p-1">
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <input type="text" id="titleId" class="form-control" placeholder="Enter the Title of Document" title="Enter the Title of Document" />
                                <label>Title <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please enter the title of document</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <input class="form-control form-control-lg " type="file" id="txtPaymentProof1" />
                            <span class="invalid-feedback is-invalid">please select any file</span>
                        </div>
                        <div class="col-lg-3 col-6 text-sm-start mt-4 fst-italic" style="font-weight: 400">(Docment File, Max 10MB) <span>*</span></div>
                    </div>
                </div>
                <div class="d-flex justify-content-center p-2 mt-3 mb-3">
                    <button type="button" class="btn btn-warning" id="saveId" onclick="save()">Save</button>&nbsp;
                        <button type="button" class="btn btn-danger" id="cancelId" onclick="location.reload();">Clear</button>
                </div>
            </div>
        </div>
    </section>
   
</asp:Content>
