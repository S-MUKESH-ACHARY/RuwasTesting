<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="EventLog.aspx.cs" Inherits="RUWAS.EvenntLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
         $(function () {
             document.getElementById("administrationId").classList.add("DE");
             getTableData()
         })
        function getTableData() {
            var data = { "op": "FetchEventLogTable"}
            var s = function (sms) {
                sms.forEach(function (item) {
                    var row = `<tr>`
                    row = row + `<td>` + item.EventDate+ `</td>` +
                        `<td>` + item.UserName+`</td>`+
                        `<td>` + item.Module+`</td>`+
                        `<td>` + item.Action+`</td>`+
                        `<td>` + item.Details+ `</td></tr>`
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='AnnualAttachments.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6">Event Log</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">View Event Log</div>
                <div class="card-body">
                    <table class="table table-hover w-100" id="myTable" <%--style="text-align: center;"--%>>
                        <thead>
                            <tr class="table-secondary">
                                <th style="text-align: center;">Date</th>
                                <th style="text-align: center;">User Name</th>
                                <th style="text-align: center;">Module</th>
                                <th style="text-align: center;">Action</th>
                                <th style="text-align: center;">Details</th>
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
