<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="ProgressReportDWSCG.aspx.cs" Inherits="RUWAS.ProgressReportDWSCG" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("dataEntryId").classList.add("DE");
            getFinancialYr();
            getRWSRC();
            /*fetchLC();*/
        })
        function update() {
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
            let txtTitle = $("#txtTitleId").val();
            if (txtTitle == "") {
                $("#txtTitleId").addClass("is-invalid");
                $("#txtTitleId").focus();
                return false;
            } else {
                $("#txtTitleId").removeClass("is-invalid");
                $("#txtTitleId").addClass("is-valid");
            }
            //let docFormFileL1 = $("#docFormFile1Id").val();
            //if (docFormFileL1 == "") {
            //    $("#docFormFile1Id").addClass("is-invalid");
            //    $("#docFormFile1Id").focus();
            //    return false;
            //} else {
            //    $("#docFormFile1Id").removeClass("is-invalid");
            //    $("#docFormFile1Id").addClass("is-valid");
            //}
            let txtCaoLetter = $("#txtCaoLetterId").val();
            if (txtCaoLetter == "") {
                $("#txtCaoLetterId").addClass("is-invalid");
                $("#txtCaoLetterId").focus();
                return false;
            } else {
                $("#txtCaoLetterId").removeClass("is-invalid");
                $("#txtCaoLetterId").addClass("is-valid");
            }
            //let docFormFile2 = $("#docFormFile2Id").val();
            //if (docFormFile2 == "") {
            //    $("#docFormFile2Id").addClass("is-invalid");
            //    $("#docFormFile2Id").focus();
            //    return false;
            //} else {
            //    $("#docFormFile2Id").removeClass("is-invalid");
            //    $("#docFormFile2Id").addClass("is-valid");
            //}
            var txtWorkplan = $("#txtWorkplanId").text();
            var ModelActivityOfDWSCG = [];
            $("#myTable>tbody>tr").each(function () {
                let WorkplanDtlId = Number($(this).find(".txtWPDtlId").val());
                let QuarterAchived = Number($(this).find(".txtQuarterAchived").val());
                let Expanditure = Number($(this).find(".txtExpanditure").val());
                let Comments = $(this).find(".txtComment").val();
                ModelActivityOfDWSCG.push({ WorkplanDtlId: WorkplanDtlId, QuarterAchived: QuarterAchived, Expanditure: Expanditure, Comments: Comments });
            })
            var data = {
                "op": "UpdatePRDWSCG",
                "txtWorkplan": txtWorkplan,
                "txtTitle": txtTitle,
                "txtCaoLetter": txtCaoLetter,
                "slctQuarter": slctQuarter,
                "ModelActivityOfDWSCG": ModelActivityOfDWSCG
            }
            var s = function (sms) {
                alert(sms);
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandlerUsingJson_POST(data, s, e)
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
            
            let FinancialYr = $("#slctFinancialYearId").val();
            let LocalGovernment = $("#slctLocalGovernmentId").val();
            let slctQuarter = $("#slctQuarterId").val();
            let data = {
                'op': "FundsRecivedDWSCG",
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
                    'op': 'FetchPReportDWSCG',
                    "FinancialYr": FinancialYr,
                    "LocalGovernment": LocalGovernment,
                    "slctQuarter": slctQuarter
                }
                var s = function (sms) {                    
                    $("#tBody").html("");
                    var workPlanId;
                    var Title;
                    var caoTitle;
                    if (Array.isArray(sms)) {
                        sms.forEach(function (item) {                            
                            workPlanId = item.WorkPlanId;
                            Title = item.Title;
                            caoTitle = item.caoTitle;
                            var row = `<tr>`
                            row = row +
                                /*`<td class="txtWPDtlId" style="display:none" id="txtWPDtlId">` + item.WorkPlanDtlId + `</td>` +*/
                                `<td style = "display:none" id = "txtWPDtlId" >` + `<input disabled type="number" class="form-control txtWPDtlId" style="width:10rem" value="` + item.WorkPlanDtlId + `" />` + `</td>` +
                                `<td>` + item.SlNo + `</td>` + 
                                `<td> ` + `<label style="width:20rem">` + item.ModelActivity + `</label>`+ `</td>` +
                                `<td>` + `<input disabled type="number" class="form-control txtApprovalAnnualTarget" style="width:10rem" placeholder="` + item.ApprovalAnnualTarget + `" />` + `</td>` +
                                `<td>` + `<input disabled type="number" class="form-control" style="width:10rem" placeholder="` + item.QuarterTarget + `" />` + `</td>` +
                                `<td>` + `<input type="number" class="form-control txtQuarterAchived" style="width:10rem" placeholder="` + item.QuarterAchieved +`" />` + `</td>` +
                                `<td>` + `<input disabled type="number" class="form-control CumulativeAchieved" style="width:10rem" placeholder="` + item.CumulativeAchieved + `" />` + `</td>` +
                                `<td>` + `<input disabled type="number" class="form-control percentWorkplan" style="width:10rem" placeholder="0" />` + `</td>` +
                                `<td>` + `<input type="number" class="form-control txtExpanditure" placeholder="` + item.Expanditure + `" style="width:10rem"  value="` + item.Expanditure + `" />` + `</td>` +
                                `<td>` + `<input disabled type="number" class="form-control CumulativeExpanditure" style="width:10rem" value="` + item.CumulativeExpanditure + `" />` + `</td>` +
                                `<td>` + `<input disabled type="number" class="form-control AnnualBudget" style="width:10rem" value="` + item.AnnualBudget + `" />` + `</td>` +
                                `<td>` + `<textarea typeof="text" class="form-control txtComment" style="width:20rem">` + item.Comments +`</textarea>` + `</td></tr>`
                            $("#myTable").append(row);
                            
                        })
                        total();
                        $("#txtWorkplanId").html(workPlanId);
                        $("#txtTitleId").val(Title);
                        $("#txtCaoLetterId").val(caoTitle);

                        $(".txtExpanditure").on('input', function (event) {
                            var sum = 0;
                            var $row = $(this).closest('tr');                           
                            var txtId = parseInt($row.find(".txtWPDtlId").val());
                            var TE = parseInt($(this).val()) || 0;
                            var item = sms.find((item) => item.WorkPlanDtlId == txtId);
                            sum = TE == 0 ? item.CumulativeExpanditure - item.Expanditure : TE + (item.CumulativeExpanditure - item.Expanditure);           
                            $row.find(".CumulativeExpanditure").val(sum);

                        })

                        $(".txtQuarterAchived").on('input', function (event) {
                            var sum1 = 0;
                            var $row = $(this).closest('tr');                           
                            var txtId = parseInt($row.find(".txtWPDtlId").val());
                            var TQ = parseInt($(this).val()) || 0;
                            var item = sms.find((item) => item.WorkPlanDtlId == txtId);
                            sum1 = TQ == 0 ? item.CumulativeAchieved - item.QuarterAchieved : TQ + (item.CumulativeAchieved - item.QuarterAchieved);           
                            $row.find(".CumulativeAchieved").val(sum1);

                        })
                        $(".txtQuarterAchived").on('keyup', function () {
                            var mul = 0;
                            var $row = $(this).closest('tr');
                            var txtId = parseInt($row.find(".txtWPDtlId").val());
                            var item = sms.find((item) => item.WorkPlanDtlId == txtId);
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
                var values = parseFloat($(this).find('.txtExpanditure').val());
                sum += isNaN(values) ? 0 : values;
            })
            $("#Total1").val(sum);
            var sum = 0;
            $('#myTable tbody tr').each(function () {
                var values = parseFloat($(this).find('.CumulativeExpanditure').val());
                sum += isNaN(values) ? 0:values;
            })
            $("#Total2").val(sum);
            var sum = 0;
            $('#myTable tbody tr').each(function () {
                var values = parseFloat($(this).find('.AnnualBudget').val());
                sum += isNaN(values) ? 0:values;
            })
            $("#Total3").val(sum);
        }
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
                    <li class="breadcrumb-item h6">Progress Report (DWSCG)</li>
                </ol>
            </nav>
        </div>
        <div class="d-flix justify-content-between">
            <div>
                <div class="card m-2 shadow mb-5 bg-white rounded">
                    <div class="card-header text-center h5 alert alert-info">Progress Report (DWSCG)</div>
                    <div class="card-body">
                        <label style="display:none;" id="txtWorkplanId"></label>
                        <div class="row p-1 m-1">
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
                        <div style="overflow: scroll; height:420px;">
                            <table id="myTable" class="table table-hover">
                                <thead style="text-align: center;">
                                    <tr class="table-secondary" style="position: sticky; top: 0;">
                                        <th>No</th>
                                        <th>Model Activity</th>
                                        <th>Approved Annual Workplan Target</th>
                                        <th>Quarter Target</th>
                                        <th>Performance in Quarter Achieved</th>
                                        <th>Cumulative to Date Achieved</th>
                                        <th>%&nbsp;&nbsp;Workplan</th>
                                        <th>Expenditure (Quarter)(Ugx)</th>
                                        <th>Cumulative Expenditure(Ugx)</th>
                                        <th>Annual Budget(Ugx)</th>
                                        <th>Comments</th>
                                        
                                    </tr>
                                </thead>
                                <tbody id="tBody"></tbody>
                                 <tfoot>
                                     <tr style="position: sticky; bottom:0;">
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td><button type="button" class="btn btn-secondary w-100" onclick="total()">Total</button></td>
                                         <td><input disabled type="text" id="Total1" class="form-control" placeholder="Total"  /></td>
                                         <td><input disabled type="text" id="Total2" class="form-control" placeholder="Total"  /></td>
                                         <td><input disabled type="text" id="Total3" class="form-control" placeholder="Total"  /></td>
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
                                                <input type="text" class="form-control" id="txtTitleId" placeholder="Enter the Title of Document" title="Enter the Title of Document" />
                                                <label for="txtTitleId">Title <span>*</span></label>
                                                <span class="invalid-feedback is-invalid">please enter the title of document</span>
                                            </div>
                                        </div>
                                        <div class="col-3 mt-2">
                                            <input class="form-control form-control-lg" id="docFormFile1Id" type="file">
                                            <span class="invalid-feedback is-invalid">please select file</span>
                                        </div>
                                        <div class="col-3 text-sm-start mt-4 fst-italic" style="font-weight: 400">(Document File, Max 10MB) <span>*</span></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row p-1 m-1">
                                        <div class="col-3">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="txtCaoLetterId" placeholder="Cao Letter" title="Enter the TItle of Coa Letter" />
                                                <label for="caoLetterId">Cao Letter <span>*</span></label>
                                            </div>
                                        </div>
                                        <div class="col-3 mt-2">
                                            <input class="form-control form-control-lg" id="docFormFile2Id" type="file">
                                            <span class="invalid-feedback is-invalid">please select file</span>
                                        </div>
                                        <div class="col-3 text-sm-start mt-4 fst-italic" style="font-weight: 400">(Document File, Max 10MB) <span>*</span></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex justify-content-center">
                                        <div class="p-2">
                                            <button type="button" id="vtnSId" onclick="update()" class="btn btn-info text-light">Submit</button>&nbsp;
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
