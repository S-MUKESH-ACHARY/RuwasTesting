<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="ProgressReportDSHCG.aspx.cs" Inherits="RUWAS.ProgressReportDSHCG" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script>
       $(function () {
           document.getElementById("dataEntryId").classList.add("DE");
           getFinancialYr();
           getRWSRC();
           /*fetchLC();*/
       })
       function saveChanges() {
           let slctFinancialYear = $("#slctFinancialYearId").val();
           if (slctFinancialYear == "") {
               $("#slctFinancialYearId").addClass("is-invalid");
               $("#slctFinancialYearId").focus();
               return false;
           } else {
               $("#slctFinancialYearId").removeClass("is-invalid");
               $("#slctFinancialYearId").addClass("is-valid");
           }
           let slctRWSRC = $("#slctRWSRCId").val();
           if (slctRWSRC == "") {
               $("#slctRWSRCId").addClass("is-invalid");
               $("#slctRWSRCId").focus();
               return false;
           } else {
               $("#slctRWSRCId").removeClass("is-invalid");
               $("#slctRWSRCId").addClass("is-valid");
           }
           let slctLocalGovernment = $("#slctLocalGovernmentId").val();
           if (slctLocalGovernment == "") {
               $("#slctLocalGovernmentId").addClass("is-invalid");
               $("#slctLocalGovernmentId").focus();
               return false;
           } else {
               $("#slctLocalGovernmentId").removeClass("is-invalid");
               $("#slctLocalGovernmentId").addClass("is-valid");
           }
           let slctQuarter = $("#slctQuarterId").val();
           if (slctQuarter == "") {
               $("#slctQuarterId").addClass("is-invalid");
               $("#slctQuarterId").focus();
               return false;
           } else {
               $("#slctQuarterId").removeClass("is-invalid");
               $("#slctQuarterId").addClass("is-valid");
           }
           let Title = $("#titleId").val();
           if (Title == "") {
               $("#titleId").addClass("is-invalid");
               $("#titleId").focus();
               return false;
           } else {
               $("#titleId").removeClass("is-invalid");
               $("#titleId").addClass("is-valid");
           }
           let formFileL1 = $("#formFileL1Id").val();
           if (formFileL1 == "") {
               $("#formFileL1Id").addClass("is-invalid");
               $("#formFileL1Id").focus();
               return false;
           } else {
               $("#formFileL1Id").removeClass("is-invalid");
               $("#formFileL1Id").addClass("is-valid");
           }
           var SanitationId = $("#txtSanitation").html();
           ModelActivutyOfDSHCG = [];
           $("#myTable>tbody>tr").each(function () {
               let SanitationDtlId = Number($(this).find(".txtSDtlId").val());
               let QuarterAchived =Number($(this).find(".txtQuarterAchived").val());
               let Expanditure = Number($(this).find(".txtExpanditure").val());
               let Comment = $(this).find(".txtComment").val();
               ModelActivutyOfDSHCG.push({ SanitationDtlId: SanitationDtlId, QuarterAchived: QuarterAchived, Expanditure: Expanditure, Comment: Comment })
           })
           var data = {
               "op": "UpdatePRDSHCG",
               "SanitationId": SanitationId,
               "Title": Title,
               "Quarter": slctQuarter,
               "ModelActivutyOfDSHCG": ModelActivutyOfDSHCG
           }
           var s = function (sms) {
               alert(sms);
           }
           var e = function (msg) {
               alert(msg);
           }
           CallHandlerUsingJson_POST(data, s, e);
           console.log(data);
       }
       function CallHandlerUsingJson_POST(d, s, e) {
           d = JSON.stringify(d);
           d = encodeURIComponent(d);
           $.ajax({
               type: "POST",
               url: "RuwasHandler.axd",
               dataType: "json",
               contentType: "application/json; charset=utf-8",
               data: d,
               async: true,
               cache: true,
               success: s,
               error: e
           });
       }
       function ModelActivityTable() {
           $("#myTable").css("display", "block");
           let FinancialYr = $("#slctFinancialYearId").val();
           let LocalGovernment = $("#slctLocalGovernmentId").val();
           let slctQuarter = $("#slctQuarterId").val();
           let data = {
               'op': "FundsRecivedDSHCG",
               "FinancialYr": FinancialYr,
               "LocalGovernment": LocalGovernment,
               "slctQuarter": slctQuarter
           }
           var s = function (sms) {
               let FinancialYr = $("#slctFinancialYearId").val();
               let LocalGovernment = $("#slctLocalGovernmentId").val();
               let slctQuarter = $("#slctQuarterId").val();
               if (Array.isArray(sms)) {
                   sms.forEach(function (item) {
                       console.log(item);
                       $("#txtFundsRecivedId").val(item.FundsRecived);
                   })
               }
               var data = {
                   'op': 'FetchPReportDSHCG',
                   "FinancialYr": FinancialYr,
                   "LocalGovernment": LocalGovernment,
                   "slctQuarter": slctQuarter
               }
               var s = function (sms) {
                   console.log(sms);
                   $("#tBody").html("");
                   var Sanitation;
                   var Title;
                   if (Array.isArray(sms)) {
                       sms.forEach(function (item) {
                            Sanitation = item.Sanitation;
                           Title = item.Title;
                           var row = `<tr>`
                           row = row + `<td id = "txtSDtlId" style="display:none;">` + `<input disabled type="number" class="form-control txtSDtlId" style="width:10rem" value="` + item.SanitationDtl + `" />` + `</td>` +
                               `<td>` + item.SlNo + `</td>` +
                               `<td> ` + `<label style="width:20rem">` + item.ModelActivity + `</label>` + `</td>` +
                               `<td>` + `<input disabled type="number" class="form-control txtApprovalAnnualTarget" style="width:10rem" placeholder="` + item.ApprovalAnnualTarget + `" />` + `</td>` +
                               `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.QuarterTarget + `" />` + `</td>` +
                               `<td>` + `<input type="number" class="form-control txtQuarterAchived" style="width:10rem" placeholder="` + item.QuarterAchieved + `" />` + `</td>` +
                               `<td>` + `<input disabled type="number" class="form-control CumulativeAchieved" style="width:10rem" placeholder="` + item.CumulativeAchieved + `" />` + `</td>` +
                               `<td>` + `<input disabled type="number" class="form-control percentWorkplan" style="width:10rem" placeholder="0" />` + `</td>` +
                               `<td>` + `<input type="number" class="form-control txtExpanditure" placeholder="` + item.Expanditure + `" style="width:10rem"  value="` + item.Expanditure + `" />` + `</td>` +
                               `<td>` + `<input disabled type="number" class="form-control CumulativeExpanditure" style="width:10rem" value="` + item.CumulativeExpanditure + `" />` + `</td>` +
                               `<td>` + `<input disabled type="number" class="form-control AnnualBudget" style="width:10rem" value="` + item.AnnualBudget + `" />` + `</td>` +
                               `<td>` + `<textarea typeof="text" class="form-control txtComment" style="width:20rem">` + item.Comments + `</textarea>` + `</td></tr>`
                           $("#myTable").append(row);
                       })
                       $("#txtSanitation").html(Sanitation);
                       $("#titleId").val(Title);
                       total();
                       $(".txtExpanditure").on('input', function (event) {
                           var sum = 0;
                           var $row = $(this).closest('tr');
                           var txtId = parseInt($row.find(".txtSDtlId").val());
                           var TE = parseInt($(this).val()) || 0;
                           var item = sms.find((item) => item.SanitationDtl == txtId);
                           sum = TE == 0 ? item.CumulativeExpanditure - item.Expanditure : TE + (item.CumulativeExpanditure - item.Expanditure);
                           $row.find(".CumulativeExpanditure").val(sum);

                       })

                       $(".txtQuarterAchived").on('input', function (event) {
                           var sum1 = 0;
                           var $row = $(this).closest('tr');
                           var txtId = parseInt($row.find(".txtSDtlId").val());
                           var TQ = parseInt($(this).val()) || 0;
                           var item = sms.find((item) => item.SanitationDtl == txtId);
                           sum1 = TQ == 0 ? item.CumulativeAchieved - item.QuarterAchieved : TQ + (item.CumulativeAchieved - item.QuarterAchieved);
                           $row.find(".CumulativeAchieved").val(sum1);

                       })
                       $(".txtQuarterAchived").on('keyup', function () {
                           var mul = 0;
                           var $row = $(this).closest('tr');
                           var txtId = parseInt($row.find(".txtSDtlId").val());
                           var item = sms.find((item) => item.SanitationDtl == txtId);
                           //var ApprovalAnnualTarget = parseInt($row.find(".txtApprovalAnnualTarget").val());
                           $row.find(".CumulativeAchieved").each(function () {
                               if (this.value.length != 0) {
                                   mul = (parseFloat(this.value) / item.ApprovalAnnualTarget) * 100;
                                   $(this).css("background-color", "#FEFFB0");
                               }
                           })
                           $row.find(".percentWorkplan").val(mul);
                       })
                   }
                   else { alert("No Rows Found"); }
               }
               var e = function (msg) {
                   alert(msg);
               }
               CallHandler(data, s, e);
           }
           var e = function (msg) {
               alert(msg);
           }

           CallHandler(data, s, e);
       }
       function total() {
           var sum = 0;
           $('#myTable tbody tr').each(function () {
               var values = parseInt($(this).find('.txtExpanditure').val());
               sum += isNaN(values) ? 0 : values;
           })
           $("#Total1").val(sum);
           var sum = 0;
           $("#myTable tbody tr").each(function () {
               var values = parseInt($(this).find('.CumulativeExpanditure').val());
               sum += isNaN(values) ? 0 : values;
           })
           $("#Total2").val(sum);
           sum = 0;
           $("#myTable tbody tr").each(function () {
               var values = parseInt($(this).find('.AnnualBudget').val());
               sum += isNaN(values) ? 0 : values;
           })
           $("#Total3").val(sum);
       }
       //function ModelActivityTable() {
       //    let FinancialYr = $("#slctFinancialYearId").val();
       //    let LocalGovernment = $("#slctLocalGovernmentId").val();
       //    let slctQuarter = $("#slctQuarterId").val();
       //    let data = {
       //        'op': "FundsRecivedDSHCG",
       //        "FinancialYr": FinancialYr,
       //        "LocalGovernment": LocalGovernment,
       //        "slctQuarter": slctQuarter
       //    }
       //    var s = function (sms) {
       //        let FinancialYr = $("#slctFinancialYearId").val();
       //        let LocalGovernment = $("#slctLocalGovernmentId").val();
       //        let slctQuarter = $("#slctQuarterId").val();
       //        if (Array.isArray(sms)) {
       //            sms.forEach(function (item) {
       //                console.log(item);
       //                $("#txtFundsRecivedId").val(item.FundsRecived);
       //            })
       //        }
       //        var data = {
       //            'op': 'FetchPReportDSHCG',
       //            "FinancialYr": FinancialYr,
       //            "LocalGovernment": LocalGovernment,
       //            "slctQuarter": slctQuarter
       //        }
       //        var s = function (sms) {
       //            console.log(sms);
       //            $("#tBody").html("");
       //            if (Array.isArray(sms)) {
       //                sms.forEach(function (item) {
       //                    if (slctQuarter == "quarterOne") {
       //                        var row = `<tr>`
       //                        row = row + `<td style = "display:none" id = "txtWPDtlId" >` + `<input disabled type="number" class="form-control txtWPDtlId" style="width:10rem" value="` + item.WorkPlanDtlId + `" />` + `</td>` +
       //                            `<td>` + item.SlNo + `</td>` +
       //                            `<td>` + item.ModelActivity + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.ApprovalAnnualTarget + `" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.QuarterTarget1 + `" />` + `</td>` +
       //                            `<td>` + `<input type="number" class="form-control txtQuarterAchived" style="width:10rem" placeholder="` + item.QuarterAchieved1 + `" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="${item.QuarterAchieved1}" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="0" />` + `</td>` +
       //                            `<td>` + `<input type="number" class="form-control txtExpanditure" placeholder="` + item.Expanditure1 + `" style="width:10rem"  value="` + item.Expanditure1 + `" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control CumulativeExpanditure" style="width:10rem" value="` + item.Expanditure1 + `" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.AnnualBudget + `" />` + `</td>` +
       //                            `<td>` + `<textarea typeof="text" class="form-control txtComment" style="width:20rem">` + item.Comment1 + `</textarea>` + `</td></tr>`
       //                        $("#myTable").append(row);
       //                    }
       //                    else if (slctQuarter == "quarterTwo") {
       //                        var row = `<tr>`
       //                        row = row + `<td style = "display:none" id = "txtWPDtlId" >` + `<input disabled type="number" class="form-control txtWPDtlId" style="width:10rem" value="` + item.WorkPlanDtlId + `" />` + `</td>` +
       //                            `<td>` + item.SlNo + `</td>` +
       //                            `<td>` + item.ModelActivity + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.ApprovalAnnualTarget + `" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.QuarterTarget2 + `" />` + `</td>` +
       //                            `<td>` + `<input type="number" class="form-control txtQuarterAchived" style="width:10rem" placeholder="` + item.QuarterAchieved2 + `" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="${item.QuarterAchieved1 + item.QuarterAchieved2}" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="0" />` + `</td>` +
       //                            `<td>` + `<input type="number" class="form-control txtExpanditure" placeholder="` + item.Expanditure2 + `" style="width:10rem"  value="` + item.Expanditure2 + `" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control CumulativeExpanditure" style="width:10rem" value="${ item.Expanditure1 + item.Expanditure2 }" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.AnnualBudget + `" />` + `</td>` +
       //                            `<td>` + `<textarea typeof="text" class="form-control txtComment" style="width:20rem">` + item.Comment2 + `</textarea>` + `</td></tr>`
       //                        $("#myTable").append(row);
       //                    }
       //                    else if (slctQuarter == "quarterThree") {
       //                        var row = `<tr>`
       //                        row = row + `<td style = "display:none" id = "txtWPDtlId" >` + `<input disabled type="number" class="form-control txtWPDtlId" style="width:10rem" value="` + item.WorkPlanDtlId + `" />` + `</td>` +
       //                            `<td>` + item.SlNo + `</td>` +
       //                            `<td>` + item.ModelActivity + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.ApprovalAnnualTarget + `" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.QuarterTarget3 + `" />` + `</td>` +
       //                            `<td>` + `<input type="number" class="form-control txtQuarterAchived" style="width:10rem" placeholder="` + item.QuarterAchieved3 + `" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="${item.QuarterAchieved1 + item.QuarterAchieved2 + item.QuarterAchieved3}" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="0" />` + `</td>` +
       //                            `<td>` + `<input type="number" class="form-control txtExpanditure" placeholder="` + item.Expanditure3 + `" style="width:10rem"  value="` + item.Expanditure3 + `" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control CumulativeExpanditure" style="width:10rem" value="${item.Expanditure1 + item.Expanditure2 + item.Expanditure3}" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.AnnualBudget + `" />` + `</td>` +
       //                            `<td>` + `<textarea typeof="text" class="form-control txtComment" style="width:20rem">` + item.Comment3 + `</textarea>` + `</td></tr>`
       //                        $("#myTable").append(row);
       //                    }
       //                    else if (slctQuarter == "quarterFour") {
       //                        var row = `<tr>`
       //                        row = row + `<td style = "display:none" id = "txtWPDtlId" >` + `<input disabled type="number" class="form-control txtWPDtlId" style="width:10rem" value="` + item.WorkPlanDtlId + `" />` + `</td>` +
       //                            `<td>` + item.SlNo + `</td>` +
       //                            `<td>` + item.ModelActivity + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.ApprovalAnnualTarget + `" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.QuarterTarget4 + `" />` + `</td>` +
       //                            `<td>` + `<input type="number" class="form-control txtQuarterAchived" style="width:10rem" placeholder="` + item.QuarterAchieved4 + `" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="${item.QuarterAchieved1 + item.QuarterAchieved2 + item.QuarterAchieved3 + item.QuarterAchieved4}" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="0" />` + `</td>` +
       //                            `<td>` + `<input type="number" class="form-control txtExpanditure" placeholder="` + item.Expanditure4 + `" style="width:10rem"  value="` + item.Expanditure4 + `" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control CumulativeExpanditure" style="width:10rem" value="${item.Expanditure1 + item.Expanditure2 + item.Expanditure3 + item.Expanditure4}" />` + `</td>` +
       //                            `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.AnnualBudget + `" />` + `</td>` +
       //                            `<td>` + `<textarea typeof="text" class="form-control txtComment" style="width:20rem">` + item.Comment4 + `</textarea>` + `</td></tr>`
       //                        $("#myTable").append(row);
       //                    }
       //                })
       //                /*$("#myTable").DataTable();*/
       //            }
       //            else { alert("No Rows Found"); }
       //        }
       //        var e = function (msg) {
       //            alert(msg);
       //        }
       //        CallHandler(data, s, e);
       //    }
       //    var e = function (msg) {
       //        alert(msg);
       //    }

       //    CallHandler(data, s, e);
       //}
       function getFinancialYr() {
           var data = { 'op': 'FetchFinancialYear' }
           var s = function (sms) {
               if (Array.isArray(sms)) {
                   let AddFinancialYr = $("#slctFinancialYearId");
                   sms.forEach(function (item) {
                       let option = document.createElement('option');
                       option.value = item.FinancialYr;
                       option.text = item.FinancialYrName;
                       AddFinancialYr.append(option);
                   })
                   sms.forEach(function (item) {
                       if (item.IsActive == 1) {
                           $("#slctFinancialYearId").val(item.FinancialYr);
                       }
                   });
               } else {
                   alert(sms);
               }
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
       function fetchLC() {
           $("#slctLocalGovernmentId").prop("disabled", false);
           var RWSRC = $("#slctRWSRCId").val();
           let data = { "op": "FetchLCOfRWSRC", "RWSRC": RWSRC };
           let s = function (sms) {
               $("#slctLocalGovernmentId").html("");
               $("#slctLocalGovernmentId").text("choose from List");
               if (Array.isArray(sms)) {
                   let LC = document.getElementById("slctLocalGovernmentId");
                   let option1 = document.createElement('option');
                   option1.value = "";
                   option1.text = "Choose from List";
                   LC.appendChild(option1);
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
            color:red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="container-fluid">
        <div class="m-2 pt-2">
            <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='DashBoard.aspx'"></i>&nbsp;&nbsp;Data Entry</li>
                    <li class="breadcrumb-item h6">Progress Report (DSHCG)</li>
                </ol>
            </nav>
        </div>
        <div class="d-flix justify-content-between">
            <div>
                <div class="card m-2 shadow mb-5 bg-white rounded">
                    <div class="card-header text-center h5 alert alert-info">Progress Report (DSHCG)</div>
                    <div class="card-body">
                        <div class="row p-1 m-1">
                            <label id="txtSanitation"></label>
                            <div class="col-lg-3 col-sm-6 col-12">
                                <div class="form-floating">
                                    <select class="form-select" id="slctFinancialYearId" title="Financial Year">
                                        <option value="">Choose from List</option>
                                    </select>
                                    <label class="slctFinancialYearId">Financial Year <span>*</span></label>
                                    <span class="invalid-feedback is-invalid">please select Financial year</span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 col-12">
                                <div class="form-floating">
                                    <select class="form-select" title="RWSRC" id="slctRWSRCId" onchange="fetchLC()">
                                        <option value="">Choose from List</option>
                                    </select>
                                    <label style="font-size: 15px;" for="slctRWSRCId">RWSRC <span>*</span></label>
                                    <span class="invalid-feedback is-invalid">please select from list</span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 col-12">
                                <div class="form-floating">
                                    <select disabled class="form-select" id="slctLocalGovernmentId" title="Local Government">
                                        <option value="">Choose from List</option>
                                    </select>
                                    <label style="font-size: 15px;" for="slctLocalGovernmentId">Local Government <span>*</span></label>
                                    <span class="invalid-feedback is-invalid">please select from list</span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="form-floating">
                                    <select class="form-select" id="slctQuarterId" title="Quarter" onchange="ModelActivityTable()">
                                        <option value="">Choose from List</option>
                                        <option value="quarterOne">Q One (July-Sept)</option>
                                        <option value="quarterTwo">Q Two (Oct-Dec)</option>
                                        <option value="quarterThree">Q Three (Jan-March)</option>
                                        <option value="quarterFour">Q Four (Apr-Jun)</option>
                                    </select>
                                    <label style="font-size: 15px;" for="slctQuarterId">Quarter <span>*</span></label>
                                    <span class="invalid-feedback is-invalid">please select from list</span>
                                </div>
                            </div>
                        </div>
                        <div class="row p-1 m-1">
                            <div class="col-lg-3 col-sm-6">
                                <div class="form-floating">
                                    <input disabled type="text" class="form-control" id="txtFundsRecivedId" title="Funds Recived (Ugx)" placeholder="Funds Recived (Ugx)" />
                                    <label style="font-size: 15px;" for="txtFundsRecivedId">Funds Recived (Ugx)</label>
                                    <span class="invalid-feedback is-invalid">please enter fund</span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="form-floating">
                                    <input disabled type="text" class="form-control" id="txtFundsCumulativeId" title="Funds Recived Cumulative" placeholder="Funds Recived Cumulative" />
                                    <label style="font-size: 15px;" for="txtFundsCumulativeId">Funds Recived Cumulative</label>
                                    <span class="invalid-feedback is-invalid">please enter fund</span>
                                </div>
                            </div>
                        </div>
                        <div style="overflow: auto; height: 600px;" class="ms-3 me-3">
                            <table id="myTable" class="table table-hover" style="display:none;">
                                <thead>
                                    <tr class="table-secondary" style="position: sticky; top: 0;">
                                        <th>No</th>
                                        <th style="width: 100px">Model Activity</th>
                                        <th>Approved Annual Workplan Target</th>
                                        <th>Quarter Target</th>
                                        <th>Performance in Quarter Achieved</th>
                                        <th>Cumulative to Date Achieved</th>
                                        <th>%&nbsp;&nbsp;Workplan</th>
                                        <th>Expenditure (Quarter)(Ugx)</th>
                                        <th>Cumulative Expenditure(Ugx)</th>
                                        <th>Annual Budget(Ugx)</th>
                                        <th>Comments</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="tBody"></tbody>
                                <tfoot>
                                    <tr style="position: sticky; bottom: 0;">
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td><button type="button" class="btn btn-secondary w-100" onclick="total()">Total</button></td>
                                        <td><input disabled type="text" id="Total1" class="form-control" placeholder="Total" /></td>
                                        <td><input disabled type="text" id="Total2" class="form-control" placeholder="Total" /></td>
                                        <td><input disabled type="text" id="Total3" class="form-control" placeholder="Total" /></td>
                                        <td></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <hr />
                        <table width="100%">
                            <tr>
                                <td>
                                    <div class="row ms-2">
                                        <strong>Attachments (All are required)</strong>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row p-1 m-1">
                                        <div class="col-3">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="titleId" placeholder="Enter the Title of Document" title="Enter the Title of Document" />
                                                <label for="titleId">Title <span>*</span></label>
                                                <span class="invalid-feedback is-invalid">please enter the title of document</span>
                                            </div>
                                        </div>
                                        <div class="col-3 mt-2">
                                            <input class="form-control form-control-lg" id="formFileL1Id" type="file">
                                            <span class="invalid-feedback is-invalid">please select file</span>
                                        </div>
                                        <div class="col-3 text-sm-start mt-4 fst-italic" style="font-weight: 400">(Document File, Max 10MB) <span>*</span></div>
                                    </div>
                                </td>
                            </tr>
                           <%-- <tr>
                                <td>
                                    <div class="row p-1 m-1">
                                        <div class="col-3">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="caoLetterId" placeholder="Cao Letter" title="Enter the TItle of Coa Letter" />
                                                <label for="caoLetterId">Cao Letter <span>*</span></label>
                                            </div>
                                        </div>
                                        <div class="col-3 mt-2">
                                            <input class="form-control form-control-lg" id="formFileL2Id" type="file">
                                            <span class="invalid-feedback is-invalid">please select file</span>
                                        </div>
                                        <div class="col-3 text-sm-start mt-4 fst-italic" style="font-weight: 400">(Document File, Max 10MB) <span>*</span></div>
                                    </div>
                                </td>
                            </tr>--%>
                            <tr>
                                <td>
                                    <div class="d-flex justify-content-center">
                                        <div class="p-2">
                                            <button type="button" id="vtnSId" onclick="saveChanges()" class="btn btn-info text-light">Submit</button>&nbsp;
                                            <button type="button" id="btnCId" onclick="location.reload();" class="btn btn-danger">Clear</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                   </div>
                </div>
            </div>
    </section>
</asp:Content>
