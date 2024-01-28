<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="QuarterlyAttachments.aspx.cs" Inherits="RUWAS.QuarterlyAttachments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("dataEntryId").classList.add("DE");
            getTableData();
        })
        function getTableData (){
            var data = { 'op': 'QuarterlyAttachmentData' }
            var s = function (sms) {
                sms.forEach(function (item) {
                    var row = `<tr>`
                    row = row + `<td>` + item.FinancialYr+`</td>`+
                        `<td>` + item.LC+`</td>`+
                        `<td>` + item.NewRehabitation+`</td>`+
                        `<td>` + item.Quarter+`</td>`+
                        `<td>` + item.Teachnology+`</td>`+
                        `<td>` + item.SubCounty+`</td>`+
                        `<td>` + item.Parish+`</td>`+
                        `<td>` + item.Village+`</td>`+
                        `<td>` + item.SourceNumber+`</td>`+
                        `<td>` + item.NameOfWaterSource+`</td>`+
                        `<td>` + item.Easting+`</td>`+
                        `<td>` + item.Northing+`</td>`+
                        `<td>` + item.InvestmentCostUgx+`</td>`+
                        `<td>` + item.SourceOfFunding+`</td>`+
                        `<td>` + `<button class="btn btn-primary" type="button" onclick="EditDistrict(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button>`+ `</td></tr>`
                    $("#myTable").append(row);
                })
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
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
      label,th,td,li{
           /* font-size:14px;*/
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
            <nav class="row" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <div class="col">
            <ol class="breadcrumb d-flex justify-content-start mt-2">
                <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='DashBoard.aspx'"></i>&nbsp;&nbsp;Data Entry</li>
                <li class="breadcrumb-item h6">Quarterly Attachments</li>
            </ol></div>
                <div class="col d-flex justify-content-end m-2">
                    <button type="button" id="newAttachmentId" onclick="location.href='NewQuaterlyAttachment.aspx'" class="btn text-light" style="background-color:#0059b3"> New Attachment</button>
                </div>
        </nav>
        <div class="card shadow mb-5 bg-white rounded">

      
        <div class="text-center h5 card-header alert alert-info">Quarterly Attachment</div>
            <div clss="card-body">
                <div style="overflow:auto;height:400px;" class="mb-4">   
                <table id="myTable" class="table table-hover" style="text-align:center;">
                        <tr class="table-secondary" style="position:sticky;top:0;">
                            <th>Financial Year</th>
                            <th>Local Government</th>
                            <th>Category</th>
                            <th>Quater</th>
                            <th>Technology</th>
                            <th>Subcounty</th>
                            <th>Parish</th>
                            <th>Village/LC</th>
                            <th>Source Number</th>
                            <th>Name of Water Source</th>
                            <th>Eastings</th>
                            <th>Northings</th>
                            <th>Investment Cost UGX(000)</th>
                            <th>Source of Funding</th>
                            <th>Edit</th>
                        </tr>
                        <%--<tr>
                            <td>2017/2018</td>
                            <td><a href="#">Abim</a> </td>
                            <td>New water source constructed in this quarter.</td>
                            <td>Quarter 1 (july-Sept)</td>
                            <td>Public Standard post</td>
                            <td>Ambi</td>
                            <td>Aninata</td>
                            <td>Ajukuna</td>
                            <td>D12</td>
                            <td>Abim</td>
                            <td>0.4654467</td>
                            <td>32.563457</td>
                            <td>20,000</td>
                        </tr>
                        <tr>
                            <td>2017/2018</td>
                            <td><a href="#">Amolatar</a> </td>
                            <td>New water source constructed in this quarter.</td>
                            <td>Quarter 1 (july-Sept)</td>
                            <td>Deep Borehole</td>
                            <td>Akwon</td>
                            <td>Abalodyang</td>
                            <td>Abalodyang</td>
                            <td>456</td>
                            <td>Source</td>
                            <td>4567356</td>
                            <td>63279</td>
                            <td>66,000,000</td>
                        </tr>
                        <tr>
                            <td>2017/2018</td>
                            <td><a href="#">Bulambuli</a></td>
                            <td>New water source constructed in this quarter.</td>
                            <td>Quarter 1 (july-Sept)</td>
                            <td>Deep Borehole</td>
                            <td>Bunambutye</td>
                            <td>Buluguya</td>
                            <td>Bugobero</td>
                            <td>DWD67332</td>
                            <td>Bugobero</td>
                            <td>867345</td>
                            <td>349780</td>
                            <td>19,654,000</td>
                        </tr> 
                        <tr>
                            <td>2017/2018</td>
                            <td><a href="#">Abim</a> </td>
                            <td>New water source constructed in this quarter.</td>
                            <td>Quarter 1 (july-Sept)</td>
                            <td>Public Standard post</td>
                            <td>Ambi</td>
                            <td>Aninata</td>
                            <td>Ajukuna</td>
                            <td>D12</td>
                            <td>Abim</td>
                            <td>0.4654467</td>
                            <td>32.563457</td>
                            <td>20,000</td>
                        </tr>
                        <tr>
                            <td>2017/2018</td>
                            <td><a href="#">Amolatar</a> </td>
                            <td>New water source constructed in this quarter.</td>
                            <td>Quarter 1 (july-Sept)</td>
                            <td>Deep Borehole</td>
                            <td>Akwon</td>
                            <td>Abalodyang</td>
                            <td>Abalodyang</td>
                            <td>456</td>
                            <td>Source</td>
                            <td>4567356</td>
                            <td>63279</td>
                            <td>66,000,000</td>
                        </tr>
                        <tr>
                            <td>2017/2018</td>
                            <td><a href="#">Bulambuli</a></td>
                            <td>New water source constructed in this quarter.</td>
                            <td>Quarter 1 (july-Sept)</td>
                            <td>Deep Borehole</td>
                            <td>Bunambutye</td>
                            <td>Buluguya</td>
                            <td>Bugobero</td>
                            <td>DWD67332</td>
                            <td>Bugobero</td>
                            <td>867345</td>
                            <td>349780</td>
                            <td>19,654,000</td>
                        </tr> <tr>
                            <td>2017/2018</td>
                            <td><a href="#">Abim</a> </td>
                            <td>New water source constructed in this quarter.</td>
                            <td>Quarter 1 (july-Sept)</td>
                            <td>Public Standard post</td>
                            <td>Ambi</td>
                            <td>Aninata</td>
                            <td>Ajukuna</td>
                            <td>D12</td>
                            <td>Abim</td>
                          
                            <td>0.4654467</td>
                            <td>32.563457</td>
                            <td>20,000</td>
                        </tr>
                        <tr>
                            <td>2017/2018</td>
                            <td><a href="#">Amolatar</a> </td>
                            <td>New water source constructed in this quarter.</td>
                            <td>Quarter 1 (july-Sept)</td>
                            <td>Deep Borehole</td>
                            <td>Akwon</td>
                            <td>Abalodyang</td>
                            <td>Abalodyang</td>
                            <td>456</td>
                            <td>Source</td>
                            <td>4567356</td>
                            <td>63279</td>
                            <td>66,000,000</td>
                        </tr>
                        <tr>
                            <td>2017/2018</td>
                            <td><a href="#">Bulambuli</a></td>
                            <td>New water source constructed in this quarter.</td>
                            <td>Quarter 1 (july-Sept)</td>
                            <td>Deep Borehole</td>
                            <td>Bunambutye</td>
                            <td>Buluguya</td>
                            <td>Bugobero</td>
                            <td>DWD67332</td>
                            <td>Bugobero</td>
                            <td>867345</td>
                            <td>349780</td>
                            <td>19,654,000</td>
                        </tr> <tr>
                            <td>2017/2018</td>
                            <td><a href="#">Abim</a> </td>
                            <td>New water source constructed in this quarter.</td>
                            <td>Quarter 1 (july-Sept)</td>
                            <td>Public Standard post</td>
                            <td>Ambi</td>
                            <td>Aninata</td>
                            <td>Ajukuna</td>
                            <td>D12</td>
                            <td>Abim</td>

                            <td>0.4654467</td>
                            <td>32.563457</td>
                            <td>20,000</td>
                        </tr>
                        <tr>
                            <td>2017/2018</td>
                            <td><a href="#">Amolatar</a> </td>
                            <td>New water source constructed in this quarter.</td>
                            <td>Quarter 1 (july-Sept)</td>
                            <td>Deep Borehole</td>
                            <td>Akwon</td>
                            <td>Abalodyang</td>
                            <td>Abalodyang</td>
                            <td>456</td>
                            <td>Source</td>
                            <td>4567356</td>
                            <td>63279</td>
                            <td>66,000,000</td>
                        </tr>
                        <tr>
                            <td>2017/2018</td>
                            <td><a href="#">Bulambuli</a></td>
                            <td>New water source constructed in this quarter.</td>
                            <td>Quarter 1 (july-Sept)</td>
                            <td>Deep Borehole</td>
                            <td>Bunambutye</td>
                            <td>Buluguya</td>
                            <td>Bugobero</td>
                            <td>DWD67332</td>
                            <td>Bugobero</td>
                            <td>867345</td>
                            <td>349780</td>
                            <td>19,654,000</td>
                        </tr>--%>
              </table>
             </div>
            </div>
          </div>
    </section>
</asp:Content>
