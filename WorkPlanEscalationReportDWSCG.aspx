<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="WorkPlanEscalationReportDWSCG.aspx.cs" Inherits="RUWAS.WorkPlanEscalationReportDWSCG" %>
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
     <section class="container-fluid ">
        <div class="m-2 pt-2">
            <nav style="--bs-breadcrumb-divider:'>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='DashBoard.aspx'"></i>&nbsp;&nbsp;Reports</li>
                    <li class="breadcrumb-item h6">Workplan Escalation Report DWSCG</li>
                </ol>
            </nav>
        </div>
        <div class="justify-content-between">
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">Workplan Escalation Report DWSCG</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-4 col-12">
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
                       <div class="col-lg-4 col-12"></div>
                        <div class="col-lg-2 col-12 d-flex justify-content-end mt-1">
                                <i id="toggleSearchId" class="fa-solid fa-magnifying-glass text-end mt-2"style="cursor:pointer;"></i>&nbsp;&nbsp;<input type="text" id="searchContractId" class="form-control" style="border-color:#0D6EFD;height:36px;display:none" placeholder="Search" title="Search"/></div>
                        <div class="col-lg-2 col-12 mt-1">
                           <button type="button" class="btn btn-primary" onclick="search()">Search</button>&nbsp;<button type="button" class="btn btn-info text-light" onclick="location.reload()">Reset Filters</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
           /* toggle functionality for search button*/
            $("#toggleSearchId").click(function () {
                $("#searchContractId").toggle(500);
            })
    </script>
</asp:Content>
