<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="RUWAS.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            CategoryTable()
        })
        function SaveChanges() {
            var txtCategoriesId = $("#txtCategoriesId").text();
            var txtUnderId = $("#txtUnderId").val();
            var txtBudgetTypeNameId = $("#txtBudgetTypeNameId").val();
            var txtOrderNumberId = $("#txtOrderNumberId").val();
            var txtCategoryNameId = $("#txtCategoryNameId").val();
            var txtCategoryInformationId = $("#txtCategoryInformationId").val();

            var data = {
                "op": "UpdateCategories",
                "txtCategoriesId": txtCategoriesId,
                "txtOrderNumberId": txtOrderNumberId,
                "txtCategoryNameId": txtCategoryNameId,
                "txtCategoryInformationId": txtCategoryInformationId
            }
            var s = function (sms) {
                alert(sms);
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        /*On page load filling the Category table*/
        function CategoryTable() {
            var data = {
                'op':'CategoryData'
            }
            var s = function (sms) {
                sms.forEach(function (item) {
                    var row = `<tr>`
                    row = row + `<td class='1'>` + item.Under+`</td>`+
                        `<td class='2'>` + item.BudgetTypeName+`</td>`+
                        `<td class='3'>` + item.OrderNo+`</td>`+
                        `<td class='4'>` + item.CategoryName+`</td>`+
                        `<td class='5'>` + item.CategoryDescription+`</td>`+
                        `<td class='6' style="display:none;">` + item.CategoryDetailId+`</td>`+
                        `<td>` + `<button type="button" class="btn btn-primary" onclick="EditCategories(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></button>` + `</td></tr>`
                    $("#myTable").append(row);
                })
                $("#myTable").DataTable();
                $(".loader-container").hide();
            }
            var e = function (msg) {
                alert(msg);
                $(".loader-container").hide();
            }
            CallHandler(data, s, e);
            $(".loader-container").show();
        }
        function EditCategories(thisId) {
            let under = $(thisId).parent().parent().children('.1').html();
            $("#txtUnderId").val(under);
            let BudgetTypeName = $(thisId).parent().parent().children('.2').html();
            $("#txtBudgetTypeNameId").val(BudgetTypeName);
            let OrderNo = $(thisId).parent().parent().children('.3').html();
            $('#txtOrderNumberId').val(OrderNo);
            let Category = $(thisId).parent().parent().children('.4').html();
            $('#txtCategoryNameId').val(Category);
            let CategoryDescription = $(thisId).parent().parent().children('.5').html();
            $('#txtCategoryInformationId').val(CategoryDescription);
            let categoryDetailId = $(thisId).parent().parent().children('.6').html();
            $('#txtCategoriesId').html(categoryDetailId);
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='AnnualAttachments.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6">Categories</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">View Categories</div>
                <div class="text-end me-4">
                <button type="button" class="btn btn-primary" onclick="location.href='NewCategories.aspx'">Add New Categories</button>
            </div>
                <div class="card-body" <%--style="overflow:auto;height:450px;"--%>>
                    <table class="table table-hover scrollme" id="myTable">
                    <thead>
                        <tr class="table-secondary"">
                            <th>Under</th>
                            <th>Budget Type</th>
                            <th>Order</th>
                            <th>Category</th>
                            <th>Information of Categories</th>
                            <th style="display:none;">CategoryDtlId</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%--<tr id="editRow">
                            <td>Work plan</td>
                            <td>Non Wage Recurrent</td>
                            <td>1</td>
                            <td>1.Stakeholder coordination</td>
                            <td>Activities enablding coordination of water and sanitation sector stakeholders</td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="Edit()"><i class="fa-solid fa-pen-to-square"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>Work plan</td>
                            <td>Non Wage Recurrent</td>
                            <td>2</td>
                            <td>2.Office reqipment for DWO</td>
                            <td>Procurement and refurbishment office reqipment for the District Water Office</td>
                            <td>
                                <button type="button" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>Work plan</td>
                            <td>Non Wage Recurrent</td>
                            <td>3</td>
                            <td>3.General operational costs for DWO</td>
                            <td>Operation of the District Water Office t</td>
                            <td>
                                <button class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>Work plan</td>
                            <td>Non Wage Recurrent</td>
                            <td>4</td>
                            <td>4.Monitoring and Supervision</td>
                            <td>supervision visits,regular data collection and analysis</td>
                            <td>
                                <button class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>Work plan</td>
                            <td>Non Wage Recurrent</td>
                            <td>5</td>
                            <td>5.O&M for urban water facilities</td>
                            <td>Operation and maintenance of urban water supply systems,channelled thourgth the Districs</td>
                            <td>
                                <button class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i></button>
                            </td>
                        </tr>
                         <tr>
                            <td>Work plan</td>
                            <td>Non Wage Recurrent</td>
                            <td>6</td>
                            <td>6.Software</td>
                            <td>Activities related to the sofTware steps(community mobilistion,WUC formation,training and gollow-up) plus other software activities including prom</td>
                            <td>
                                <button class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i></button>
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
                                    <label style="display:none;" id="txtCategoriesId"></label>
                                    <div class="row p-1 m-1">
                                        <div class="col-lg-4 col-12">
                                            <div class="form-floating">
                                                <input disabled type="text" id="txtUnderId" class="form-control" placeholder="Under" title="Under" />
                                                <label for="txtUnderId">Under</label>
                                                <span class="invalid-feedback is-invalid">Please enter Under</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-12">
                                            <div class="form-floating">
                                                <input disabled type="text" id="txtBudgetTypeNameId" class="form-control" placeholder="Budget Type" title="Budget Type" />
                                                <label  for="txtBudgetTypeNameId">Budget Type</label>
                                                <span class="invalid-feedback is-invalid">Please enter Budget Type</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-12">
                                            <div class="form-floating">
                                                <input type="number" id="txtOrderNumberId" class="form-control" placeholder="Order Number" title="Order Number" />
                                                <label for="txtOrderNumberId">Order Number</label>
                                                <span class="invalid-feedback is-invalid">Please enter Order Number</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row p-1 m-1">
                                        <div class="col-lg-12 col-12">
                                            <div class="form-floating">
                                                <textarea rows="3" style="height:100%;" type="text" id="txtCategoryNameId" class="form-control" placeholder="Category" title="Category"></textarea>
                                                <label for="txtCategoryNameId">Category</label>
                                                <span class="invalid-feedback is-invalid">Please enter Category</span>
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="row p-1 m-1">
                                        <div class="col-lg-12 col-12">
                                            <div class="form-floating">
                                                <textarea rows="3" style="height:100%;" type="text" id="txtCategoryInformationId" class="form-control" placeholder="Category Information" title="Category Information"></textarea>
                                                <label for="txtCategoryInformationId">Category Information</label>
                                                <span class="invalid-feedback is-invalid">Please enter Category Information</span>
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
