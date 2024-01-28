<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewParish.aspx.cs" Inherits="RUWAS.NewParish" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
       $(function () {
           document.getElementById("administrationId").classList.add("DE");
           getDistrict()
       })
       function saveNewParish() {
           let txtParish = $("#txtParishId").val();
           if (txtParish == "") {
               $("#txtParishId").addClass("is-invalid");
               $("#txtParishId").focus();
               return false;
           } else {
               $("#txtParishId").removeClass("is-invalid");
               $("#txtParishId").addClass("is-valid");
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
           let slctSubCounty = $("#slctSubCountyId").val();
           /*let slctSubCounty = 3;*/
           if (slctSubCounty == "") {
               $("#slctSubCountyId").addClass("is-invalid");
               $("#slctSubCountyId").focus();
               return false;
           } else {
               $("#slctSubCountyId").removeClass("is-invalid");
               $("#slctSubCountyId").addClass("is-valid");
           }
           var data = {
               "op": "SaveParish",
               "txtParish": txtParish,
               "slctSubCounty": slctSubCounty
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
            CallHandler(data,s,e)
        }
        function getSubCounty() {
            let districtId = document.getElementById("districtId").value;
            var data = { 'op': 'FetchSubCountyOfDistrict', 'districtId': districtId }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let SubCounty = document.getElementById("slctSubCountyId");
                    SubCounty.innerHTML = "";
                    sms.forEach((item) => {
                        let option = document.createElement('option');
                        option.value = item.SubCountyId;
                        option.text = item.SubCountyName;
                        SubCounty.appendChild(option);
                    })
                } else {
                    let SubCounty = document.getElementById("slctSubCountyId");
                    SubCounty.innerHTML = "";
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='ViewParish.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6 active">Parish</li>
                    <li class="breadcrumb-item h6">New Parish</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">New Parish</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="txtParishId" placeholder="Parish" title="Parish" />
                                <label for="txtParishId">Parish</label>
                                <span class="invalid-feedback is-invalid">please enter parish</span>
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
                                <select id="slctSubCountyId" class="form-select" title="Sub-county">
                                    <option value="">Choose from List</option>
                                   
                                </select>
                                <label for="slctSubCountyId">Sub-county</label>
                                <span class="invalid-feedback is-invalid">please select sub-county</span>
                            </div>
                        </div>
                        <div class="text-center  mt-3">
                        <button type="button" class="btn btn-primary" onclick="saveNewParish()">Save</button>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
