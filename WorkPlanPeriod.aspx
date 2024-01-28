<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="WorkPlanPeriod.aspx.cs" Inherits="RUWAS.WorkPlanPeriod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            getTableData()
        })
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
                     /* $("#slctFinancialYearId").val("1");*/
                     //sms.forEach(function (msg) {
                     //    if (msg.IsActive == 1) {
                     //        $("#slctFinancialYearId").val(msg.FinancialYr);
                     //    }
                     //});
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
         function getTableData() {
             var data = { "op": "FetchWorkPlanPeriodTable" }
             var s = function (sms) {
                 console.log(sms);
                 sms.forEach(function (item) {
                     let IsEnded = item.IsEnded;
                     if (IsEnded == 1) {
                         var row = `<tr>`
                         row = row + `<td class="1">` + item.EndDate_string + `</td>` +
                             `<td class="2" style="display:none;">` + item.FinancialYr + `</td>` +
                             `<td>` + item.FinancialYrName + `</td>` +
                             `<td class="3">` + `<input type="checkbox" class="form-check-input" checked />` + `</td>` +
                             `<td class="4">` + item.CreatedBy + `</td>` +
                             `<td class="5">` + item.CreatedDate_string + `</td>` +
                             `<td>` + `<button class="btn btn-primary" type="button" onclick="EditDistrict(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button>` + `</td></tr>`
                         $("#myTable").append(row);
                     } else {
                         var row = `<tr>`
                         row = row + `<td class="1">` + item.EndDate_string + `</td>` +
                             `<td class="2" style="display:none;">` + item.FinancialYr + `</td>` +
                             `<td>` + item.FinancialYrName + `</td>` +
                             `<td class="3">` + `<input type="checkbox" class="form-check-input" />` + `</td>` +
                             `<td class="4">` + item.CreatedBy + `</td>` +
                             `<td class="5">` + item.CreatedDate_string + `</td>` +
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
         function EditDistrict(thisId) {
             getFinancialYr();
             let EndDate = $(thisId).parent().parent().children('.1').html();
             $("#txtEndDateId").val(EndDate);
             let FinancialYr = $(thisId).parent().parent().children('.2').html();
             $("#slctFinancialYearId").val(FinancialYr);
             let Ended = $(thisId).parent().parent().children('.3').html();
             $("#chkFinancialYrId").val(Ended);
             let EditedBy = $(thisId).parent().parent().children('.4').html();
             $("#txtEditedById").val(EditedBy);
             let EditDate = $(thisId).parent().parent().children('.5').html();
             $("#txtEditDateId").val(EditDate);
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
                    <li class="breadcrumb-item h6">View Work Plan Period</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">View Work Plan Period</div>
                <div class="text-end me-4">
                    <button type="button" class="btn btn-primary" onclick="location.href='NewWorkPlanPeriod.aspx'">New Work Plan Period</button>
                </div>
                <div class="card-body">
                    <table id="myTable" class="table table-hover w-100" style="text-align: center;">
                        <thead>
                            <tr class="table-secondary">
                                <th>End Date</th>
                                <th>Finacial Year</th>
                                <th>Ended</th>
                                <th>Edited By</th>
                                <th>Edit Date</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody class="overflow-scroll">
                            <%--<tr id="editRow">
                                <td>2023/12/30</td>
                                <td>2012/2013</td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td>eoworinawe</td>
                                <td>2023/08/25</td>
                                <td><button class="btn btn-primary" type="button" onclick="Edit()"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>2023/11/10</td>
                                <td>2013/2014</td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td>eoworinawe</td>
                                <td>2023/08/25</td>
                                <td> <button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>2023/12/30</td>
                                <td>2014/2015</td>
                                <td><input type="checkbox" class="form-check-input"/></td>
                                <td>eoworinawe</td>
                                <td>2023/08/25</td>
                                <td> <button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td></tr>
                            <tr>
                                <td>2023/12/26</td>
                                <td>2023/2024</td>
                                <td><input type="checkbox" class="form-check-input"/></td>
                                <td>SNakato </td>
                                <td>2023/08/25</td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>2023/07/31</td>
                                <td>2022/2023</td>
                                <td><input type="checkbox" class="form-check-input"/></td>
                                <td>SNakato</td>
                                <td>2023/07/20</td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>2023/02/28</td>
                                <td>2011/2012</td>
                                <td><input type="checkbox" class="form-check-input"/></td>
                                <td>eoworinawe</td>
                                <td>2023/02/20</td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>2019/08/31</td>
                                <td>2019/2020</td>
                                <td><input type="checkbox" class="form-check-input"/></td>
                                <td>eoworinawe</td>
                                <td>2019/07/10</td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>2019/08/31</td>
                                <td>2018/2019</td>
                                <td><input type="checkbox" class="form-check-input"/></td>
                                <td>eoworinawe</td>
                                <td>2019/07/10</td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>2018/12/31</td>
                                <td>2017/2018</td>
                                <td><input type="checkbox" class="form-check-input"/></td>
                                <td>eoworinawe</td>
                                <td>2018/06/04</td>
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
                                        <div class="col-lg-6 col-sm-12">
                                            <div class="form-floating">
                                                <input class="form-control" type="date" id="txtEndDateId" title="End Date" />

                                                <label class="txtEndDateId">End Date</label>
                                                <span class="invalid-feedback is-invalid">please select end date</span>
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
                                        <div class="col-lg-6 col-12">
                                            <div class="form-check mt-3">
                                                <input class="form-check-input" type="checkbox" value="" id="chkEndedId">
                                                <label class="form-check-label" for="chkEndedId">
                                                    Ended
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-1 p-1">
                                        <div class="col-lg-6 col-sm-12">
                                            <div class="form-floating">
                                                <input class="form-control" type="text" id="txtEditedById" title="Edited By" />
                                                <label class="txtEditedById">Edited By</label>
                                                <span class="invalid-feedback is-invalid">please select edited by</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-sm-12">
                                            <div class="form-floating">
                                                <input class="form-control" type="date" id="txtEditDateId" title="Edit Date" />
                                                <label class="txtEndDateId">Edit Date</label>
                                                <span class="invalid-feedback is-invalid">please select edit date</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
