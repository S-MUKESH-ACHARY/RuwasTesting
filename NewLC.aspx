<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewLC.aspx.cs" Inherits="RUWAS.NewLC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            getDistrict()
        })
        function saveLC() {
            
            let txtLcName = $("#txtLcNameId").val();
            if (txtLcName == "") {
                $("#txtLcNameId").addClass("is-invalid");
                $("#txtLcNameId").focus();
                return false;
            } else {
                $("#txtLcNameId").removeClass("is-invalid");
                $("#txtLcNameId").addClass("is-valid");
            }
            let districtId = $("#districtId").val();
            if (districtId == "") {
                $("#districtId").addClass("is-invalid");
                $("#districtId").focus();
                return false;
            } else {
                $("#districtId").removeClass("is-invalid");
                $("#districtId").addClass("is-valid");
            }
            let sub_CountyId = $("#sub_CountyId").val();
            if (sub_CountyId == "") {
                $("#sub_CountyId").addClass("is-invalid");
                $("#sub_CountyId").focus();
                return false;
            } else {
                $("#sub_CountyId").removeClass("is-invalid");
                $("#sub_CountyId").addClass("is-valid");
            }
            let SlctParishId = $("#SlctParishId").val();
            if (SlctParishId == "") {
                $("#SlctParishId").addClass("is-invalid");
                $("#SlctParishId").focus();
                return false;
            } else {
                $("#SlctParishId").removeClass("is-invalid");
                $("#SlctParishId").addClass("is-valid");
            }
            var data = {
                'op': 'SaveLC',
                "txtLcName": txtLcName,
                "SlctParishId": SlctParishId
            }
            var s = function (sms) {
                alert(sms);
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function getDistrict() {
            var data = { "op": "FetchDistrict" }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let District = document.getElementById("districtId");
                    sms.forEach((msg) => {
                        let option = document.createElement('option');
                        option.value = msg.DistrictId;
                        option.text = msg.DistrictName;
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
            let districtId = document.getElementById("districtId").value;
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
       
        label,th,td{
           /*font-size:17px;*/
            font-weight:500;
        }
        span {
            font-size: 13px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container-fluid">
        <div class="m-2 pt-2">
            <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='LC.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6 active">LC</li>
                    <li class="breadcrumb-item h6">New LC</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">New Lc</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="txtLcNameId" placeholder="LcName" title="Lc Name" />
                                <label for="txtLcNameId">Lc Name</label>
                                <span class="invalid-feedback is-invalid">please enter Lc name</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <select id="districtId" class="form-select" title="District" onchange="getSubCounty()">
                                    <option value="">Choose from List</option>
                                </select>
                                <label for="districtId">District</label>
                                <span class="invalid-feedback is-invalid">please select district</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <select id="sub_CountyId" class="form-select" title="Sub-county" onchange="getParish()">
                                    <option value="">Choose from List</option>
                                     
                                </select>
                                <label for="sub_CountyId">Sub-county</label>
                                <span class="invalid-feedback is-invalid">please select sub-county</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <select id="SlctParishId" class="form-select" title="parish">
                                    <option value="">Choose from List</option>
                                    
                                </select>
                                <label for="SlctParishId">Parish</label>
                                <span class="invalid-feedback is-invalid">please select parish</span>
                            </div>
                        </div>
                        <div class="text-center mt-3">
                            <button type="button" class="btn btn-primary" onclick="saveLC()">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
