<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="DistrictPerformanceReportsDWSCG.aspx.cs" Inherits="RUWAS.DistrictPerformanceReportsDWSCG" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
        $(function () {
            document.getElementById("reportsId").classList.add("DE");
        })
         function search() {
             var financialYr = $("#financialYrId").val();
             if (financialYr == "") {
                 $("#financialYrId").addClass("is-invalid");
                 $("#financialYrId").focus();
                 return false;
             } else {
                 $("#financialYrId").removeClass("is-invalid");
                 $("#financialYrId").addClass("is-valid");
             }
             var district = $("#districtId").val();
             if (district == "") {
                 $("#districtId").addClass("is-invalid");
                 $("#districtId").focus();
                 return false;
             } else {
                 $("#districtId").removeClass("is-invalid");
                 $("#districtId").addClass("is-valid");
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
            color:red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container-fluid">
        <div class="m-2 pt-2">
            <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='DashBoard.aspx'"></i>&nbsp;&nbsp;Data Entry</li>
                    <li class="breadcrumb-item h6">District Performance Reports (DWSCG)</li>
                </ol>
            </nav>
        </div>
        <div class="d-flix justify-content-between">
            <div>
                <div class="card shadow mb-5 bg-white rounded">
                    <div class="card-header text-center h5 alert alert-info">District Performance Reports (DWSCG)</div>
                    <div class="card-body">
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <div class="row">
                                        <div class="col-lg-3 col-12">
                                            <div class="form-floating">
                                                <select class="form-select" id="slctFinancialYearId" title="Financial Year">
                                                    <option value="">Choose from List</option>
                                                </select>
                                                <label class="slctFinancialYearId">Financial Year <span>*</span></label>
                                                <span class="invalid-feedback is-invalid">please select Financial year</span>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="form-floating">
                                                <select class="form-select" id="districtId" title="District">
                                                    <option value="">Choose from List</option>
                                                </select>
                                                <label>District <span>*</span></label>
                                                <span class="invalid-feedback is-invalid">please select from list</span>
                                            </div>
                                        </div>

                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="row justify-content-between mt-3">
                            <div class="col text-start">
                                <button type="button" class="btn btn-warning" onclick="search()">Search</button>&nbsp;
                                            <button type="button" onclick="location.reload();" class="btn btn-danger">Clear</button>
                            </div>
                            <div class="col text-end">
                                <button type="button" class="btn btn-success ">Export to Excel&nbsp;&nbsp;<i class="fa-solid fa-file-export"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
