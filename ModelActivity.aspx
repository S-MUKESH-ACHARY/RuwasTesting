<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="ModelActivity.aspx.cs" Inherits="RUWAS.ModelActivity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            ModelActivityTable()
        })
        function saveChanges() {
            var txtModelActivityDetailId = $("#txtModelActivityDetailId").text();
            var txtOrderNo = $("#txtOrderNo").val();
            var txtSlNo = $("#txtSlNo").val();
            var txtModelActivityName = $("#txtModelActivityName").val();
            var txtModelActivityDescription = $("#txtModelActivityDescription").val();
            var txtUnitsForTarget = $("#txtUnitsForTarget").val();

            var data = {
                "op": "UpdateModelActivity",
                "txtModelActivityDetailId": txtModelActivityDetailId,
                "txtOrderNo": txtOrderNo,
                "txtSlNo": txtSlNo,
                "txtModelActivityName": txtModelActivityName,
                "txtModelActivityDescription": txtModelActivityDescription,
                "txtUnitsForTarget": txtUnitsForTarget
            }
            console.log(data);
            var s = function (sms) {
                alert(sms);
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function ModelActivityTable() {
            var data = {
                'op': 'ModelActivityTable',
            }
            var s = function (sms) {
                sms.forEach(function (item) {
                    
                    var row = `<tr>`
                    row = row + `<td class="1">` + item.OrderNo + `</td>` +
                        `<td class="2">` + item.SlNo + `</td>` +
                        `<td class="3">` + item.ModelActivityName + `</td>` +
                        `<td class="4">` + item.ModelActivityDescription + `</td>` +
                        `<td class="5">` + item.UnitTarget + `</td>`+
                        `<td style="display:none;" class="6">` + item.ModelActivityDetailId + `</td>`+
                        `<td>` + `<button class="btn btn-primary" type="button" onclick="EditModelActivity(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button>`+ `</td></tr>`
                    $("#myTable").append(row);
                })
                $(".loader-container").hide();
                $("#myTable").DataTable();
               
            }
            var e = function (msg) {
                alert(msg);
                $(".loader-container").hide();
            }
            CallHandler(data, s, e);
            $(".loader-container").show();
        }
        function EditModelActivity(thisId) {
            let Order = $(thisId).parent().parent().children('.1').html();
            $("#txtOrderNo").val(Order);
            let SlNo = $(thisId).parent().parent().children('.2').html();
            $("#txtSlNo").val(SlNo);
            let ModelActivityName = $(thisId).parent().parent().children('.3').html();
            $("#txtModelActivityName").val(ModelActivityName);
            let ActivityInformation = $(thisId).parent().parent().children('.4').html();
            $("#txtModelActivityDescription").val(ActivityInformation);
            let UnitTarget = $(thisId).parent().parent().children('.5').html();
            $("#txtUnitsForTarget").val(UnitTarget);
            let ModelActivityDetailId = $(thisId).parent().parent().children('.6').html();
            $("#txtModelActivityDetailId").html(ModelActivityDetailId);
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
                    <li class="breadcrumb-item h6">Model Activity</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">View Model Activity</div>
                <div class="text-end me-4">
                    <button type="button" class="btn btn-primary" onclick="location.href='NewModelActivity.aspx'">Add New Model Activity</button>
                </div>
                <div class="card-body">
                    <table id="myTable" class="table table-hover">
                        <thead>
                            <tr class="table-secondary">
                                <th>Order</th>
                                <th>No</th>
                                <th>Model activities predefined in the annual work plan format</th>
                                <th>Information On Activity</th>
                                <th>Unit for targets</th>
                                <th style="display:none;">Model Activity Detail Id</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%--Modal for Edit--%>

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header alert alert-info justify-content-center">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Model Activity</h1>
                    </div>
                    <div class="modal-body">
                        <label style="display:none;" id="txtModelActivityDetailId"></label>
                        <div class="row m-1 p-1">
                            <div class="col-lg-6 col-12">
                                <div class="form-floating">
                                    <input type="number" id="txtOrderNo" class="form-control" placeholder="Order No" title="Order No" />
                                    <label for="txtOrderNo">Order No</label>
                                    <span class="invalid-feedback is-invalid">Please enter order no</span>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="form-floating">
                                    <input type="text" id="txtSlNo" class="form-control" placeholder="Sl No" title="Sl No" />
                                    <label for="txtDistrictId">Sl No</label>
                                    <span class="invalid-feedback is-invalid">Please enter Sl No</span>
                                </div>
                            </div>
                        </div>
                        <div class="row m-1 p-1">
                            <div class="col-lg-12 col-12">
                                <div class="form-floating">
                                    <textarea type="text" rows="3" style="height:100%;" id="txtModelActivityName" class="form-control" placeholder="ModelActivity Name" title="ModelActivity Name"></textarea>
                                    <label for="txtModelActivityName">Model Activity Name</label>
                                    <span class="invalid-feedback is-invalid">Please enter ModelActivity Name</span>
                                </div>
                            </div>
                        </div>
                        <div class="row m-1 p-1">
                            <div class="col-lg-12 col-12">
                                <div class="form-floating">
                                    <textarea type="text" rows="3" style="height:100%;" id="txtModelActivityDescription" class="form-control" placeholder="ModelActivity Description" title="ModelActivity Information"></textarea>
                                    <label for="txtModelActivityDescription">Information On Activity</label>
                                    <span class="invalid-feedback is-invalid">Please enter ModelActivity Description</span>
                                </div>
                            </div>
                        </div>
                        <div class="row m-1 p-1">
                            <div class="col-lg-6 col-12">
                                <div class="form-floating">
                                    <textarea type="text" id="txtUnitsForTarget" class="form-control" placeholder="Units For Target" title="Units For Target"></textarea>
                                    <label for="txtUnitsForTarget">Units For Target</label>
                                    <span class="invalid-feedback is-invalid">Please enter Units For Target</span>
                                </div>
                            </div>
                        </div>
                       </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="saveChanges()">Save Changes</button>
                </div>
            </div>
        </div>
        </div>
    </section>
</asp:Content>
