<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewCategories.aspx.cs" Inherits="RUWAS.NewCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            fetchUnder();
            addNewRow();
        })
        function saveCategory() {
            let slctUnder = $("#slctUnderId").val();
            if (slctUnder == "") {
                $("#slctUnderId").addClass("is-invalid");
                $("#slctUnderId").focus();
                return false;
            } else {
                $("#slctUnderId").removeClass("is-invalid");
                $("#slctUnderId").addClass("is-valid");
            }
            let slctBudgetType = $("#slctBudgetTypeId").val();
            if (slctBudgetType == "") {
                $("#slctBudgetTypeId").addClass("is-invalid");
                $("#slctBudgetTypeId").focus();
                return false;
            } else {
                $("#slctBudgetTypeId").removeClass("is-invalid");
                $("#slctBudgetTypeId").addClass("is-valid");
            }

            var CategoryDetailList = [];
            $("#categoryDtlTableId>tbody>tr").each(function () {
                let orderId = $(this).find("#orderId").val();
                let CategoryNameId = $(this).find("#txtCategoryNameId").val();
                let categoriesDtlId = $(this).find("#txtCategoriDtlId").val();
                CategoryDetailList.push({ orderId: orderId, CategoryNameId: CategoryNameId, categoriesDtlId: categoriesDtlId });
            })

            let data = {
                "op": "SaveCategories",
                "slctUnder": slctUnder,
                "slctBudgetType": slctBudgetType,
                "CategoryDetailList": CategoryDetailList,
            }
            console.log(data);
            let s = function (sms) {
                alert(sms);
            }
            let e = function (msg) {
                alert(msg);
            }
            CallHandlerUsingJson_POST(data, s, e)
        }
        function CallHandlerUsingJson_POST(d, s, e) {
            d = JSON.stringify(d);
            d = encodeURIComponent(d);
            $.ajax({
                type: "POST",
                url: "RuwasHandler.axd",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: d,
                async: true,
                cache: true,
                success: s,
                error: e
            });
        }
        function addNewRow() {
            let row = '<tr>';
            row += '<td><input id="orderId" type="number" class="form-control"/></td>';
            row += '<td><textarea id="txtCategoryNameId" class="form-control" type="text"></textarea></td>';
            row += '<td><textarea id="txtCategoriDtlId" class="form-control" type="text"></textarea></td>';
            row += '<td><div class="d-flex justify-content-center mt-2"><button type="button" class="btn btn-light" onclick = "addNewRow()"><i class="fa-solid fa-circle-plus fa-1x"></i></button>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-light" onclick="removeNewRow(this)"><i class="fa-solid fa-circle-minus fa-1x"></i></button></div></td>';
            row += '</tr>';
            $("#tbodyId").append(row);
        }
        function removeNewRow(child) {
            let rowLength = document.getElementById("tbodyId").rows.length;
            if (rowLength == 1) {
                alert("First row can't be deleted");
                return;
            } else {
                child.parentNode.parentNode.parentNode.remove();
            }
        }
        function fetchUnder() {
            let data = { "op": "FetchUnder" };
            let s = function (sms) {

                if (Array.isArray(sms)) {
                    let under = document.getElementById("slctUnderId");
                    sms.forEach((msg) => {
                        let option = document.createElement('option');
                        option.value = msg.budgetId;
                        option.text = msg.under;
                        under.appendChild(option);
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
        function budgetTypeOfUnder() {
            let slctUnder = document.getElementById("slctUnderId").value;
            let data = { "op": "BudgetTypeOfUnder", "slctUnder": slctUnder };

            let s = function (sms) {
                if (Array.isArray(sms)) {
                    let budgetType = document.getElementById("slctBudgetTypeId");
                    budgetType.innerHTML = "";
                    sms.forEach((msg) => {
                        let option = document.createElement('option');
                        option.value = msg.BudgetTypeId;
                        option.text = msg.BudgetTypeName;
                        budgetType.appendChild(option);
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
                success: s,
                error: e,
                data: d
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
            <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='Categories.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6 active">Categories</li>
                    <li class="breadcrumb-item h6">New Categories</li>
                </ol>
            </nav>
        </div>
        <div class="card shadow mb-5 bg-white rounded">
            <div class="card-header text-center h5 alert alert-info">New Categories</div>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-3 col-12">
                        <div class="form-floating">
                            <select id="slctUnderId" class="form-select" title="Under" onchange="budgetTypeOfUnder()">
                                <option value="">Choose from List</option>
                            </select>
                            <label for="slctUnderId">Under</label>
                            <span class="invalid-feedback is-invalid">Please select from list</span>
                        </div>
                    </div>
                    <div class="col-lg-3 col-12">
                        <div class="form-floating">
                            <select id="slctBudgetTypeId" class="form-select" title="Under">
                                <option value="">Choose from List</option>

                            </select>
                            <label for="slctBudgetTypeId">Budget Type</label>
                            <span class="invalid-feedback is-invalid">Please select from list</span>
                        </div>
                    </div>

                </div>

                <table id="categoryDtlTableId" class="table table-hover p-1 mt-5" style="text-align: center; width: 100%;">
                    <thead>
                        <tr class="table-secondary">
                            <th>Order</th>
                            <th>Categories</th>
                            <th>Information on Categories</th>
                            <th>Add/Delete</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyId">
                           <%-- <tr>
                                    <td><input type="text" id="orderId" class="form-control" /></td>
                                    <td><textarea type="text" id="txtCategorisId" class="form-control"></textarea></td>
                                    <td><textarea type="text" id="txtCategoriDtlId" class="form-control"></textarea></td>
                                    <td>
                                        <div class="d-flex justify-content-center mt-2">
                                <button type="button" class="btn btn-light" onclick="addNewRow()"><i class="fa-solid fa-circle-plus fa-1x"></i></button>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-light" onclick="removeNewRow(this)"><i class="fa-solid fa-circle-minus fa-1x"></i></button>
                                  </div>
                                </td>
                           </tr>--%>
                    </tbody>
                </table>
            </div>
            <div class="text-center">
                <button id="btnSave" type="button" class="btn btn-primary mb-3" onclick="saveCategory()">Save</button>
            </div>
        </div>
    </section>
</asp:Content>
