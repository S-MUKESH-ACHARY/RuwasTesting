<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="Validation.aspx.cs" Inherits="RUWAS.Validation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
const { selectors } = require("sizzle");

        $(function () {
            document.getElementById("administrationId").classList.add("DE");
        })
        function saveValidation() {
            alert("savd successfully");
            location.reload()
        }
        function getForm() {
            let slctform = $("#slctFormId").val()
            if (slctform == "category") {
                $("#category").css("display", "block");
            } else {
                $("#category").css("display", "none");
            }
            if (slctform == "district") {
                $("#district").css("display", "block");
            } else {
                $("#district").css("display", "none");
            }
            if (slctform == "financialYear") {
                $("#financialYear").css("display", "block");
            } else {
                $("#financialYear").css("display", "none");
            }
            if (slctform == "fundingSource") {
                $("#fundingSource").css("display", "block");
            } else {
                $("#fundingSource").css("display", "none");
            }
            if (slctform == "lc") {
                $("#lc").css("display", "block");
            } else {
                $("#lc").css("display", "none");
            }
            if (slctform == "parish") {
                $("#parish").css("display", "block");
            } else {
                $("#parish").css("display", "none");
            }
            if (slctform == "populationProjection") {
                $("#populationProjection").css("display", "block");
            } else {
                $("#populationProjection").css("display", "none");
            }
            if (slctform == "tsu") {
                $("#tsu").css("display", "block");
            } else {
                $("#tsu").css("display", "none");
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='AnnualAttachments.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6">Validation</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">Validation</div>
                <div class="card-body">
                    <div class="form-floating w-25 mb-3">
                        <select id="slctFormId" class="form-select" title="Form" onchange="getForm()">
                            <option value="">Choose from list</option>
                            <option value="category">Category</option>
                            <option value="district">District</option>
                            <option value="financialYear">FInancial Year</option>
                            <option value="fundingSource">Funding Source</option>
                            <option value="lc">LC</option>
                            <option value="parish">Parish</option>
                            <option value="populationProjection">Population Projection</option>
                            <option value="tsu">TSU</option>
                        </select>
                        <label>Form</label>
                    </div>
                    <div id="category" style="display: none;">
                        <table class="table table-hover w-100">
                            <thead class="table-secondary">
                                <tr>
                                    <th>Caption</th>
                                    <th>Required</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Budget Type Name</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" checked /></td>
                                </tr>
                                <tr>
                                    <td>Category</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" checked /></td>
                                </tr>
                                <tr>
                                    <td>Category information</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" checked /></td>
                                </tr>
                                <tr>
                                    <td>Under</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="district" style="display: none;">
                        <table class="table table-hover">
                            <thead class="table-secondary">
                                <tr>
                                    <th>Caption</th>
                                    <th>Required</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>District Name</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" checked /></td>
                                </tr>
                                <tr>
                                    <td>TSU</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" /></td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                    <div id="financialYear" style="display: none;">
                        <table class="table table-hover">
                            <thead class="table-secondary">
                                <tr>
                                    <th>Caption</th>
                                    <th>Required</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Financial Year</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" checked /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="fundingSource" style="display: none;">
                        <table class="table table-hover">
                            <thead class="table-secondary">
                                <tr>
                                    <th>Caption</th>
                                    <th>Required</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Funding Source</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" checked /></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div id="lc" style="display: none;">
                        <table class="table table-hover">
                            <thead class="table-secondary">
                                <tr>
                                    <th>Caption</th>
                                    <th>Required</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>LC Name</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" checked /></td>
                                </tr>
                                <tr>
                                    <td>Parish</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" checked /></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div id="parish" style="display: none;">
                        <table class="table table-hover">
                            <thead class="table-secondary">
                                <tr>
                                    <th>Caption</th>
                                    <th>Required</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Parish Name</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" checked /></td>
                                </tr>
                                <tr>
                                    <td>Sub-county</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" checked /></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div id="populationProjection" style="display: none;">
                        <table class="table table-hover">
                            <thead class="table-secondary">
                                <tr>
                                    <th>Caption</th>
                                    <th>Required</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Percentage</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" checked /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="tsu" style="display: none;">
                        <table class="table table-hover">
                            <thead class="table-secondary">
                                <tr>
                                    <th>Caption</th>
                                    <th>Required</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Tsu Name</td>
                                    <td>
                                        <input type="checkbox" class="form-check-input" checked /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="d-flex justify-content-center">
                        <button type="button" class="btn btn-primary" onclick="saveValidation()">Save</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
