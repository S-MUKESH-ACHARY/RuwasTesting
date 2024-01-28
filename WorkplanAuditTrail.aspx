<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="WorkplanAuditTrail.aspx.cs" Inherits="RUWAS.WorkplanAuditTrail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            getTableData()
        })
        function getTableData() {
            var data = { "op": "FetchWorkplanAuditTrailTable" }
            var s = function (sms) {
                sms.forEach(function (item) {
                    let row = `<tr>`
                    row = row + `<td>` + item.Date+`</td>` +
                        `<td>` + item.UserName+`</td>`+
                        `<td>` + item.Activity+`</td>`+
                        `<td>` + item.Modification+`</td></tr>`
                    $("#myTable").append(row);
                })
                $("#myTable").DataTable();
                $(".loader-container").hide();
            }
            var e = function (msg) {
                alert(msg);
                $(".loader-container").hide();
            }
            CallHandler(data, s, e)
            $(".loader-container").show();
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
                    <li class="breadcrumb-item h6">Work Plan Audit Trail</li>
                </ol>
            </nav>
             <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">Work Plan Audit Trail</div>
               
                 <div class="card-body">
                     <table class="table w-100" id="myTable">
                         <thead>
                             <tr class="table-secondary">
                                 <th class="text-center">Date</th>
                                 <th class="text-center">User Name</th>
                                 <th class="text-center">Activity</th>
                                 <th class="text-center">Modification</th>
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
