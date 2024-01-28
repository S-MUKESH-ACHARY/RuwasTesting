<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewPlannedFund.aspx.cs" Inherits="RUWAS.NewPlannedFund" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            getDistrict()
            getFinancialYr()
        })
        function saveBudgetType() {
            let slctDiatrict = $("#slctDiatrictId").val();
            if (slctDiatrict == "") {
                $("#slctDiatrictId").addClass("is-invalid");
                $("#slctDiatrictId").focus();
                return false;
            } else {
                $("#slctDiatrictId").removeClass("is-invalid");
                $("#slctDiatrictId").addClass("is-valid");
            }
            let slctFinancialYr = $("#slctFinancialYrId").val();
            if (slctFinancialYr == "") {
                $("#slctFinancialYrId").addClass("is-invalid");
                $("#slctFinancialYrId").focus();
                return false;
            } else {
                $("#slctFinancialYrId").removeClass("is-invalid");
                $("#slctFinancialYrId").addClass("is-valid");
            }
            let txtRecurrent = $("#txtRecurrentId").val();
            if (txtRecurrent == "") {
                $("#txtRecurrentId").addClass("is-invalid");
                $("#txtRecurrentId").focus();
                return false;
            } else {
                $("#txtRecurrentId").removeClass("is-invalid");
                $("#txtRecurrentId").addClass("is-valid");
            }
            let txtDevelopment = $("#txtDevelopmentId").val();
            if (txtDevelopment == "") {
                $("#txtDevelopmentId").addClass("is-invalid");
                $("#txtDevelopmentId").focus();
                return false;
            } else {
                $("#txtDevelopmentId").removeClass("is-invalid");
                $("#txtDevelopmentId").addClass("is-valid");
            }
            let txtSanitation = $("#txtSanitationId").val();
            if (txtSanitation == "") {
                $("#txtSanitationId").addClass("is-invalid");
                $("#txtSanitationId").focus();
                return false;
            } else {
                $("#txtSanitationId").removeClass("is-invalid");
                $("#txtSanitationId").addClass("is-valid");
            }
            var data = {
                "op": "SavePlannedFund",
                "slctDiatrict": slctDiatrict,
                "slctFinancialYr": slctFinancialYr,
                "txtRecurrent": txtRecurrent,
                "txtDevelopment": txtDevelopment,
                "txtSanitation": txtSanitation
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
                    let District = document.getElementById("slctDiatrictId");
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
                    let AddFinancialYr = $("#slctFinancialYrId");
                    sms.forEach(function (item) {
                        let option = document.createElement('option');
                        option.value = item.FinancialYr;
                        option.text = item.FinancialYrName;
                        AddFinancialYr.append(option);
                    })
                    sms.forEach(function (item) {
                        if (item.IsActive == 1) {
                            $("#slctFinancialYrId").val(item.FinancialYr);
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
        option{
            font-size:14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container-fluid">
         <div class="m-2 pt-2">
            <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='PlannedFundsPerDistricts.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6 active">Planned Funds</li>
                    <li class="breadcrumb-item h6">New Planned Funds</li>
                </ol>
            </nav>
             <div class="card shadow mb-5 bg-white rounded">
                 <div class="card-header text-center h5 alert alert-info">New Planned Funds Per-District</div>
                 <div class="card-body">
                     <div class="row p-1 m-1">
                         <div class="col-lg-3 col-12">
                             <div class="form-floating">
                                 <select class="form-select" id="slctDiatrictId" title="District">
                                     <option value="">Choose from List</option>
                                 </select>
                                 <label for="slctDiatrictId">District</label>
                                 <span class="invalid-feedback is-invalid">Please select from list</span>
                             </div>
                         </div>
                         <div class="col-lg-3 col-12">
                             <div class="form-floating">
                                 <select class="form-select" id="slctFinancialYrId" title="Financial Year">
                                     <option value="">Choose from List</option>
                                 </select>
                                 <label for="slctFinancialYrId">Financial Year</label>
                                 <span class="invalid-feedback is-invalid">Please select from list</span>
                             </div>
                         </div>
                     </div>
                     <div class="row p-1 m-1">
                         <div class="col-lg-3 col-12">
                             <div class="form-floating">
                                 <input type="number" id="txtRecurrentId" class="form-control" placeholder="Recurrent" />
                                 <label for="txtRecurrentId">Non Wage\Recurrent</label>
                             </div>
                             <span class="invalid-feedback is-invalid">Please enter Recurrent</span>
                         </div> 
                         <div class="col-lg-3 col-12">
                             <div class="form-floating">
                                 <input type="number" id="txtDevelopmentId" class="form-control" placeholder="Development" />
                                 <label for="txtDevelopmentId">Development</label>
                             </div>
                             <span class="invalid-feedback is-invalid">please enter development</span>
                         </div> 
                         <div class="col-lg-3 col-12">
                             <div class="form-floating">
                                 <input type="number" id="txtSanitationId" class="form-control" placeholder="Recurrent" />
                                  <label for="txtSanitationId">Sanitation</label>
                             </div>
                             <span class="invalid-feedback is-invalid">please enter sanitation</span>
                         </div>
                     </div>
                     
                 </div>
                 <div class="text-center mb-3">
                         <button type="button" class="btn btn-primary" onclick="saveBudgetType()">Save</button>
                     </div>
             </div>
        </div>
    </section>
</asp:Content>
