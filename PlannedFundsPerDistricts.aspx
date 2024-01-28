<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="PlannedFundsPerDistricts.aspx.cs" Inherits="RUWAS.PlannedFundsPerDistricts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            getFinancialYr();
        })
         function getTableData() {
             let FinancialYr = $("#slctFinancialYearId").val();
             var data = { "op": "PlannedFundsPerDistrictsTableData", "FinancialYr": FinancialYr }
             var s = function (sms) {
                 $("#tbl_body").html("");
                 if (Array.isArray(sms)) {
                     sms.forEach(function (item) {
                         var row = `<tr>`
                         row = row + `<td>` + item.BudgetPerDistrictId + `</td>` +
                             `<td>` + item.Vote + `</td>` +
                             `<td>` + item.DistrictName + `</td>` +
                             `<td>` + `<input type="number" class="form-control text-center" value="${item.Recurrent}" placeholder="${item.Recurrent}" />` + `</td>` +
                             `<td>` + `<input type="number" class="form-control text-center" value="${item.Development}" placeholder="${item.Development}" />` + `</td>` +
                             `<td>` + `<input type="number" class="form-control text-center" value="${item.Sanitation}" placeholder="${item.Sanitation}" />` + `</td>` +
                             `<td>` + `<input type="number" class="form-control text-center" disabled placeholder="${item.Recurrent + item.Development + item.Sanitation}" />` + `</td></tr>`
                         $("#myTable").append(row);
                     })
                 } else {
                     alert(sms);
                 }
                 $(".loader-container").hide();
             }
             var e = function (msg) {
                 alert(msg);
                 $(".loader-container").hide();
             }
             CallHandler(data, s, e);
             $(".loader-container").show();
         }
         function getFinancialYr() {
             
             var data = { 'op': 'FetchFinancialYear' }
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
                 getTableData();
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
         $(document).ready(function () {
             $("#myInput").on("keyup", function () {
                 var value = $(this).val().toLowerCase();
                 $("#tbl_body tr").filter(function () {
                     $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                 });
             });
         });
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='AnnualAttachments.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6">Planned Funds</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">Planned Funds Per Districts</div>
                <div class= "row p-1 m-1">
                    <div class="col">
                    <div class="form-floating">
                        <select class="form-select" id="slctFinancialYearId" title="Financial Year" onchange="getTableData()">
                            <option value="">Choose from List</option>
                        </select>
                        <label class="slctFinancialYearId">Financial Year</label>
                        <span class="invalid-feedback is-invalid">please selectr Financial year</span>
                    </div>
                    </div>
                    <div class="col mt-2">
                        <input type="text" class="form-control" placeholder="Search..." id="myInput" />
                      </div>
               
                    <div class="mt-2 col">
                        <button type="button" class="btn btn-primary" onclick="location.href='NewPlannedFund.aspx'">Add New Budget</button>
                    </div>
                </div>
                
               
                    <div class="container-fluid mt-2" style="overflow:auto;height:450px;">
                        <table id="myTable" class="table table-hover w-100 text-center">
                            <thead>
                                <tr class="table-secondary text-center"style="position:sticky;top:0;">
                                <th>Sl No.</th>
                                <th>Vote</th>
                                <th>District</th>
                                <th>Non Wage\Recurrent</th>
                                <th>Development</th>
                                <th>Sanitation</th>
                                <th>Total</th>
                                
                            </tr>
                            </thead>
                            <tbody id="tbl_body">
                                <%--<tr class="text-center">
                                    <td>1</td>
                                    <td>573</td>
                                    <td>Abim</td>
                                    <td>
                                        <input type="number" class="form-control" placeholder="0" />
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" placeholder="0" />
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" disabled placeholder="0" />
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" placeholder="0" />
                                    </td>
                                </tr>
                                <tr class="text-center">
                                    <td>2</td>
                                    <td>501</td>
                                    <td>Adjumani</td>
                                    <td>
                                        <input type="number" class="form-control" placeholder="0" />
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" placeholder="0" />
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" disabled placeholder="0" />
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" placeholder="0" />
                                    </td>
                                </tr>
                                <tr class="text-center">
                                    <td>3</td>
                                    <td>611</td>
                                    <td>Agago</td>
                                    <td>
                                        <input type="number" class="form-control" placeholder="0" />
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" placeholder="0" />
                                    </td>
                                    <td>
                                        <input type="number" class="form-control " disabled placeholder="0" />
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" placeholder="0" />
                                    </td>
                                </tr>
                                <tr class="text-center">
                                    <td>4</td>
                                    <td>588</td>
                                    <td>Alebtong</td>
                                    <td>
                                        <input type="number" class="form-control" placeholder="0" />
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" placeholder="0" />
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" disabled placeholder="0" />
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" placeholder="0" />
                                    </td>
                                </tr>--%>
                            </tbody>
                        </table>
                    </div>
                    </div>
                    </div>
                    
        </section>
</asp:Content>
