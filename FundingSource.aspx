<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="FundingSource.aspx.cs" Inherits="RUWAS.FundingSource" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            getTableData()
        })
         function getTableData() {
             var data = { 'op': 'FetchFundingSourceTable' }
             var s = function (sms) {
                 sms.forEach(function (item) {
                     let IsDeleted = item.IsDeleted;
                     if (IsDeleted == 1) {
                         let row = `<tr>`
                         row = row + `<td class="1" style="display:none;">` + item.FundingSourceId + `</td>` +
                             `<td class="2">` + item.FundingSourceName + `</td>` +
                             `<td class="3">` + `<input type="checkbox" class="form-check-input" checked />` + `</td>` +
                             `<td>` + `<button class="btn btn-primary" type="button" onclick="EditDistrict(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button>` + `</td></tr>`
                         $("#myTable").append(row);
                     }else {
                         let row = `<tr>`
                         row = row + `<td class="1" style="display:none;">` + item.FundingSourceId + `</td>` +
                             `<td class="2">` + item.FundingSourceName + `</td>` +
                             `<td class="3">` + `<input type="checkbox" class="form-check-input" />` + `</td>` +
                             `<td>` + `<button class="btn btn-primary" type="button" onclick="EditDistrict(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button>` + `</td></tr>`
                         $("#myTable").append(row);
                     }
                 })
             }
             var e = function (msg) {
                 alert(msg);
             }
             CallHandler(data, s, e);
         }
        function EditDistrict(thisId){
            let FundingSource = $(thisId).parent().parent().children('.2').html();
            $("#txtFundingSourceId").val(FundingSource);
            let FundingSourceId = $(thisId).parent().parent().children('.1').html();
            $("#txtFundingSource").html(FundingSourceId);
        }
         function Update() {
             let FundingSourceId = $("#txtFundingSource").text();
             let chkDisabled = 0;
             let ChkVal = $("#chkDisabled");
             if (ChkVal.is(":checked")) {
                 chkDisabled = 1;
             }
             var data = {
                 "op": "UpdateFundingSource",
                 "FundingSourceId": FundingSourceId,
                 "chkDisabled":chkDisabled
             }
             console.log(data);
             var s = function (sms) {
                 alert(sms);
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='AnnualAttachments.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6">View Founding Source</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">View Founding Source</div>
                <div class="text-end me-4">
                    <button type="button" class="btn btn-primary" onclick="location.href='NewFundingSource.aspx'">New Founding Source</button>
                </div>
                <div class="card-body">
                    <table id="myTable" class="table table-hover w-100" style="text-align: center;">
                        <thead>
                            <tr class="table-secondary">
                                <th style="display:none;">Funcding Id</th>
                                <th>Funcding Source</th>
                                <th>Disabled</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody class="overflow-scroll">
                            <%--<tr>
                                <td>LGDP</td>
                                <td><input type="checkbox"/></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>NUSAF</td>
                                <td><input type="checkbox"/></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>NGO</td>
                                <td><input type="checkbox"/></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>CBO</td>
                                <td><input type="checkbox"/></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>Indivisual(private funding)</td>
                                <td><input type="checkbox"/></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>Indivisual(private funding)</td>
                                <td><input type="checkbox"/></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>Other</td>
                                <td><input type="checkbox"/></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>District Water and Sanitatuin Conditional Grant(DWSCD)</td>
                                <td><input type="checkbox"/></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>--%>
                        </tbody>
                    </table>
                     <%--Modal for Edit--%>
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content">
                                <div class="modal-header alert alert-info justify-content-center">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Edit District</h1>
                                </div>
                                <div class="modal-body">
                                    <div class="row m-1 p-1">
                                        <label id="txtFundingSource"></label>
                                        <div class="col-lg-6 col-sm-12">
                                            <div class="form-floating">
                                                <input class="form-control" type="text" id="txtFundingSourceId" title="Funding Source"/>
                                                <label class="txtFundingSourceId">Funding Source</label>
                                                <span class="invalid-feedback is-invalid">please select funding source</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-check mt-3">
                                                <input class="form-check-input" type="checkbox" value="" id="chkDisabled">
                                                <label class="form-check-label" for="defaultCheck1">
                                                    Dsabled
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="Update()">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
