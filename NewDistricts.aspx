<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewDistricts.aspx.cs" Inherits="RUWAS.NewDistricts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
         $(function () {
             document.getElementById("administrationId").classList.add("DE");
             getRWSRC()
         })
         function saveNewDistrict() {
             let txtVote = $("#txtVoteId").val();
             if (txtVote == "") {
                 $("#txtVoteId").addClass("is-invalid");
                 $("#txtVoteId").focus();
                 return false();
             } else {
                 $("#txtVoteId").removeClass("is-invalid");
                 $("#txtVoteId").addClass("is-valid");
             }
             let txtDistrict = $("#txtDistrictId").val();
             if (txtDistrict == "") {
                 $("#txtDistrictId").addClass("is-invalid");
                 $("#txtDistrictId").focus();
                 return false();
             } else {
                 $("#txtDistrictId").removeClass("is-invalid");
                 $("#txtDistrictId").addClass("is-valid");
             }
             let slctRWSRC = $("#slctRWSRCId").val();
             if (slctRWSRC == "") {
                 $("#slctRWSRCId").addClass("is-invalid");
                 $("#slctRWSRCId").focus();
                 return false();
             } else {
                 $("#slctRWSRCId").removeClass("is-invalid");
                 $("#slctRWSRCId").addClass("is-valid");
             }
             var data = {
                 "op": "SaveDistricts",
                 "txtVote": txtVote,
                 "txtDistrict": txtDistrict,
                 "slctRWSRC": slctRWSRC
             }
             var s = function (sms) {
                 alert(sms);
             }
             var e = function (msg) {
                 alert(msg);
             }
             CallHandler(data, s, e);
         }
         function getRWSRC() {
             var data = { "op": "FetchRWSRCTableData" }
             var s = function (sms) {
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
         .dropdown-menu1 {
       max-height: 70vh;
       overflow:scroll; 
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container-fluid">
        <div class="m-2 pt-2">
            <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='Districts.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6 active">Diatrict</li>
                    <li class="breadcrumb-item h6">New District</li>
                </ol>
            </nav>
        
                <div class="card shadow mb-5 bg-white rounded">
                     <div class="card-header text-center h5 alert alert-info">New District</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3 col-12">
                                <div class="form-floating">
                                    <input type="text" id="txtVoteId" class="form-control" placeholder="Vote" title="Vote" />
                                    <label for="txtVoteId">Vote</label>
                                    <span class="invalid-feedback is-invalid">Please enter vote</span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-12">
                                <div class="form-floating">
                                    <input type="text" id="txtDistrictId" class="form-control" placeholder="District" title="District" />
                                    <label for="txtDistrictId">District</label>
                                    <span class="invalid-feedback is-invalid">Please enter distrivt</span>
                                </div>
                            </div>
                             <div class="col-lg-3 col-12">
                                <div class="form-floating">
                                    <select id="slctRWSRCId" class="form-select" title="RWSRC">
                                    <option value="">Choose from List</option>
                                    </select>
                                    <label for="slctRWSRCId">RWSRC</label>
                                    <span class="invalid-feedback is-invalid">Please select from list</span>
                                </div>
                            </div>
                        </div>
                        </div>
                    <div class="text-center">
                        <button id="btnSave" type="button" class="btn btn-primary mb-3" onclick="saveNewDistrict()">Save</button>
                    </div>
                </div>
                </div>
    </section>
</asp:Content>
