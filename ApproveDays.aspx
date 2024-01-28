<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="ApproveDays.aspx.cs" Inherits="RUWAS.ApproveDays" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
        })
        function edit() {
            var days = '<input type="number" class="form-control" value="30"/>';
            document.getElementById("tsuId").innerHTML = days;
            document.getElementById("btnEdit").style.display = "none";
            document.getElementById("view").style.display = "none";
            document.getElementById("btnSave").style.display = "block";
            document.getElementById("edit").style.display = "block";
        }
        function saveFinal() {
            alert ("Saved Succesfully");
            location.reload();
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
                    <li class="breadcrumb-item h6">Approve Days</li>
                </ol>
            </nav>
             <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info"id="view">View Approve Days</div>
                <div class="card-header text-center h5 alert alert-info" id="edit" style="display:none;">Edit Approve Days</div>
               
                 <div class="card-body ms-3">
                     <table class="table table-borderless text-center w-25">
                         <thead>
                         <tr>
                             <th>Role</th>
                             <th>Days</th>
                             <th>Edit</th>
                         </tr>
                             </thead>
                         <tbody>
                             <tr>
                                 <td>TSU</td>
                                 <td id="tsuId"><label>30</label></td>
                                 <td><button type="button" id="btnEdit" class="btn btn-primary" onclick="edit()"><i class="fas fa-edit"></i></button><button type="button" id="btnSave" style="display:none;" class="btn btn-primary"onclick="saveFinal()">Save</button></td>
                             </tr>
                         </tbody>
                     </table>
                     </div>
                     </div>
                     </div>
        </section>
</asp:Content>
