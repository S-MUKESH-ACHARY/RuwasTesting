<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewFinancialYear.aspx.cs" Inherits="RUWAS.NewFinancialYear" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
        })
         function saveFinancialYear() {
             let txtFinancialYearId = $("#txtFinancialYearId").val();
             if (txtFinancialYearId == "") {
                 $("#txtFinancialYearId").addClass("is-invalid");
                 $("#txtFinancialYearId").focus();
                 return false;
             } else {
                 $("#txtFinancialYearId").removeClass("is-invalid");
                 $("#txtFinancialYearId").addClass("is-valid");
             }
             let chkActiveYear = 0;
             let chkValue = document.getElementById("chkActiveId");
             if (chkValue.checked) {
                 chkActiveYear = 1;
             }
             var data = {
                 'op': 'SaveFinancialYear',
                 "txtFinancialYear": txtFinancialYearId,
                 'chkActiveYear': chkActiveYear
             }
             console.log(data);
             var s =function(sms) {
                 alert(sms);
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container-fluid">
         <div class="m-2 pt-2">
            <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='FinancialYear.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6 active">Financial Year</li>
                    <li class="breadcrumb-item h6">New Financial Year</li>
                </ol>
            </nav>
             <div class="card shadow mb-5 bg-white rounded">
                 <div class="card-header text-center h5 alert alert-info">New Financial Year</div>
                 <div class="card-body">
                     <div class="row">
                         <div class="col-lg-3 col-12">
                             <div class="form-floating">
                                 <input type="text" id="txtFinancialYearId" class="form-control" placeholder="Financial Year" title="Financial Year"  />
                                 <label>Financial</label>
                                 <span class="invalid-feedback is-invalid">please enter financial year</span>
                             </div>
                         </div>
                         <div class="col-lg-3 col-12  mt-3">
                                 <input type="checkbox" id="chkActiveId" style="cursor:pointer;" class="form-check-input" placeholder="Financial Year" title="Financial Year"  />&nbsp;
                                 <label>Active Year</label>
                         </div>
                     </div>
                     <div class="text-center">
                         <button type="button" class="btn btn-primary" onclick="saveFinancialYear()">Save</button>
                     </div>
                     </div>
                     </div>
                     </div>
        </section>
</asp:Content>
