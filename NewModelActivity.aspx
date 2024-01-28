<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewModelActivity.aspx.cs" Inherits="RUWAS.NewModelActivity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            fetchUnder();
            addNewRow();
        })
        function fetchUnder() {
            let data = { "op": "UnderOfCategory" };
            let s = function (sms) {

                if (Array.isArray(sms)) {
                    let under = document.getElementById("slctUnderId");
                    sms.forEach((msg) => {
                        let option = document.createElement('option');
                        option.value = msg.BudgetTypeId;
                        option.text = msg.Under;
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
            alert(slctUnder);
            let data = { "op": "BudgetTypeOfUnder", "slctUnder": slctUnder };

            let s = function (sms) {
                if (Array.isArray(sms)) {
                    let budgetType = document.getElementById("slctBudgetTypeId");
                    budgetType.innerHTML = "";
                    let option1 = document.createElement('option');
                    option1.value ="";
                    option1.text = "Choose From List";
                    budgetType.append(option1);
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
        function categoryOfBudgetType() {
            var data = { 'op': 'CategoryOfBudgetType' };
            var s = function (sms) {
                alert(sms);
                let Category = document.getElementById('slctCategoryId');
                Category.innerHTML = "";
                let option1 = document.createElement('option');
                option1.value = "";
                option1.text = "Choose From List";
                Category.append(option1);
                if (Array.isArray(sms)) {
                    sms.forEach(function (item) {
                        let option = document.createElement('option');
                        option.value = item.BudgetTypeId;
                        option.text = item.BudgetType;
                        Category.append(option);
                    })
                }
            }
            var e = function (msg) {alert(msg)}
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
        function saveMActivity() {
            let slctUnder = $("#slctUnderId option:selected").text();
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
            let slctCategory = $("#slctCategoryId").val();
            if (slctCategory == "") {
                $("#slctCategoryId").addClass("is-invalid");
                $("#slctCategoryId").focus();
                return false;
            } else {
                $("#slctCategoryId").removeClass("is-invalid");
                $("#slctCategoryId").addClass("is-valid");
            }
            var ModelActivityDtlList = [];
            $("#ModelActivityTableId>tbody>tr").each(function () {
                let txtOrder = $(this).find("#txtOrderId").val();
                let txtNo = $(this).find("#txtNoId").val();
                let txtModelActivityName = $(this).find("#txtModelActivityNameId").val();
                let txtModelActivityDescription = $(this).find("#txtModelActivityDescriptionId").val();
                let txtunitTarget = $(this).find("#txtunitTargetId").val();
                ModelActivityDtlList.push({ txtOrder: txtOrder, txtNo: txtNo, txtModelActivityName: txtModelActivityName, txtModelActivityDescription: txtModelActivityDescription, txtunitTarget: txtunitTarget });
            })
            var data = {
                "op": "SaveModelActivity",
                "slctUnder": slctUnder,
                "slctBudgetType": slctBudgetType,
                "slctCategory": slctCategory,
                "ModelActivityDtlList": ModelActivityDtlList
            }
            var s = function (sms) {
                alert(sms);
            }
            var e = function (msg) {
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
            row += '<td><input id="txtOrderId" type="number" class="form-control" placeholder="0"/></td>';
            row += '<td><input id="txtNoId" class="form-control" type="text"/></td>';
            row += '<td><textarea id="txtModelActivityNameId" class="form-control" type="text"></textarea></td>';
            row += '<td><textarea id="txtModelActivityDescriptionId" class="form-control" type="text"></textarea></td>';
            row += '<td><textarea id="txtunitTargetId" class="form-control" type="text"></textarea></td>';
            row += '<td><div class="d-flex"><button type="button" class="btn btn-light" onclick = "addNewRow()"><i class="fa-solid fa-circle-plus fa-1x"></i></button ><button type="button" class="btn btn-light" onclick="removeNewRow(this)"><i class="fa-solid fa-circle-minus fa-1x"></i></button></div></td>';
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='ModelActivity.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6 active">Model Activity</li>
                    <li class="breadcrumb-item h6">New Model Activity</li>
                </ol>
            </nav>
        </div>
                <div class="card shadow mb-5 bg-white rounded">
                     <div class="card-header text-center h5 alert alert-info">New Model Activity</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3 col-12">
                                <div class="form-floating">
                                    <select id="slctUnderId" class="form-select" onchange="budgetTypeOfUnder();" title="Under">
                                    <option value="">Choose from List</option>
                                    </select>
                                    <label for="slctUnderId">Under</label>
                                    <span class="invalid-feedback is-invalid">Please select from list</span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-12">
                                <div class="form-floating">
                                    <select id="slctBudgetTypeId" class="form-select" title="BudgetType" onchange="categoryOfBudgetType()">
                                    <option value="">Choose from List</option>
                                    </select>
                                    <label for="slctBudgetTypeId">Budget Type</label>
                                    <span class="invalid-feedback is-invalid">Please select from list</span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-12">
                                <div class="form-floating">
                                    <select id="slctCategoryId" class="form-select" title="Category">
                                    <option value="">Choose from List</option>
                                    </select>
                                    <label for="slctCategoryId">Category</label>
                                    <span class="invalid-feedback is-invalid">Please select from list</span>
                                </div>
                            </div>
                        </div>
                        
                        <table id="ModelActivityTableId" width:100%; class="table table-bordered mt-3">
                            <thead>
                               <tr class="table-secondary">
                                   <th class="text-center">Order</th>
                                   <th class="text-center">No</th>
                                   <th class="text-center">Model activities predefined in the annual workplan format</th>
                                   <th class="text-center">Information on activities</th>
                                   <th class="text-center">Unit for targets</th>
                                   <th class="text-center">Add/Delete</th>
                               </tr>
                            </thead>
                            <tbody id="tbodyId">
                                <%--<tr>
                                    <td><input type="number" class="form-control" /></td>
                                    <td><input type="text" class="form-control" /></td>
                                    <td><textarea type="text" class="form-control"></textarea></td>
                                    <td><textarea type="text" class="form-control"></textarea></td>
                                    <td><textarea type="text" class="form-control"></textarea></td>
                                    <td><div class="d-flex">
                                <button type="button" class="btn btn-light" onclick="addNewRow()"><i class="fa-solid fa-circle-plus fa-1x"></i></button><button type="button" class="btn btn-light" onclick="removeNewRow(this)"><i class="fa-solid fa-circle-minus fa-1x"></i></button>
                                </div></td>
                                </tr>--%>
                            </tbody>
                        </table>
                        </div>
                    <div class="text-center">
                        <button id="btnSave" type="button" class="btn btn-primary mb-3" onclick="saveMActivity()">Save</button>
                    </div>
                </div>
    </section>
</asp:Content>
