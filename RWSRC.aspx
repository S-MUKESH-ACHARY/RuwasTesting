<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="RWSRC.aspx.cs" Inherits="RUWAS.RWSRC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            getTableData();
            getRWSRC();
        })
       
        function getTableData() {
            var data = { 'op': 'FetchRWSRCTableData' }
            var s = function (sms) {
                sms.forEach(function (item) {
                    console.log(item);
                    let row = `<tr>`
                    row = row + `<td class="1" style="display:none">` + item.RWSRCId + `</td>` +
                        `<td class="2">` + item.RWSRCName+ `</td>` +
                        `<td class="3">` + item.CreatedBy+`</td>`+
                        `<td class="4">` + item.CreatedDate+`</td>`+
                        `<td>` + `<button class="btn btn-primary" type="button" onclick="EditDistrict(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button>`+ `</td></tr>`
                    $("#myTable").append(row);
                })
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data,s,e)
        }
        function getRWSRC() {
            var data = { "op": "FetchRWSRCTableData" }
            var s = function (sms) {
                console.log(sms);
                if (Array.isArray(sms)) {
                    let addRWSRC = document.getElementById("slctRWSRCId");
                    sms.forEach(function (item) {
                        let option = document.createElement('option');
                        option.value = item.RWSRCId;
                        option.text = item.RWSRCName;
                        addRWSRC.appendChild(option)
                    })
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function EditDistrict(thisId) {
            
            let Rwsrc = $(thisId).parent().parent().children('.1').html();
            $("#slctRWSRCId").val(Rwsrc);
            let SavedBy = $(thisId).parent().parent().children('.3').html();
            $("#txtSavedById").val(SavedBy);
            let SavedDate = $(thisId).parent().parent().children('.4').html();
            $("#txtSavedDateid").val(SavedDate);
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
                    <li class="breadcrumb-item h6">RWSRC List</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">RWSRC List</div>
                <div class="text-end me-4">
                    <button type="button" class="btn btn-primary" onclick="location.href='NewRWSRC.aspx'">New RWSRC</button>
                </div>
                <div class="card-body">
                    <table id="myTable" class="table table-hover w-100" style="text-align: center;">
                        <thead>
                          <tr class="table-secondary">
                                <th>RWSRC</th>
                                <th>Saved By</th>
                                <th>Save Date</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody class="overflow-scroll">
                             <%-- <tr id="editRow">
                                <td>RWSRC 1</td>
                                <td>eoworinawe</td>
                                <td>2021/09/01</td>
                                <td><button class="btn btn-primary" type="button" onclick="Edit()"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>RWSRC 2</td>
                                <td>eoworinawe</td>
                                <td>2021/09/01</td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>RWSRC 3</td>
                                <td>eoworinawe</td>
                                <td>2021/09/01</td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>RWSRC 4</td>
                                <td>eoworinawe</td>
                                <td>2021/09/01</td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>RWSRC 5</td>
                                <td>eoworinawe</td>
                                <td>2021/09/01</td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>RWSRC 6</td>
                                <td>eoworinawe</td>
                                <td>2021/09/01</td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>TSU 7</td>
                                <td>admin</td>
                                <td>2015/05/21</td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>TSU 8</td>
                                <td>admin</td>
                                <td>2015/05/21</td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>TSU 9</td>
                                <td>aadmin</td>
                                <td>2018/03/23</td>
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
                    <div class="col-lg-6 col-sm-6">
                        <div class="form-floating">
                            <select class="form-select" id="slctRWSRCId" title="RWSRC">
                            </select>
                            <label for="slctRWSRCId">RWSRC <span>*</span></label>
                            <span class="invalid-feedback is-invalid">please select from list</span>
                        </div>
                    </div>
                    <div class="col-lg-6 col-12">
                        <div class="form-floating">
                            <input type="text" id="txtSavedById" class="form-control" placeholder="Saved By" title="Saved By" />
                            <label for="txtSavedById">Saved By</label>
                            <span class="invalid-feedback is-invalid">Please enter saved by</span>
                        </div>
                    </div>
                </div>
                <div class="row m-1 p-1">
                    <div class="col-lg-6 col-12">
                        <div class="form-floating mt-3">
                            <input class="form-control" type="datetime"  id="txtSavedDateid" placeholder="Saved Date" title="Saved Date">
                            <label class="form-check-label" for="txtSavedDateid">
                                Saved Date
                            </label>
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
