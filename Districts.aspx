<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="Districts.aspx.cs" Inherits="RUWAS.Districts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            getTableData();
            fetchLC();
            getRWSRC();
        })
        function getRWSRC() {
            var data = { "op": "FetchRWSRCTableData" }
            var s = function (sms) {
                console.log(sms);
                if (Array.isArray(sms)) {
                    let addRWSRC = document.getElementById("slctRWSRCId");
                    sms.forEach(function (item) {
                        let option = document.createElement('option');
                        option.value = item.RWSRCId;
                        option.text = item.RWSRCName;
                        addRWSRC.appendChild(option)
                    })
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function fetchLC() {
            let data = { "op": "FetchLC" };
            let s = function (sms) {

                if (Array.isArray(sms)) {
                    let LC = document.getElementById("slctDistrictId");
                    sms.forEach((msg) => {
                        let option = document.createElement('option');
                        option.value = msg.LCId;
                        option.text = msg.LCName;
                        LC.appendChild(option);
                    })
                }
                else {
                    alert(sms);
                }
            }
            let e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function getTableData() {
            var data = { 'op': 'DistrictsTableData' }
            var s = function (sms) {
                console.log(sms);
                sms.forEach(function (item) {
                    let IsDeleted = item.IsDeleted;
                   
                        var row = `<tr>`
                        row = row + `<td class="1">` + item.Vote + `</td>` +
                            `<td class="2" style="display:none;">` + item.DistrictId + `</td>` +
                            `<td>` + item.District + `</td>` +
                            `<td class="3" style="display:none;">` + item.RWSRCId + `</td>` +
                            `<td>` + item.RWSRC + `</td>` +
                            `<td class="4">` + `<input type="checkbox" disabled class="form-check-input" ${IsDeleted==1?'checked':''} />` + `</td>` +
                            `<td>` + `<button class="btn btn-primary" type="button" onclick="EditDistrict(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button>` + `</td></tr>`
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
        function EditDistrict(thisId) {
            let vote = $(thisId).parent().parent().children('.1').html();
            $("#txtVoteId").val(vote);
            let district = $(thisId).parent().parent().children('.2').html();
            $("#slctDistrictId").val(district);
            let rwsrc = $(thisId).parent().parent().children('.3').html();
            $("#slctRWSRCId").val(rwsrc);
            let IsDeleted = $(thisId).closest('tr').find('.4 input').is(':checked');
            $("#defaultCheck1").prop('checked', IsDeleted);
        }
        function Update() {
            let DistrictId = $("#slctDistrictId").val();
            let IsDeleted = 0; /*$("#defaultCheck1")*/
            let chk = $("#defaultCheck1");
            if (chk.is(':checked')){
                IsDeleted = 1;
            }
            let Vote = $("#txtVoteId").val();
            let Rwsrc = $("#slctRWSRCId").val();
            var data = {
                "op": "UpdateDistrict",
                "DistrictId": DistrictId,
                "IsDeleted": IsDeleted,
                "Vote": Vote,
                "Rwsrc": Rwsrc
            }
            var s = function (sms) {
                alert(sms);
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
            location.reload();
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
        //function Edit() {
        //    let row = '<tr>';
        //    row += '<td><input type="text" class="form-control text-center" value="636" /></td>';
        //    row += '<td>Terego</td>';
        //    row += '<td><input type="text" class="form-control text-center" value="RWSRC 1" /></td>';
        //    row += '<td><input type="checkbox" class="form-check-input" /></td>';
        //    row += '<td><button class="btn btn-primary" type="button" onclick="save()">Save</button></td>';
        //    row += '</tr>';
        //    document.getElementById("editRow").innerHTML = row;
        //}
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='Dashboard.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6">Districts</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">View Districts</div>
                <div class="text-end me-4">
                    <button type="button" class="btn btn-primary" onclick="location.href='NewDistricts.aspx'">Add New District</button>
                </div>
                <div class="card-body">
                    <table id="myTable" class="table table-hover w-100" style="text-align: center;">
                        <thead>
                            <tr class="table-secondary">
                                <th class="text-center">Vote</th>
                                <th class="text-center" style="display:none;">DistrictId</th>
                                <th class="text-center" style="display:none;">RWSRCId</th>
                                <th class="text-center">District</th>
                                <th class="text-center">RWSRC</th>
                                <th class="text-center">Disabled</th>
                                <th class="text-center">Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%--<tr id="editRow">
                                <td>636</td>
                                <td>Terego</td>
                                <td>RWSRC 1</td>
                                <td><input type="checkbox" /></td>
                                <td><button class="btn btn-primary" type="button" onclick="Edit()"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>635</td>
                                <td>Kalkai</td>
                                <td>RWSRC 2</td>
                                <td><input type="checkbox" /></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>634</td>
                                <td>Karenga</td>
                                <td>RWSRC 2</td>
                                <td><input type="checkbox" /></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>633</td>
                                <td>Madi-Okollo</td>
                                <td>RWSRC 1</td>
                                <td><input type="checkbox" /></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>632</td>
                                <td>kaitagwenda</td>
                                <td>RWSRC 5</td>
                                <td><input type="checkbox" /></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>631</td>
                                <td>Rwampara</td>
                                <td>RWSRC 6</td>
                                <td><input type="checkbox" /></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>630</td>
                                <td>Kazo</td>
                                <td>RWSRC 6</td>
                                <td><input type="checkbox" /></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>
                            <tr>
                                <td>630</td>
                                <td>Obongi</td>
                                <td>RWSRC 1</td>
                                <td><input type="checkbox" /></td>
                                <td><button class="btn btn-primary" type="button"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            </tr>--%>
                        </tbody>
                    </table>
                    <%--Modal for Edit--%>
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content">
                                <div class="modal-header alert alert-info justify-content-center">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Edit District</h1>
                                </div>
                                <div class="modal-body">
                                    <div class="row m-1 p-1">
                                        <div class="col-lg-6 col-12">
                                            <div class="form-floating">
                                                <select type="text" id="slctDistrictId" class="form-select" placeholder="District" title="District" disabled>
                                                </select>
                                                <label for="txtDistrictId">District</label>
                                                <span class="invalid-feedback is-invalid">Please enter district</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-floating">
                                                <input type="number" id="txtVoteId" class="form-control" placeholder="Vote" title="Vote" />
                                                <label for="txtVoteId">Vote</label>
                                                <span class="invalid-feedback is-invalid">Please enter vote</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-1 p-1">
                                        <div class="col-lg-6 col-12">
                                            <div class="form-floating">
                                                <select id="slctRWSRCId" class="form-select" title="RWSRC" placeholder="RWSRC" >
                                               <%-- <select id="slctRWSRCId" class="form-select" title="RWSRC">
                                                    <option value="">Choose from List</option>
                                                    <option value="10">RWSRC 1</option>
                                                    <option value="2">RWSRC 2</option>
                                                    <option value="3">RWSRC 3</option> --%>
                                                </select>
                                                <label for="slctRWSRCId">RWSRC</label>
                                                <span class="invalid-feedback is-invalid">Please select from list</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-check mt-3">
                                                <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                                <label class="form-check-label" for="defaultCheck1">
                                                    Dsabled
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="Update()">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </section>
</asp:Content>
