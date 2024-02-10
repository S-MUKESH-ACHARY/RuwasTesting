<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="SubCounty.aspx.cs" Inherits="RUWAS.SubCounty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            getTableData();
            getFinancialYr();
            fetchLC();
        })
         function saveChanges() {
             let SubCountyId = Number($("#IdOfSunCounty").text());
             let SubCounty = $("#txtSunCountyId").val();
             let DistrictId = Number($("#txtDistrictId").val());
             let Population = Number($("#txtPopulationId").val());
             let FinancialYearId = Number($("#slctFinancialYearId").val());
             var data = {
                 "op": "UpdateSubCounty",
                 "SubCountyId": SubCountyId,
                 "SubCounty": SubCounty,
                 "DistrictId": DistrictId,
                 "Population": Population,
                 "FinancialYearId": FinancialYearId
             }
             var s = function (sms) {
                 alert(sms);
             }
             var e = function (msg) {
                 alert(msg);
             }
             CallHandler(data, s, e);
             
         }
         function getTableData() {
             var data = { 'op': 'FetchSubCountyTableData' }
             var s = function (sms) {
                 sms.forEach(function (item) {
                     var row = `<tr>`
                     row = row +
                         `<td class="5" style="display:none;">` + item.SubCountyId + `</td>` +
                         `<td class="1">` + item.SubCounty + `</td>` +
                         `<td>` + item.District+`</td>`+
                         `<td class="2" style="display:none;">` + item.DistrictId+`</td>`+
                         `<td class="3">` + item.Population+`</td>`+
                         `<td>` + item.FinancialYear+`</td>`+
                         `<td class="4" style="display:none;">` + item.FinancialYearId+`</td>`+
                         `<td>` +`<button class="btn btn-primary" type="button" onclick="EditSubCounty(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button> `+`</td></tr>`
                     $("#myTable").append(row);
                 })
                 $(".loader-container").hide();
                 $("#myTable").DataTable();
                
             }
             var e = function (msg) {
                 alert(msg);
                 $(".loader-container").hide();
             }
             CallHandler(data, s, e)
             $(".loader-container").show();
         }
         function EditSubCounty(thisId) {
             
             let Subcounty = $(thisId).closest('tr').find('.1').html();
             $("#txtSunCountyId").val(Subcounty);
             let District = $(thisId).closest('tr').find('.2').html();
             $("#txtDistrictId").val(District);
             let Population = $(thisId).closest('tr').find('.3').html();
             $("#txtPopulationId").val(Population);
             let FinancialYear = $(thisId).closest('tr').find('.4').html();
             $("#slctFinancialYearId").val(FinancialYear);
             let IdOfSunCounty = $(thisId).closest('tr').find('.5').html();
             $("#IdOfSunCounty").html(IdOfSunCounty);
         }
         function getFinancialYr() {
             var data = {
                 'op': 'FetchFinancialYear',
             }
             var s = function (sms) {
                 if (Array.isArray(sms)) {
                     let AddFinancialYr = $("#slctFinancialYearId");
                     sms.forEach(function (msg) {
                         msg.IsActive;
                         let option = document.createElement('option');
                         option.value = msg.FinancialYr;
                         option.text = msg.FinancialYrName;
                         AddFinancialYr.append(option);
                     });
                    
                 }
                 else {
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
                     let LC = document.getElementById("txtDistrictId");
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
       label,td,td{
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='AnnualAttachments.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6">Sub-Counties</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info"> View List of Sub-Counties</div>
                <div class="text-end me-4">
                    <button type="button" class="btn btn-primary" onclick="location.href='NewSubCounty.aspx'">New Sub-county</button>
                </div>
                <div class="card-body">
                <table id="myTable" class="table table-hover w-100" style="text-align: center;">
                    <thead>
                        <tr class="table-secondary">
                            <th style="display:none;" class="text-center">Sub-CountyId</th>
                            <th class="text-center">Sub-County</th>
                            <th class="text-center">District</th>
                            <th style="display:none;" class="text-center">DistrictId</th>
                            <th class="text-center">Population</th>
                            <th class="text-center">Financial Year</th>
                            <th style="display:none;" class="text-center">Financial Year Id</th>
                            <th class="text-center">Edit</th>
                        </tr>
                    </thead>
                  <tbody></tbody>
                    </table>
                    </div>
                </div>
            </div>
         <%--Modal for Edit--%>
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content">
                                <div class="modal-header alert alert-info justify-content-center">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Sub-County</h1>
                                </div>
                                <div class="modal-body">
                                    <div class="row m-1 p-1">
                                        <label id="IdOfSunCounty"></label>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-floating">
                                                <input type="text" id="txtSunCountyId" class="form-control" placeholder="Sun-County" title="Sun-County" />
                                                <label for="txtSunCountyId">Sun-County</label>
                                                <span class="invalid-feedback is-invalid">Please enter sun-county</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-floating">
                                                <select id="txtDistrictId" class="form-select"  placeholder="District" title="District">
                                                    <option value="">Choose from List</option>
                                                </select>
                                                <label for="txtDistrictId">District</label>
                                                <span class="invalid-feedback is-invalid">Please enter district</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-1 p-1">
                                        <div class="col-lg-6 col-12">
                                            <div class="form-floating">
                                               <input id="txtPopulationId" type="number" class="form-control" placeholder="Population" />
                                                <label for="txtPopulationId">Population</label>
                                                <span class="invalid-feedback is-invalid">Please enter population</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-sm-12">
                                            <div class="form-floating">
                                                <select class="form-select" id="slctFinancialYearId" title="Financial Year">
                                                    <option value="">Choose from List</option>
                                                </select>
                                                <label class="slctFinancialYearId">Financial Year</label>
                                                <span class="invalid-feedback is-invalid">please select Financial year</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="saveChanges()">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
        </section>
</asp:Content>
