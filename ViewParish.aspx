<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="ViewParish.aspx.cs" Inherits="RUWAS.ViewParish" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
         $(function () {
             document.getElementById("administrationId").classList.add("DE");
             LoadParish();
         })
         
         function LoadParish() {
             //let row = '<tr>';
             //row += '<td>Zzitwe</td>';
             
             //row += '<td><input type="text" class="form-control text-center" value="Ssi-Bukunja" /></td>';
             //row += '<td><input type="text" class="form-control text-center" value="Mukono" /></td>';
             
             //row += '<td><button class="btn btn-primary" type="button" onclick="save()">Save</button></td>';
             //row += '</tr>';
             //document.getElementById("editRow").innerHTML = row;
             var data = { 'op': 'LoadParish' };
             var s = function (sms) {
                 sms.forEach(function (item) {
                     var row = `<tr>`
                       row=row+  `<td>` + item.Parish+`</td>`+
                         `<td>` + item.SubCounty+`</td>`+
                           `<td>` + item.District+`</td>`+
                           `<td>` + `<button class="btn btn-primary" type="button" onclick="EditDistrict(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button>`+ `</td></tr>`
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
                    <li class="breadcrumb-item h6">Parish</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info"> View List of Parishes</div>
                <div class="text-end me-4">
                    <button type="button" class="btn btn-primary" onclick="location.href='NewParish.aspx'">New Parish</button>
                </div>
                <div class="card-body">
                <table id="myTable" class="table table-hover w-100" style="text-align: center;">
                    <thead>
                        <tr class="table-secondary">
                            <th class="text-center">Parish</th>
                            <th class="text-center">Sub-County</th>
                            <th class="text-center">District</th>
                            <th class="text-center">Edit</th>
                        </tr>
                    </thead>
                    <tbody class="overflow-scroll">
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </section>
</asp:Content>
