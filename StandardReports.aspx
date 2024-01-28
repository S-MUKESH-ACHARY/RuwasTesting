<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="StandardReports.aspx.cs" Inherits="RUWAS.StandardReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        label,th,td,li{
            /*font-size:17px;*/
            font-weight:500;
        }
        span {
            font-size: 13px;
            font-weight: bold;
        }
    </style>
    <script>
        $(function () {
            document.getElementById("reportsId").classList.add("DE");
        })
        function search() {
            var reportName = $("#reportNameId").val();
            if (reportName == "") {
                $("#reportNameId").addClass("is-invalid");
                $("#reportNameId").focus();
                return false;
            } else {
                $("#reportNameId").removeClass("is-invalid");
                $("#reportNameId").addClass("is-valid");
            }
            var rWSRC = $("#rwsrcId").val();
            if (rWSRC == "") {
                $("#rwsrcId").addClass("is-invalid");
                $("#rwsrcId").focus();
                return false;
            } else {
                $("#rwsrcId").removeClass("is-invalid");
                $("#rwsrcId").addClass("is-valid");
            }
            var localGovernment = $("#localGovernmentId").val();
            if (localGovernment == "") {
                $("#localGovernmentId").addClass("is-invalid");
                $("#localGovernmentId").focus();
                return false;
            } else {
                $("#localGovernmentId").removeClass("is-invalid");
                $("#localGovernmentId").addClass("is-valid");
            }
            var financialYr = $("#financialYrId").val();
            if (financialYr == "") {
                $("#financialYrId").addClass("is-invalid");
                $("#financialYrId").focus();
                return false;
            } else {
                $("#financialYrId").removeClass("is-invalid");
                $("#financialYrId").addClass("is-valid");
            }
            
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container-fluid">
        <div class="m-2 pt-2">
            <nav style="--bs-breadcrumb-divider:'>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='DashBoard.aspx'"></i>&nbsp;&nbsp;Reports</li>
                    <li class="breadcrumb-item h6 text-primary-emphasis">Standard Reports</li>
                </ol>
            </nav>
        </div>
        <div class="justify-content-between">
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">Standard Reports</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <select class="form-select" id="reportNameId">
                                    <option value="">Select from list</option>
                                    <option value="value">Example One</option>
                                    <option value="value">Example Two</option>
                                    <option value="value">Example Three</option>
                                </select>
                                <label for="reportNameId">Report Name</label>
                                <span class="invalid-feedback is-invalid" id="errreportNameId">please choose any one</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <select class="form-select" id="rwsrcId">
                                    <option value="">Select from list</option>
                                    <option value="value">Example One</option>
                                    <option value="value">Example Two</option>
                                    <option value="value">Example Three</option>
                                </select>
                                <label for="rwsrcId">RWSRC</label>
                                <span class="invalid-feedback is-invalid" id="errrwsrcId">please select from list</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <select class="form-select" id="localGovernmentId">
                                    <option value="">Select from list</option>
                                    <option value="value">Example One</option>
                                    <option value="value">Example Two</option>
                                    <option value="value">Example Three</option>
                                </select>
                                <label for="localGovernmentId">Local Government</label>
                                <span class="invalid-feedback is-invalid" id="errlocalGovernmentId">please select from list</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                 <select id='financialYrId' class="form-select" title="Financial Year">
                                   <option value="">Select Year</option>
                                   <option value="1">2023</option>
                                   <option value="2">2024</option>
                                 </select>
                                <label for="financialYrId">Financial Year</label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                        </div>
                    <div class="d-flex justify-content-end mt-3 col-6"><i style="cursor:pointer;" id="toggleSearchId" class="fa-solid fa-magnifying-glass mt-3"></i>&nbsp;&nbsp;
                        <input type="text" id="searchContractId" class="form-control" style="border-color:#0D6EFD;border-width:2px" placeholder="Search" title="Search" />&nbsp;&nbsp;
                        <button type="button" class="btn btn-primary" onclick="search()">Generate&nbsp;Reports</button>&nbsp;&nbsp;
                        <button type="button" class="btn btn-info text-light" onclick="location.reload()">Reset&nbsp;Filters</button>
                    </div> 
                       
                        </div>
                    <div class="row justify-content-between mt-3">
                            <div class="col text-start">
                            <button type="button" class="btn btn-success">Export Current Page to Excel&nbsp;&nbsp;<i class="fa-solid fa-file-export"></i></button>&nbsp;
                                            <button type="button" class="btn btn-success ">Export All to Excel&nbsp;&nbsp;<i class="fa-solid fa-file-export"></i></button>
                                </div>
                            <div class="col text-end">
                                           <button type="button" onclick="window.print();" class="btn btn-secondary">Print&nbsp;&nbsp;<i class="fa-solid fa-print"></i></button> 
                                </div>
                        </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        $(document).ready(function () {
            $("#searchContractId").hide();
            $("#toggleSearchId").click(function () {
                $("#searchContractId").toggle(1000);
            })
        })
        </script>
</asp:Content>
