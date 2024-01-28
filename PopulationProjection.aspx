<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="PopulationProjection.aspx.cs" Inherits="RUWAS.PopulationProjection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
        })
        function save() {
            alert("Saved Successfully")
            location.reload();
        }
        function edit() {
            let input = '<input type="text" class="form-control" value="4"/>';
            document.getElementById("population").innerHTML = input;
            document.getElementById("btnEdit").style.display = "none";
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
                    <li class="breadcrumb-item h6">Population Projection</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">View Projection Percentage</div>
                <div class="card-body">
                    <%--<table class="table table-hover w-100">
                        <thead class="">
                            <tr class="table-secondary">
                                <th>Population percentage growth</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><label>4</label></td>
                                <td><button type="button" class="btn btn-primary"><i class="fas fa-edit"></i></button></td>
                            </tr>
                        </tbody>
                    </table>--%>
                    <div class="row">
                        <div class="col-3"><label>Population Percentage Growth</label></div>
                        <div class="col-1" id="population"><label>4</label></div>
                        <div class="col-4"><button type="button" id="btnEdit" class="btn btn-primary" onclick="edit()"><i class="fas fa-edit"></i></button>&nbsp;&nbsp;<button type="button" id="btnSave"  class="btn btn-primary" onclick="save()">Save</button></div>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
