<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="ApplyForVariations.aspx.cs" Inherits="RUWAS.ApplyForVariations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("dataEntryId").classList.add("DE");
            loadFinancialYr();
            fetchUnder();
            fetchLC()
        })
        
        function save() {
            var SlctFinancialYear = $("#slctFinancialYearId").val();
            if (SlctFinancialYear == "") {
                $("#slctFinancialYearId").addClass("is-invalid");
                $("#slctFinancialYearId").focus();
                return false;
            } else {
                $("#slctFinancialYearId").removeClass("is-invalid");
                $("#slctFinancialYearId").addClass("is-valid");
            }
            //var workPlanId = $("#workPlanId").val();
            //if (workPlanId == "") {
            //    $("#workPlanId").addClass("is-invalid");
            //    $("#workPlanId").focus();
            //    return false;
            //} else {
            //    $("#workPlanId").removeClass("is-invalid");
            //    $("#workPlanId").addClass("is-valid");
            //}
            var quarter = $("#quarterId").val();
            if (quarter == "") {
                $("#quarterId").addClass("is-invalid");
                $("#quarterId").focus();
                return false;
            } else {
                $("#quarterId").removeClass("is-invalid");
                $("#quarterId").addClass("is-valid");
            }
            var slctUnder = $("#slctUnderId").val();
            if (slctUnder == "") {
                $("#slctUnderId").addClass("is-invalid");
                $("#slctUnderId").focus();
                return false;
            } else {
                $("#slctUnderId").removeClass("is-invalid");
                $("#slctUnderId").addClass("is-valid");
            }
            //var district = $("#districtId").val();
            //if (district == "") {
            //    $("#districtId").addClass("is-invalid");
            //    $("#districtId").focus();
            //    return false;
            //} else {
            //    $("#districtId").removeClass("is-invalid");
            //    $("#districtId").addClass("is-valid");
            //}
            //var county = $("#countyId").val();
            //if (county == "") {
            //    $("#countyId").addClass("is-invalid");
            //    $("#countyId").focus();
            //    return false;
            //} else {
            //    $("#countyId").removeClass("is-invalid");
            //    $("#countyId").addClass("is-valid");
            //}
            //var subCounty = $("#subCountyId").val();
            //if (subCounty == "") {
            //    $("#subCountyId").addClass("is-invalid");
            //    $("#subCountyId").focus();
            //    return false;
            //} else {
            //    $("#subCountyId").removeClass("is-invalid");
            //    $("#subCountyId").addClass("is-valid");
            //}
            //var parish = $("#parishId").val();
            //if (parish == "") {
            //    $("#parishId").addClass("is-invalid");
            //    $("#parishId").focus();
            //    return false;
            //} else {
            //    $("#parishId").removeClass("is-invalid");
            //    $("#parishId").addClass("is-valid");
            //}
            var localGoverment = $("#localGovermentId").val();
            if (localGoverment == "") {
                $("#localGovermentId").addClass("is-invalid");
                $("#localGovermentId").focus();
                return false;
            } else {
                $("#localGovermentId").removeClass("is-invalid");
                $("#localGovermentId").addClass("is-valid");
            }
            var fromId = $("#numfromId").val();
            if (fromId == "") {
                $("#numfromId").addClass("is-invalid");
                $("#numfromId").focus();
                return false;
            } else {
                $("#numfromId").removeClass("is-invalid");
                $("#numfromId").addClass("is-valid");
            }
            var numto = $("#numtoId").val();
            if (numto == "") {
                $("#numtoId").addClass("is-invalid");
                $("#numtoId").focus();
                return false;
            } else {
                $("#numtoId").removeClass("is-invalid");
                $("#numtoId").addClass("is-valid");
            }
            var variationValue = $("#variationValueId").val();
            if (variationValue == "") {
                $("#variationValueId").addClass("is-invalid");
                $("#variationValueId").focus();
                return false;
            } else {
                $("#variationValueId").removeClass("is-invalid");
                $("#variationValueId").addClass("is-valid");
            }
            //var annualBudget = $("#annualBudgetId").val();
            //if (annualBudget == "") {
            //    $("#annualBudgetId").addClass("is-invalid");
            //    $("#annualBudgetId").focus();
            //    return false;
            //} else {
            //    $("#annualBudgetId").removeClass("is-invalid");
            //    $("#annualBudgetId").addClass("is-valid");
            //}
            //var tageAmount = $("#tageAmountId").val();
            //if (tageAmount == "") {
            //    $("#tageAmountId").addClass("is-invalid");
            //    $("#tageAmountId").focus();
            //    return false;
            //} else {
            //    $("#tageAmountId").removeClass("is-invalid");
            //    $("#tageAmountId").addClass("is-valid");
            //}
            var floatingTextarea = $("#floatingTextarea").val();
            if (floatingTextarea == "") {
                $("#floatingTextarea").addClass("is-invalid");
                $("#floatingTextarea").focus();
                return false;
            } else {
                $("#floatingTextarea").removeClass("is-invalid");
                $("#floatingTextarea").addClass("is-valid");
            }
            var data = {
                'op': 'SaveApplyVariation',
                'SlctFinancialYear': SlctFinancialYear,
                'quarter': quarter,
                'slctUnder': slctUnder,
                'localGoverment': localGoverment,
                'fromId': fromId,
                'numto': numto,
                'variationValue': variationValue,
                'floatingTextarea': floatingTextarea
            }
            var s = function (sms) {
                alert(sms);
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function loadFinancialYr() {
            var data = {
                'op': 'FetchFinancialYear',
            }
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
        function fetchUnder() {
            let data = { "op": "FetchUnder" };
            let s = function (sms) {

                if (Array.isArray(sms)) {
                    let under = document.getElementById("slctUnderId");

                    sms.forEach((msg) => {
                        let option = document.createElement('option');
                        option.value = msg.budgetId;
                        option.text = msg.under;
                        under.appendChild(option);
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
        function fetchLC() {
            let data = { "op": "FetchLC" };
            let s = function (sms) {

                if (Array.isArray(sms)) {
                    let LC = document.getElementById("localGovermentId");
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
        label, th, td {
            /*font-size:17px;*/
            font-weight: 500;
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
                    <li class="breadcrumb-item h6">Apply for Variations</li>
                </ol>
            </nav>
        </div>
        <div class="d-flix justify-content-between">
            <div>
                <div class="card shadow mb-5 bg-white rounded">
                    <div class="card-header text-center h5 alert alert-info">Apply for Variations</div>
                    <div class="card-body">
                        <div>
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <div class="row p-1 m-1"><strong>1.Basic Information</strong></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row p-1 m-1">
                                            <div class="col-3">
                                                <div class="form-floating">
                                                    
                                                     <select class="form-select" id="slctFinancialYearId" title="Financial Year">
                                                        <option value="">Choose from List</option>
                                                    </select>
                                                    <label for="slctFinancialYearId">Financial Year <span>*</span></label>
                                                    <span class="invalid-feedback is-invalid">please select date</span>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="form-floating">
                                                    <input type="text" class="form-control" id="workPlanId" disabled placeholder="Work Plan Id" title="Enter Workplan Id" />
                                                    <label for="workPlanId">Work Plan Id</label>
                                                    <span class="invalid-feedback is-invalid">please enter work plan id</span>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row p-1 m-1">
                                            <div class="col-3">
                                                <div class="form-floating">
                                                    <select class="form-select" id="quarterId" title="Quarter">
                                                        <option value="">Choose from List</option>
                                                        <option value="1">Q One</option>
                                                        <option value="2">Q Two</option>
                                                        <option value="3">Q Three</option>
                                                        <option value="4">Q Four</option>
                                                    </select>
                                                    <label for="quarterId">Quarter <span>*</span></label>
                                                    <span class="invalid-feedback is-invalid">please select from list</span>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="form-floating">
                                                    <select class="form-select" id="slctUnderId" title="Under">
                                                        <option value="">Choose from List</option>
                                                    </select>
                                                    <label for="slctUnderId">Budget Type <span>*</span></label>
                                                    <span class="invalid-feedback is-invalid">please select from list</span>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="row p-1 m-1"><strong>2.Location Information</strong></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row p-1 m-1">

                                            <div class="col-3">
                                                <div class="form-floating">
                                                    <select class="form-select" id="districtId" title="District" disabled>
                                                        <option value="">Choose from List</option>
                                                        <option value="1">Example One</option>
                                                        <option value="2">Example Two</option>
                                                        <option value="3">Example Three</option>
                                                    </select>
                                                    <label for="districtId">District</label>
                                                    <span class="invalid-feedback is-invalid">please select from list</span>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="form-floating">
                                                    <select class="form-select" id="countyId" title="County" disabled>
                                                        <option value="">Choose from List</option>
                                                        <option value="1">Example One</option>
                                                        <option value="2">Example Two</option>
                                                        <option value="3">Example Three</option>
                                                    </select>
                                                    <label for="countyId">County</label>
                                                    <span class="invalid-feedback is-invalid">please select from list</span>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="form-floating">
                                                    <select class="form-select" id="subCountyId" title="Sub-County" disabled>
                                                        <option value="">Choose from List</option>
                                                        <option value="1">Example One</option>
                                                        <option value="2">Example Two</option>
                                                        <option value="3">Example Three</option>
                                                    </select>
                                                    <label for="subCountyId">Sub-County</label>
                                                    <span class="invalid-feedback is-invalid">please select from list</span>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="form-floating">
                                                    <select class="form-select" id="parishId" title="Parish" disabled>
                                                        <option value="">Choose from List</option>
                                                        <option value="1">Example One</option>
                                                        <option value="2">Example Two</option>
                                                        <option value="3">Example Three</option>
                                                    </select>
                                                    <label for="parishId">Parish</label>
                                                    <span class="invalid-feedback is-invalid">please select from list</span>
                                                </div>
                                            </div>

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row p-1 m-1">
                                            <div class="col-3">
                                                <div class="form-floating">
                                                    <select class="form-select" id="localGovermentId" title="Local Government">
                                                        <option value="">Choose from List</option>
                                                        
                                                    </select>
                                                    <label for="localGovermentId">Local Government <span>*</span></label>
                                                    <span class="invalid-feedback is-invalid">please select from list</span>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="row p-1 m-1"><strong>3.Variation Information</strong></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row p-1 m-1">
                                            <div class="col-3 pt-1">
                                                <label>Variation Type ?</label>
                                               <%-- <div class="form-check form-check-inline pt-1" style="margin-left: 5%">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" checked disabled>
                                                    <label class="form-check-label" for="inlineRadio1">Quarter</label>
                                                </div>--%>
                                                <div class="form-check form-check-inline pt-1">
                                                    <input class="form-check-input" type="radio" id="inlineRadio2"  name="inlineRadioOptions">
                                                    <label class="form-check-label" for="inlineRadio2">Value</label>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="form-floating">
                                                    <input type="number" id="numfromId" class="form-control" placeholder="From"/>
                                                    <label for="numfromId">From <span>*</span></label>
                                                    <span class="invalid-feedback is-invalid">please select from list</span>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="form-floating">
                                                    <input type="number" id="numtoId" class="form-control" placeholder="To"/>
                                                    <label for="numtoId">To <span>*</span></label>
                                                    <span class="invalid-feedback is-invalid">please select from list</span>
                                                </div>
                                            </div>
                                           
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row p-1 m-1">
                                            <div class="col-3">
                                                <div class="form-floating">
                                                    <input type="number" class="form-control" id="variationValueId" placeholder="Variation Value" title="Variation Value" />
                                                    <label for="variationValueId">Variation Value <span>*</span></label>
                                                    <span class="invalid-feedback is-invalid">please enter variation value</span>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="form-floating">
                                                    <input disabled type="number" class="form-control" id="annualBudgetId" placeholder="Annual Budget" title="Annual Budget" />
                                                    <label for="annualBudgetId">Annual Budget</label>
                                                    <span class="invalid-feedback is-invalid">please enter annual budget</span>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="form-floating">
                                                    <input disabled type="number" class="form-control" id="tageAmountId" placeholder="Tage Amount" title="Tag Amount" />
                                                    <label for="tageAmountId">Percentage Amount</label>
                                                    <span class="invalid-feedback is-invalid">please enter tage amount</span>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row p-1 m-1">
                                            <div class="col-6">
                                                <div class="form-floating">
                                                    <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" style="height: 100px"></textarea>
                                                    <label for="floatingTextarea">Reasons for Variation <span>*</span></label>
                                                    <span class="invalid-feedback is-invalid">please enter reasons for variation</span>
                                                </div>
                                            </div>
                                            <div class="col-3 mt-2">
                                            <input class="form-control form-control-lg" id="formFileL2Id" type="file">
                                            <span class="invalid-feedback is-invalid">please select file</span>
                                        
                                        <div class="col mt-1 text-sm-start fst-italic" style="font-weight: 400">(Document File, Max 10MB) <span>*</span></div>
                                    
                                        </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div class="d-flex justify-content-center m-1 p-1">
                                <button type="button" class="btn btn-warning" onclick="save()">Save</button>&nbsp;
                                <button type="button" class="btn btn-danger" onclick="location.reload();">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
