<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewSubCounty.aspx.cs" Inherits="RUWAS.NewSubCounty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            getDistrict()
            getFinancialYr()
        })
        function saveSubCounty() {
            let slctSubCounty = $("#slctSubCountyId").val();
            if (slctSubCounty == "") {
                $("#slctSubCountyId").addClass("is-invalid");
                $("#slctSubCountyId").focus();
                return false;
            } else {
                $("#slctSubCountyId").removeClass("is-invalid");
                $("#slctSubCountyId").addClass("is-valid");

            }
            let slctDistrictId = $("#slctDistrictId").val();
            if (slctDistrictId == "") {
                $("#slctDistrictId").addClass("is-invalid");
                $("#slctDistrictId").focus();
                return false;
            } else {
                $("#slctDistrictId").removeClass("is-invalid");
                $("#slctDistrictId").addClass("is-valid");

            }
            let txtPopulation = $("#txtPopulationId").val();
            if (txtPopulation == "") {
                $("#txtPopulationId").addClass("is-invalid");
                $("#txtPopulationId").focus();
                return false;
            } else {
                $("#txtPopulationId").removeClass("is-invalid");
                $("#txtPopulationId").addClass("is-valid");

            }
            let slctFinancialYear = $("#slctFinancialYearId").val();
            if (slctFinancialYear == "") {
                $("#slctFinancialYearId").addClass("is-invalid");
                $("#slctFinancialYearId").focus();
                return false;
            } else {
                $("#slctFinancialYearId").removeClass("is-invalid");
                $("#slctFinancialYearId").addClass("is-valid");
            }
            var data = {
                "op": "SaveSubCounty",
                "slctSubCounty": slctSubCounty,
                "slctDistrictId": slctDistrictId,
                "txtPopulation": txtPopulation,
                "slctFinancialYear": slctFinancialYear
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
                    let District = document.getElementById("slctDistrictId");
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
        function getFinancialYr() {
            var data = {
                'op': 'FetchFinancialYear',
            }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let AddFinancialYr = $("#slctFinancialYearId");
                    sms.forEach(function (msg) {
                        let option = document.createElement('option');
                        option.value = msg.FinancialYr;
                        option.text = msg.FinancialYrName;
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='SubCounty.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6 active">Sub-county</li>
                    <li class="breadcrumb-item h6">New Sub-county</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">New Sub-county</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="slctSubCountyId" placeholder="Sub-County" title="Sub-County"  />
                                <label class="slctSubCountyId">Sub-County</label>
                                <span class="invalid-feedback is-invalid">please enter sub county</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <select class="form-select" id="slctDistrictId" title="District">
                                    <option value="">Choose from List</option>
                                </select>
                                <label class="slctDistrictId">District</label>
                                <span class="invalid-feedback is-invalid">please enter district</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <input type="number" class="form-control" id="txtPopulationId" placeholder="Population" title="Population"/>
                                <label class="txtPopulationId">Population</label>
                                <span class="invalid-feedback is-invalid">please enter population</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <select  class="form-select" id="slctFinancialYearId"  title="Financial Year">
                                    <option value="">Choose from List</option>
                                </select>
                                <label class="slctFinancialYearId">Financial Year</label>
                                <span class="invalid-feedback is-invalid">please selectr Financial year</span>
                            </div>
                        </div>
                        <div class="text-center mt-3">
                            <button type="button" class="btn btn-primary" onclick="saveSubCounty()">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
