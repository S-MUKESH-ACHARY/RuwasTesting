<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="SubTechnologies.aspx.cs" Inherits="RUWAS.SubTechnologies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
         $(function () {
             document.getElementById("administrationId").classList.add("DE");
         })
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
            <nav style="--bs-breadcrumb-divider: '>'" arial-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='AnnualAttachments.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6">SubTechnology</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">View SubTechnology</div>
                <div class="text-end me-4">
                    <button type="button" class="btn btn-primary" onclick="location.href='NewSubTechnology.aspx'">Add New SubTechnology</button>
                </div>
                 <div class="card-body">
                    <table class="table table-hover w-100" style="text-align: center;">
                        <thead>
                            <tr class="table-secondary">
                                
                                <td>Sub-Technology</td>
                                <td>Technology</td>
                                
                            </tr>
                        </thead>
                        <tbody>
                            
                            </tbody>
                        </table>
                     </div>
                
            </div>
        </div>
    </section>
</asp:Content>
