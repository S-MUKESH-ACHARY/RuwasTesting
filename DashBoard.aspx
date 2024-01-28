<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="RUWAS.DashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="UpdatedJQuery/jQuery.min.js"></script>
    <script>
        $(function () {
            document.getElementById("dataEntryId").classList.add("DE");
        })
    </script>
     <style>
         .card:hover {
            box-shadow: 6px 6px 6px 1px rgba(0, 0, 0,0.4);
            transform: scale(1);
         }

        .card,.card-body {
            transition: .5s ease;
            box-shadow:1px 2px 1px 1px rgba(0,0,0,0.2);
            border-color:#0059b3;
            border-width:1px;
        }

        .card-body{
          border-end-end-radius:5px 5px;
          border-end-start-radius:5px 5px;
          cursor:pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container-fluid">
        <div class="row p-1 mb-2 ms-4">
            <div class="col-lg-3 col-6" onclick="location.href='AnnualWorkplanDWSCG.aspx'">

                <div class="card" style="height: 10rem; width: 15rem">

                    <div class="card-header text-center p-2" style="background-image: url(RUWASAssets/7W.png); background-size: cover; background-position: top; height: 25rem;">
                    </div>
                    <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 14px;">DWSCG Annual Workplan</div>
                </div>
            </div>
             <div class="col-lg-3 col-6 mb-3" onclick="location.href='SanitationAnnualWorkPlanDSHCG.aspx'">

                <div class="card" style="height: 10rem; width: 15rem">

                    <div class="card-header text-center p-2" style="background-image: url(RUWASAssets/6W.png); background-size: cover; background-position: top; height: 25rem;">
                    </div>
                    <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 14px;">DSHCG Annual Workplan</div>
                </div>
            </div>
            <div class="col-lg-3 col-6 mb-3" onclick="location.href='ProgressReportDWSCG.aspx'">
                <div class="card" style="height: 10rem; width: 15rem">
                    <div class="card-header text-center p-2" style="background-image: url(RUWASAssets/1W.png); background-size: cover; background-position: top; height: 25rem;">
                    </div>
                    <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 14px;">Progress Report DWSCG</div>
                </div>
            </div>
            <div class="col-lg-3 col-6 mb-3" onclick="location.href='ProgressReportDSHCG.aspx'">

                <div class="card" style="height: 10rem; width: 15rem">

                    <div class="card-header text-center p-2" style="background-image: url(RUWASAssets/2W.png); background-size: cover; background-position: top; height: 25rem;">
                    </div>
                    <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 14px;">Progress Report DSHCG</div>
                </div>
            </div>
            
           
            
            </div>
        <div class="row p-1 ms-4">
            <div class="col-lg-3 col-6" onclick="location.href='ApplyForVariations.aspx'">

                <div class="card" style="height: 10rem; width: 15rem">

                    <div class="card-header text-center p-2" style="background-image: url(RUWASAssets/8W.png); background-size: cover; background-position: top; height: 25rem;">
                    </div>
                    <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 14px;">Apply for Variations</div>
                </div>
            </div>
           
             <div class="col-lg-3 col-6" onclick="location.href='QuarterlyAttachments.aspx'">

                <div class="card" style="height: 10rem; width: 15rem">

                    <div class="card-header text-center p-2" style="background-image: url(RUWASAssets/3W.png); background-size: cover; background-position: top; height: 25rem;">
                    </div>
                    <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 14px;">Quarterly Attachments</div>
                </div>
            </div>
            <div class="col-lg-3 col-6" onclick="location.href='AnnualAttachments.aspx'">

                <div class="card" style="height: 10rem; width: 15rem">

                    <div class="card-header text-center p-2" style="background-image: url(RUWASAssets/4W.png); background-size: cover; background-position: top; height: 25rem;">
                    </div>
                    <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 14px;">Annual Attachments</div>
                </div>
            </div>
             <div class="col-lg-3 col-6 mb-3" onclick="location.href='Contracts.aspx'">

                <div class="card" style="height: 10rem; width: 15rem">

                    <div class="card-header text-center p-2" style="background-image: url(RUWASAssets/5W.png); background-size: cover; background-position: top; height: 25rem;">
                    </div>
                    <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 14px;">Contracts</div>
                </div>
            </div>
            <%--<div class="col-lg-2 col-4 m-3 p-2" onclick="location.href='DistrictPerformanceReportsDSHCG.aspx'">

                <div class="card" style="height: 10rem; width: 15rem">

                    <div class="card-header text-center p-2" style="background-image: url(RUWASAssets/9W.png); background-size: cover; background-position: top; height: 25rem;">
                    </div>
                    <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 14px;">District Performance Reports DSHCG</div>
                </div>
            </div>
            <div class="col-lg-2 col-4 m-3 p-2" onclick="location.href='DistrictPerformanceReportsDWSCG.aspx'">

                <div class="card" style="height: 10rem; width: 15rem">

                    <div class="card-header text-center p-2" style="background-image: url(RUWASAssets/10W.png); background-size: cover; background-position: top; height: 25rem;">
                    </div>
                    <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 14px;">District Performance Reports DWSCG</div>
                </div>
            </div>--%>
        </div>
    </section>
</asp:Content>
