<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="BudgetType.aspx.cs" Inherits="RUWAS.BudgetType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            getTableData();
            fetchUnder();
        })
        function SaveChanges() {
            let BudgetType = $("#txtBudgetTypeNameId").val();
            let UnderId = $("#slctUnderId").val();
            let BudgetTypeId = $("#txtBudgetTypeId").html();
            let IsDisabled = 0;
            let chkValue = $("#chkDisabled");
            if (chkValue.is(":checked")) {
                IsDisabled = 1;
            }
            var data = {
                "op": "UpdateBudgetType",
                "BudgetType": BudgetType,
                "UnderId": UnderId,
                "BudgetTypeId": BudgetTypeId,
                "IsDisabled": IsDisabled
            }
            var s = function (sms) {
                alert(sms);
            }
            var e = function (msg) {
                alert(msg);
            }
            console.log(data);
            CallHandler(data, s, e);
            location.reload();
        }
        function getTableData() {
            var data = { 'op': 'FetchBudgetTypeTable' }
            var s = function (sms) {

                sms.forEach(function (item) {
                    let IsDelete = item.IsDeleted;
                    var row = `<tr>` +
                        `<td style="display:none;" class="1">` + item.BudgetTypeId + `</td>` +
                        `<td class="2">` + item.BudgetTypeName + `</td>` +
                        `<td class="3">` + item.BudgetUnder + `</td>` +
                        `<td class="4" style="display:none;">` + item.UnderId + `</td>` +
                        `<td class="5">` + `<input type="checkbox" class="form-check-input" ${IsDelete == 1 ? 'checked' : ''} />` + `</td>` +
                        `<td>` + `<button class="btn btn-primary" type="button" onclick="EditBudgetType(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button>` + `</td></tr>`;
                    $("#myTable").append(row);
                })
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function EditBudgetType(thisId) {
            let BudgetTypeId = $(thisId).closest('tr').find('.1').html();
            $("#txtBudgetTypeId").html(BudgetTypeId);
            let BudgetType = $(thisId).closest('tr').find('.2').html();
            $("#txtBudgetTypeNameId").val(BudgetType);
            let Under = $(thisId).closest('tr').find('.4').html();
            $("#slctUnderId").val(Under);
            let Disabled = $(thisId).closest('tr').find('.5 input').is(":checked");
            $("#chkDisabled").prop('checked', Disabled);
            //let row = $(thisId).closest('td').children('.chkbox').prop('checked');
            //console.log(row);
            //$("#myTable .chkbox").each(function (index) {
            //    if ($(this).prop('checked')) {
            //        alert("true");
            //    } else {
            //        alert("false");
            //    }
            //})
            
        }
        function fetchUnder() {
            let data = { "op": "FetchUnder" };
            let s = function (sms) {
                if (Array.isArray(sms)) {
                    let under = $("#slctUnderId");
                    sms.forEach(function (msg) {
                        let option = document.createElement("option");
                        option.value = msg.budgetId;
                        option.text = msg.under;
                        under.append(option);
                    })
                } else {
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
        label, th, td {
            /*font-size:17px;*/
            font-weight: 500;
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
            <nav style="--bs-breadcrumb-divider: '>'" arial-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='AnnualAttachments.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6">Budget Type</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">View Budget Type</div>
                <div class="text-end me-4">
                    <button type="button" class="btn btn-primary" onclick="location.href='NewBudgetType.aspx'">Add New Budget</button>
                </div>
                <div class="card-body">
                    <table id="myTable" class="table table-hover w-100" style="text-align: center;">
                        <thead>
                            <tr class="table-secondary">
                                <th>Budget Type</th>
                                <th>Under</th>
                                <th>Disabled</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <%--Modal for Edit--%>
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content">
                                <div class="modal-header alert alert-info justify-content-center">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Budget Type</h1>
                                </div>
                                <div class="modal-body">
                                    <label id="txtCategoriesId"></label>
                                    <div class="row p-1 m-1">
                                        <label style="display: none;" id="txtBudgetTypeId"></label>
                                        <div class="col-lg-4 col-12">
                                            <div class="form-floating">
                                                <input type="text" id="txtBudgetTypeNameId" class="form-control" placeholder="Budget Type" title="Budget Type" />
                                                <label for="txtBudgetTypeNameId">Budget Type</label>
                                                <span class="invalid-feedback is-invalid">Please enter Budget Type</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-12">
                                            <div class="form-floating">
                                                <select class="form-select" id="slctUnderId" title="Under">
                                                    <option value="">Choose from List</option>
                                                </select>
                                                <label for="slctUnderId">Under</label>
                                                <span class="invalid-feedback is-invalid">Please select from list</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-12">
                                            <div class="form-check mt-3">
                                                <input class="form-check-input" type="checkbox" value="" id="chkDisabled">
                                                <label class="form-check-label" for="chkDisabled">
                                                    Dsabled
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="SaveChanges()">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
