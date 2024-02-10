<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="Technology.aspx.cs" Inherits="RUWAS.Technology" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
         $(function () {
             document.getElementById("administrationId").classList.add("DE");
             getTableData()
         })
         function saveChanges() {
             let TeachnologyId = $("#txtTeachnologyId").html();
             let TeachnologyName = $("#txtTechnologyName").val();
             let PopulationServed = Number($("#txtPopulationId").val());
             var data = {
                 "op": "UpdateTeachnology",
                 "TeachnologyId": TeachnologyId,
                 "TeachnologyName": TeachnologyName,
                 "PopulationServed": PopulationServed
             }
             console.log(data);
             var s = function (sms) {
                 alert(sms);
                 location.reload();
             }
             var e = function (msg) {
                 alert(msg);
             }
             CallHandler(data, s, e);
         }
         function getTableData(){
             var data = { 'op': 'FetchTeachnologyTable' }
             var s = function (sms) {
                 sms.forEach(function (item) {
                     var row = `<tr>`
                     row = row + `<td style="display:none" class="1">` + item.TechnologyId+ `</td>` +
                         `<td class="2">` + item.TechnologyName+ `</td>` +
                         `<td class="3">` + item.PopulationServed+`</td>` +
                         `<td>` + `<input type="checkbox" class="form-check-input" />`+`</td>` +
                         `<td>` + `<input type="checkbox" class="form-check-input" />`+`</td>` +
                         `<td>` + `<button class="btn btn-primary" type="button" onclick="EditSubCounty(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button> `+`</td></tr>`
                     $("#myTable").append(row);
                 })
                 $(".loader-container").hide();
             }
             var e = function (msg) {
                 alert(msg);
                 $(".loader-container").hide();
             }
             CallHandler(data, s, e);
             $(".loader-container").show();
         }
         function EditSubCounty(thisId) {
             let TeachnologyId = $(thisId).parent().parent().children('.1').html();
             $("#txtTeachnologyId").html(TeachnologyId);
             let TeachnologyName = $(thisId).parent().parent().children('.2').html();
             $("#txtTechnologyName").val(TeachnologyName);
             let PopulationServed = $(thisId).parent().parent().children('.3').html();
             $("#txtPopulationId").val(PopulationServed);

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
            font-weight:500;}
        span {
            font-size: 13px;
            font-weight: bold;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="container-fluid">
        <div class="m-2 pt-2">
            <nav style="--bs-breadcrumb-divider: '>'" arial-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='AnnualAttachments.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6">Technology</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">View Technology</div>
                <div class="text-end me-4">
                    <button type="button" class="btn btn-primary" onclick="location.href='NewTechnology.aspx'">Add New Technology</button>
                </div>
                <div class="card-body" style="overflow:auto;height:400px;">
                    <table id="myTable" class="table table-hover w-100" style="text-align: center;">
                        <thead>
                            <tr class="table-secondary">
                                <td>Technology</td>
                                <td>Population Served</td>
                                <td>No Easting And Northing</td>
                                <td>Disabled</td>
                                <td>Edit</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%--<tr id="editRow">
                                <td>Deep Borehole</td>
                                <td>300</td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td>
                                    <button type="button" class="btn btn-primary" onclick="Edit()"><i class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>Kiosk</td>
                                <td></td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td>
                                    <button type="button" class="btn btn-primary"><i class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>Piped water system</td>
                                <td></td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td>
                                    <button type="button" class="btn btn-primary"><i class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>Procted spring</td>
                                <td>250</td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td>
                                    <button type="button" class="btn btn-primary"><i class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>Public stand post</td>
                                <td></td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td>
                                    <button type="button" class="btn btn-primary"><i class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>Rainwater harvesting tank</td>
                                <td>6</td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td>
                                    <button type="button" class="btn btn-primary"><i class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>Shallow well</td>
                                <td>300</td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td>
                                    <button type="button" class="btn btn-primary"><i class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>Solar powered piped water system</td>
                                <td>300</td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td><input type="checkbox" class="form-check-input" /></td>
                                <td>
                                    <button type="button" class="btn btn-primary"><i class="fas fa-edit"></i></button>
                                </td>
                            </tr>--%>
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
                         <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Teachnology</h1>
                     </div>
                     <div class="modal-body">
                         <label style="display:none;" id="txtTeachnologyId"></label>
                         <div class="row m-1 p-1">
                             <div class="col-lg-6 col-12">
                                 <div class="form-floating">
                                     <input id="txtTechnologyName" type="text" class="form-control" placeholder="Technology" title="Technology" />
                                     <label for="txtTechnologyName">Technology</label>
                                     <span class="invalid-feedback is-invalid">please enter technology</span>
                                 </div>
                             </div>
                             <div class="col-lg-6 col-12">
                                 <div class="form-floating">
                                     <input id="txtPopulationId" type="number" class="form-control" placeholder="Population Served" title="Population Served" />
                                     <label for="txtPopulationId">Population Served</label>
                                     <span class="invalid-feedback is-invalid">Please enter population</span>
                                 </div>
                             </div>
                         </div>
                         <div class="row m-1 p-1">
                             <div class="col-lg-6 col-12 mt-3">
                                 <input id="txtNoEastingAndNorthingId" style="cursor: pointer;" type="checkbox" class="form-check-input" placeholder="No Eastings and Northings" title="No Eastings and Northings" />&nbsp;
                                <label for="txtPopulationServedId">No Eastings and Northings</label>
                                 <span class="invalid-feedback is-invalid">please check it</span>
                             </div> 
                             <div class="col-lg-6 col-12 mt-3">
                                 <input id="txtDisabledId" style="cursor: pointer;" type="checkbox" title="Disabled" class="form-check-input" placeholder="Disabled" />&nbsp;
                                <label for="txtPopulationServedId">Disabled</label>
                                 <span class="invalid-feedback is-invalid">please check it</span>
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
