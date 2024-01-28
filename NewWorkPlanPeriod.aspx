<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewWorkPlanPeriod.aspx.cs" Inherits="RUWAS.NewWorkPlanPeriod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            loadFinancialYr()
        })
        function saveWorkPlanPeriod() {
            let slctEndDateId = $("#slctEndDateId").val();
            if (slctEndDateId == "") {
                $("#slctEndDateId").addClass("is-invalid");
                $("#slctEndDateId").focus();
                return false;
            } else {
                $("#slctEndDateId").removeClass("is-invalid");
                $("#slctEndDateId").addClass("is-valid");
            }
            let slctFinancialYearId = $("#slctFinancialYearId").val();
            if (slctFinancialYearId == "") {
                $("#slctFinancialYearId").addClass("is-invalid");
                $("#slctFinancialYearId").focus();
                return false;
            } else {
                $("#slctFinancialYearId").removeClass("is-invalid");
                $("#slctFinancialYearId").addClass("is-valid");
            }
            let data = {
                'op': 'SaveWorkplanPeriod',
                'slctEndDate': slctEndDateId,
                'slctFinancialYear': slctFinancialYearId
            }
            let s = function (sms) {
                alert(sms);
            }
            let e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function loadFinancialYr() {
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
                data: d,
                success: s,
                error: e
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='WorkPlanPeriod.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6 active">View Work Plan Period</li>
                    <li class="breadcrumb-item h6">New Work Plan Period</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">New Work Plan Period</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <input type="date" class="form-control" id="slctEndDateId" placeholder="End Date" title="End Date" />
                                <label for="slctEndDateId">End Date</label>
                                <span class="invalid-feedback is-invalid">please enter end date</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <select class="form-select" id="slctFinancialYearId" title="Financial Year">
                                    <option value="">Choose from list</option>
                                   
                                </select>
                                <label for="slctFinancialYearId">Financial Year</label>
                                <span class="invalid-feedback is-invalid">please select Financial Year</span>
                            </div>
                        </div>
                        <div class="text-center mt-3">
                            <button type="button" class="btn btn-primary" onclick="saveWorkPlanPeriod()">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
