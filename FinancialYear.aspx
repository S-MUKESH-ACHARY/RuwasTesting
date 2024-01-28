<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="FinancialYear.aspx.cs" Inherits="RUWAS.FinancialYear" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            getTableData();
            getFinancialYr();
        })
        function getTableData() {
            let data = { 'op': 'FetchFinancialYear' }
            let s = function (sms) {
                sms.forEach(function (item) {
                    let isActive = item.IsActive;
                    if (isActive == 1) {
                        var row = `<tr>`
                        row = row + `<td class="1" style="display:none;">` + item.FinancialYr + `</td>` +
                                    `<td class="2">` + item.FinancialYrName + `</td>` +
                            `<td>` + `<input type="checkbox" class="form-check-input" checked/>` + `</td>` +
                            `<td>` + `<input type="checkbox" class="form-check-input" />` + `</td>` +
                            `<td>` + '' + `</td>` +
                            `<td>` + `<button class="btn btn-primary" type="button" onclick="EditDistrict(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button> ` + `</td></tr>`
                        $("#myTable").append(row);
                    }
                    else {
                        var row = `<tr>`
                        row = row + `<td class="1" style="display:none;">` + item.FinancialYr + `</td>` +
                            `<td class="2">` + item.FinancialYrName + `</td>` +
                            `<td>` + `<input type="checkbox" class="form-check-input"/>` + `</td>` +
                            `<td>` + `<input type="checkbox" class="form-check-input" />` + `</td>` +
                            `<td>` + '' + `</td>` +
                            `<td>` + `<button class="btn btn-primary" type="button" onclick="EditDistrict(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button> ` + `</td></tr>`
                        $("#myTable").append(row);
                        
                    }
                    
                })
            }
            let e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function EditDistrict(thisId) {

            let FinancialYr = $(thisId).parent().parent().children('.1').html();
            console.log(FinancialYr);
            $("#slctFinancialYearId").val(FinancialYr);
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
        function Update() {
            let FinancialYr = $("#slctFinancialYearId").val();
            let ActiveYr = 0;
            let ChkVal = $("#chkFinancialYrId");
            if (ChkVal.is(":checked")) {
                ActiveYr = 1;
            }
            var data = {
                "op": "UpdateFinancialYr",
                "FinancialYr": FinancialYr,
                "ActiveYr": ActiveYr
            }
            var s = function (sms) {
                alert(sms);
                console.log(sms);
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='Dashboard.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6">Financial Year</li>
                </ol>
            </nav>
             <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">View Financial Year</div>
                <div class="text-end me-4">
                <button type="button" class="btn btn-primary" onclick="location.href='NewFinancialYear.aspx'">Add New Financial Year</button>
            </div>
                 <div class="card-body" style="overflow:auto;height:430px;">
                     <table id="myTable" class="table table-hover w-100" style="text-align: center;">
                         <thead>
                             <tr class="table-secondary">
                                 <th>Financial Year</th>
                                 <th>Active Year</th>
                                 <th>Opened</th>
                                 <th>UP To</th>
                                 <th>Edit</th>
                             </tr>
                         </thead>
                         <tbody class="overflow-scroll">
                             <%--<tr id="editRow">
                                 <td>2023/2024</td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td></td>
                                 <td>
                                     <button class="btn btn-primary" type="button" onclick="Edit()"><i class="fa-solid fa-pen-to-square"></i></button>
                                 </td>
                             </tr>
                             <tr>
                                 <td>2022/2023</td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td></td>
                                 <td>
                                     <button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button>
                                 </td>
                             </tr>
                             <tr>
                                 <td>2021/2022</td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td></td>
                                 <td>
                                     <button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button>
                                 </td>
                             </tr>
                             <tr>
                                 <td>2019/2020</td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td></td>
                                 <td>
                                     <button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button>
                                 </td>
                             </tr>
                             <tr>
                                 <td>2018/2019</td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td></td>
                                 <td>
                                     <button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button>
                                 </td>
                             </tr>
                             <tr>
                                 <td>2017/2018</td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td></td>
                                 <td>
                                     <button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button>
                                 </td>
                             </tr>
                             <tr>
                                 <td>2016/2017</td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td></td>
                                 <td>
                                     <button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button>
                                 </td>
                             </tr>
                             <tr>
                                 <td>2015/2016</td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td>
                                     <input type="checkbox" /></td>
                                 <td></td>
                                 <td>
                                     <button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button>
                                 </td>
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
                                                 <select class="form-select" id="slctFinancialYearId" title="Financial Year">
                                                     <option value="">Choose from List</option>
                                                 </select>
                                                 <label class="slctFinancialYearId">Financial Year</label>
                                                 <span class="invalid-feedback is-invalid">please select Financial year</span>
                                             </div>
                                         </div>
                                         <div class="col-lg-6 col-12">
                                             <div class="form-check mt-3">
                                                 <input class="form-check-input" type="checkbox" value="" id="chkFinancialYrId">
                                                 <label class="form-check-label" for="defaultCheck1">
                                                     Active Year
                                                 </label>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="row m-1 p-1">
                                         <div class="col-lg-6 col-12">
                                             <div class="form-check mt-3">
                                                 <input class="form-check-input" type="checkbox" value="" id="chkOpenedId">
                                                 <label class="form-check-label" for="defaultCheck1">
                                                     Opened
                                                 </label>
                                             </div>
                                         </div>
                                         <div class="col-lg-6 col-12">
                                             <div class="form-check mt-3">
                                                 <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                                 <label class="form-check-label" for="defaultCheck1">
                                                     UP To
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
