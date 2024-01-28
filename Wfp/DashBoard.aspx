<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="Wfp.DashBoard1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
    
    <%--Bootstrap--%>
    <link href="BootstrapUpdated/bootstrap.min.css" rel="stylesheet" />
    <script src="BootstrapUpdated/bootstrap.min.js"></script>


    <%--popper--%>
    <script src="BootstrapUpdated/popper.min.js"></script>

    <%--JQuery--%>
    <script src="JQuery_Updated/JQuery.js"></script> 

    <%--Font-Awesome updated 6.4.0--%>
    <script src="https://kit.fontawesome.com/f2023d6bb3.js" crossorigin="anonymous"></script>
    <script>
        $(function () {
            scrollTo({
                top: 0
                })
        })
    </script>

    <style>
        .colitem{
            font-size:10px;
            color:#33cee6;
        }
    </style>

   <%-- <script src="charts/chart.js"></script>--%>
   
     <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        


    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="background-color:#d2f4f9">
        <div class="h4 p-2">DashBoard & Statics</div>

        <div class="row mt-3">
            <div class="col-md-6">
                <span class="h6">Facility Information</span>
                <div class="card" style="height:200px">
                 <div class="m-2 p-2 fw-bold" style="color:#33cee6">Number Of Facility</div>
                    
                        <table style="text-align:center;width:100%" class="mt-5">
                            <tr>
                                <td>
                                    <div class="row d-flex justify-content-lg-center">
                                        <div class="col colitem">Operational&nbsp;<i class="fa-solid fa-circle-exclamation fa-sm"></i></div>
                                        <div class="col colitem">Partially Operational&nbsp;<i class="fa-solid fa-circle-exclamation fa-sm"></i></div>
                                        <div class="col colitem">Non Operational&nbsp;<i class="fa-solid fa-circle-exclamation fa-sm"></i></div>
                                        <div class="col colitem">Abandoned&nbsp;<i class="fa-solid fa-circle-exclamation fa-sm"></i></div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                  
                </div>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-6">
               <div class="card">
                    <div class="m-2 p-2 fw-bold" style="color:#33cee6">Type Of Facility</div>
                   <div class="container d-flex justify-content-center" style="height: 430px;">
          <canvas id="myChart" class=""></canvas>
    </div>
                   <script>
                       var ctx = document.getElementById("myChart");
                       var myChart = new Chart(ctx, {
                           type: "pie",
                           data: {
                               labels: ["Valley Tank", "Earth Dam", "Fish Pond", "Irrigation Scheme", "Rural Industry", "Bulk Water","BoreHole"],
                               datasets: [
                                   {
                                       data: [12, 19, 3, 5, 2, 3,8],
                                       backgroundColor: [
                                           "#ff6384",
                                           "#36a2eb",
                                           "#ffce56",
                                           "#4bc0c0",
                                           "#9966ff",
                                           "#ff9f40",
                                           "#8ee4f1"
                                       ],
                                   },
                               ],
                           },
                           options: {
                               responsive: true,
                               legend: {
                                   position: "bottom",
                               },
                               title: {
                                   display: true,
                                   text: "Pie Chart Example",
                               },
                           },
                       });
                   </script>
               </div>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-6">
                <span class="h6">Management Information</span>
                <div class="card mt-1" style="height:200px">
                 <div class="m-2 p-2 fw-bold" style="color:#33cee6">Number Of Facility</div>
                    
                        <table style="text-align:center;width:100%" class="mt-5">
                            <tr>
                                <td>
                                    <div class="row d-flex justify-content-lg-center">
                                        <div class="col colitem">Private Indivisual&nbsp;<i class="fa-solid fa-circle-exclamation fa-sm"></i></div>
                                        <div class="col colitem">Private Operator&nbsp;<i class="fa-solid fa-circle-exclamation fa-sm"></i></div>
                                        <div class="col colitem">Communal Management&nbsp;<i class="fa-solid fa-circle-exclamation fa-sm"></i></div>
                                        <div class="col colitem">Others&nbsp;<i class="fa-solid fa-circle-exclamation fa-sm"></i></div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                  
                </div>
            </div>
        </div>
    </div>
</asp:Content>
