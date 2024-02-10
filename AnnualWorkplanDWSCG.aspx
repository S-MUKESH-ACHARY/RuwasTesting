<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="AnnualWorkplanDWSCG.aspx.cs" Inherits="RUWAS.Annual_Workplan_DWSCG" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("dataEntryId").classList.add("DE");
            getFinancialYr();
            getRWSRC();
            /*fetchLC();*/
            ModelActivityTable();
            getBudgetType();
            /*fetchModelActivityNumber();*/
            const currentDate = new Date();
            const formattedDate = currentDate.toISOString().split('T')[0];
            document.getElementById('dateOfApprovalByCouncilId').value = formattedDate;
            $("#search").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable_body tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        })
        /*Save Annual Workplan*/
        function save() {
            removeNullRow();
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
            let slctBudgetType = $("#slctBudgetTypeId").val();
            if (slctBudgetType == "") {
                $("#slctBudgetTypeId").addClass("is-invalid");
                $("#slctBudgetTypeId").focus();
                return false;
            } else {
                $("#slctBudgetTypeId").removeClass("is-invalid");
                $("#slctBudgetTypeId").addClass("is-valid");
            }
            let dateOfApprovalByCouncil = $("#dateOfApprovalByCouncilId").val();
            if (dateOfApprovalByCouncil == "") {
                $("#dateOfApprovalByCouncilId").addClass("is-invalid");
                $("#dateOfApprovalByCouncilId").focus();
                return false;
            } else {
                $("#dateOfApprovalByCouncilId").removeClass("is-invalid");
                $("#dateOfApprovalByCouncilId").addClass("is-valid");
            }
            
            //if (txtTotalAnnualBudget == "") {
            //    $("#txtTotalAnnualBudgetId").addClass("is-invalid");
            //    $("#txtTotalAnnualBudgetId").focus();
            //    return false;
            //} else {
            //    $("#txtTotalAnnualBudgetId").removeClass("is-invalid");
            //    $("#txtTotalAnnualBudgetId").addClass("is-valid");
            //}

            /*ModelActivityDetails Array*/
            var ModelActivityOfAnnualWorkplanList = [];
            let quarter1 = 0;
            let quarter2 = 0;
            let quarter3 = 0;
            let quarter4 = 0;
            let annualBudget = 0;
            /*Fetching table data to the Array*/
            $("#myTable>tbody>tr").each(function () {
                let txtSlNo = $(this).find(".txtSlNo").text();
                let txtModelActivity = $(this).find(".txtModelActivity").text();
                let txtApprovalAnnualTarget = $(this).find(".txtApprovalAnnualTarget").val();
                if (txtApprovalAnnualTarget == "") {
                    txtApprovalAnnualTarget = "0";
                }
                let txtQuarter1 = $(this).find(".txtQuarter1").val();
                if (txtQuarter1 == "") {
                    txtQuarter1 = "0";
                }
                let txtQuarter2 = $(this).find(".txtQuarter2").val();
                if (txtQuarter2 == "") {
                    txtQuarter2 = "0";
                }
                let txtQuarter3 = $(this).find(".txtQuarter3").val();
                if (txtQuarter3 == "") {
                    txtQuarter3 = "0";
                }
                let txtQuarter4 = $(this).find(".txtQuarter4").val();
                if (txtQuarter4 == "") {
                    txtQuarter4 = "0";
                }
                let txtAnnualBudget = $(this).find(".txtAnnualBudget").val();
                if (txtAnnualBudget == "") {
                    txtAnnualBudget = "0";
                }
                let txtUnitCost = $(this).find(".txtUnitCost").val();
                if (txtUnitCost == "") {
                    txtUnitCost = "0";
                }
                let txtComment = $(this).find(".txtComment").val();
                ModelActivityOfAnnualWorkplanList.push({ txtSlNo: txtSlNo, txtModelActivity: txtModelActivity, txtApprovalAnnualTarget: txtApprovalAnnualTarget, txtQuarter1: txtQuarter1, txtQuarter2: txtQuarter2, txtQuarter3: txtQuarter3, txtQuarter4: txtQuarter4, txtAnnualBudget: txtAnnualBudget, txtUnitCost: txtUnitCost, txtComment });
                quarter1 = quarter1 + Number(txtQuarter1);
                quarter2 = quarter2 + Number(txtQuarter2);
                quarter3 = quarter3 + Number(txtQuarter3);
                quarter4 = quarter4 + Number(txtQuarter4);
                annualBudget = annualBudget + Number(txtAnnualBudget);
            })
            $("#txtTotalAnnualBudgetId").val(annualBudget);
            let txtTotalAnnualBudget = $("#txtTotalAnnualBudgetId").val();
            
           /* OP*/
            var data = {
                "op": "SaveAnnualWorkplanDWSCG",
                "slctFinancialYear": slctFinancialYear,
                "slctRWSRC": slctRWSRC,
                "slctLocalGovernment": slctLocalGovernment,
                "slctBudgetType": slctBudgetType,
                "dateOfApprovalByCouncil": dateOfApprovalByCouncil,
                "txtTotalAnnualBudget": txtTotalAnnualBudget,
                "quarter1Funds": quarter1,
                "quarter2Funds": quarter2,
                "quarter3Funds": quarter3,
                "quarter4Funds": quarter4,
                "ModelActivityOfAnnualWorkplanList": ModelActivityOfAnnualWorkplanList
            }
            console.log(data);
            var s = function (sms) {
                alert(sms);
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandlerUsingJson_POST(data, s, e)
        }
        function update() {
            removeNullRow();
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
            let slctBudgetType = $("#slctBudgetTypeId").val();
            if (slctBudgetType == "") {
                $("#slctBudgetTypeId").addClass("is-invalid");
                $("#slctBudgetTypeId").focus();
                return false;
            } else {
                $("#slctBudgetTypeId").removeClass("is-invalid");
                $("#slctBudgetTypeId").addClass("is-valid");
            }
            let dateOfApprovalByCouncil = $("#dateOfApprovalByCouncilId").val();
            if (dateOfApprovalByCouncil == "") {
                $("#dateOfApprovalByCouncilId").addClass("is-invalid");
                $("#dateOfApprovalByCouncilId").focus();
                return false;
            } else {
                $("#dateOfApprovalByCouncilId").removeClass("is-invalid");
                $("#dateOfApprovalByCouncilId").addClass("is-valid");
            }
            let WorkplanId = $("#txtWorkplanId").html();
            var ModelActivityOfAnnualWorkplanList = [];
            let quarter1 = 0;
            let quarter2 = 0;
            let quarter3 = 0;
            let quarter4 = 0;
            let annualBudget = 0;
            /*Fetching table data to the Array*/
            $("#myTable>tbody>tr").each(function () {
                let workPlanDetailId = $(this).find(".txtworkPlanDetailId").text();
                let txtSlNo = $(this).find(".txtSlNo").text();
                let txtModelActivity = $(this).find(".txtModelActivity").text();
                let txtApprovalAnnualTarget = $(this).find(".txtApprovalAnnualTarget").val();
                if (txtApprovalAnnualTarget == "") {
                    txtApprovalAnnualTarget = "0";
                }
                let txtQuarter1 = $(this).find(".txtQuarter1").val();
                if (txtQuarter1 == "") {
                    txtQuarter1 = "0";
                }
                let txtQuarter2 = $(this).find(".txtQuarter2").val();
                if (txtQuarter2 == "") {
                    txtQuarter2 = "0";
                }
                let txtQuarter3 = $(this).find(".txtQuarter3").val();
                if (txtQuarter3 == "") {
                    txtQuarter3 = "0";
                }
                let txtQuarter4 = $(this).find(".txtQuarter4").val();
                if (txtQuarter4 == "") {
                    txtQuarter4 = "0";
                }
                let txtAnnualBudget = $(this).find(".txtAnnualBudget").val();
                if (txtAnnualBudget == "") {
                    txtAnnualBudget = "0";
                }
                let txtUnitCost = $(this).find(".txtUnitCost").val();
                if (txtUnitCost == "") {
                    txtUnitCost = "0";
                }
                let txtComment = $(this).find(".txtComment").val();
                ModelActivityOfAnnualWorkplanList.push({ workPlanDetailId: workPlanDetailId,txtSlNo: txtSlNo, txtModelActivity: txtModelActivity, txtApprovalAnnualTarget: txtApprovalAnnualTarget, txtQuarter1: txtQuarter1, txtQuarter2: txtQuarter2, txtQuarter3: txtQuarter3, txtQuarter4: txtQuarter4, txtAnnualBudget: txtAnnualBudget, txtUnitCost: txtUnitCost, txtComment });
                quarter1 = quarter1 + Number(txtQuarter1);
                quarter2 = quarter2 + Number(txtQuarter2);
                quarter3 = quarter3 + Number(txtQuarter3);
                quarter4 = quarter4 + Number(txtQuarter4);
                annualBudget = annualBudget + Number(txtAnnualBudget);
            })
            $("#txtTotalAnnualBudgetId").val(annualBudget);
            let txtTotalAnnualBudget = $("#txtTotalAnnualBudgetId").val();

            /* OP*/
            var data = {
                "op": "UpdateAnnualWorkplanDWSCG",
                "WorkplanId": WorkplanId,
                "slctFinancialYear": slctFinancialYear,
                "slctRWSRC": slctRWSRC,
                "slctLocalGovernment": slctLocalGovernment,
                "slctBudgetType": slctBudgetType,
                "dateOfApprovalByCouncil": dateOfApprovalByCouncil,
                "txtTotalAnnualBudget": txtTotalAnnualBudget,
                "quarter1Funds": quarter1,
                "quarter2Funds": quarter2,
                "quarter3Funds": quarter3,
                "quarter4Funds": quarter4,
                "ModelActivityOfAnnualWorkplanList": ModelActivityOfAnnualWorkplanList
            }
            
            var s = function (sms) {
                alert(sms);
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandlerUsingJson_POST(data, s, e)
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
        //function ModelActivityTable() {
        //    let ModelActivityFilterByNumber = $("#txtModelActivityFilterByNumberId").val();
        //    ModelActivityFilterByNumber = ModelActivityFilterByNumber + '%';
        //    /*var data = { 'op': 'FetchModelActivityOfWorkplan', "ModelActivityFilterByNumber": ModelActivityFilterByNumber}*/
        //    var data = { 'op': 'FetchModelActivityOfWorkplan', "ModelActivityFilterByNumber": ModelActivityFilterByNumber}
        //    var s = function (sms) {
        //        $("#myTable_body").html("");
        //        sms.forEach(function (item) {
        //            var row = `<tr>`
        //            row = row + `<td class="txtSlNo">` +  item.SlNo + `</td>` +
        //                `<td class="txtModelActivity">` + item.ModelActivityName + `</td>` +
        //                `<td>` +`<input disabled type="number" class="form-control txtApprovalAnnualTarget " id="total"  placeholder="0" />`+ `</td>` +
        //                `<td>` +`<input type="number" class="form-control txtQuarter1 Q"  placeholder="0" />`+ `</td>` +
        //                `<td>` +`<input type="number" class="form-control txtQuarter2 Q" placeholder="0" />`+ `</td>` +
        //                `<td>` +`<input type="number" class="form-control txtQuarter3 Q" placeholder="0" />`+ `</td>` +
        //                `<td>` +`<input type="number" class="form-control txtQuarter4 Q" placeholder="0" />`+ `</td>` +
        //                `<td>` +`<input disabled type="number" class="form-control txtAnnualBudget" placeholder="0" />`+ `</td>` +
        //                `<td>` +`<input type="number" class="form-control txtUnitCost" placeholder="0" />`+ `</td>` +
        //                /*`<td>` + `<textarea typeof="text" class="form-control txtComment"></textarea>` + `</td>`+*/                   
        //                /*`<td>` + `<button type="button" class="btn btn-light" onclick="removeNewRow(this)"><i class="fa-solid fa-circle-minus fa-1x"></i></button>` + `</td></tr>`*/
        //                `<td>` + `<textarea typeof="text" class="form-control txtComment"></textarea>` + `</td></tr>`
        //            $("#myTable").append(row);
        //        })
        //       /* Sum of Q!, Q2, Q3, Q4 in txtApprovalAnnualTarget*/
        //        $(".Q").on('keyup', function () {
        //            var sum = 0;
        //            var $row = $(this).closest('tr');
        //            $row.find(".Q").each(function () {
        //                if (this.value.length != 0) {
        //                    sum += parseFloat(this.value);
        //                }
        //            })
        //            $row.find(".txtApprovalAnnualTarget").val(sum);
        //        })
        //        /*Multiplication of UntiCost and txtApprovalAnnualTarget*/
        //        $(".txtUnitCost").on('keyup', function () {
        //            var mul = 1;
        //            var $row = $(this).closest('tr');
        //            var AnnualTarget = $row.find(".txtApprovalAnnualTarget").val();
        //            $row.find(".txtUnitCost").each(function (){
        //                if (this.value.length != 0) {
        //                    mul = AnnualTarget * parseFloat(this.value);
        //                }
        //            })
        //            $row.find(".txtAnnualBudget").val(mul);
        //        })
        //        $(".txtUnitCost").on('keyup', function () {
        //            let annualBudget = 0;
        //            var $row = $(this).closest('tr');
        //            var AB = $row.find(".txtAnnualBudget").val();
        //            $row.find(".txtAnnualBudget").each(function () {
        //                if (this.value.length != 0) {
        //                    annualBudget = annualBudget + AB;
        //                }
        //            })
        //            $("#txtTotalAnnualBudgetId").val(annualBudget);
        //        })
        //    }
        //    var e = function (msg) {
        //        alert(msg);
        //    }
        //    CallHandler(data, s, e);
        //}
        function ModelActivityTable() {
            //document.getElementById("plannedFundsId").innerHTML="";
            document.getElementById("btnSave").style.display = "block";
            document.getElementById("btnUpdate").style.display = "none";
            var data = { 'op': 'ModelActivityTable'}
            var s = function (sms) {
                $("#myTable_body").html("");
                if (Array.isArray(sms)) {
                    sms.forEach(function (item) {
                        if (item.Under == 'Work plan') {
                            var row = `<tr>`
                            row = row + `<td class="txtworkPlanDetailId">` + item.ModelActivityDetailId + `</td>` +
                            `<td class="txtSlNo">` + item.SlNo + `</td>` +
                                `<td class="txtModelActivity">` + item.ModelActivityName + `</td>` +
                                `<td>` + `<input disabled type="number" class="form-control txtApprovalAnnualTarget "  placeholder="0" />` + `</td>` +
                                `<td>` + `<input type="number" class="form-control txtQuarter1 Q"  placeholder="0" />` + `</td>` +
                                `<td>` + `<input type="number" class="form-control txtQuarter2 Q" placeholder="0" />` + `</td>` +
                                `<td>` + `<input type="number" class="form-control txtQuarter3 Q" placeholder="0" />` + `</td>` +
                                `<td>` + `<input type="number" class="form-control txtQuarter4 Q" placeholder="0" />` + `</td>` +
                                `<td>` + `<input  type="number" class="form-control txtAnnualBudget" placeholder="0" />` + `</td>` +
                                `<td>` + `<input disabled type="number" class="form-control txtUnitCost" placeholder="0" />` + `</td>` +
                                /*`<td>` + `<textarea typeof="text" class="form-control txtComment"></textarea>` + `</td>`+*/
                                /*`<td>` + `<button type="button" class="btn btn-light" onclick="removeNewRow(this)"><i class="fa-solid fa-circle-minus fa-1x"></i></button>` + `</td></tr>`*/
                                `<td>` + `<textarea typeof="text" class="form-control txtComment"></textarea>` + `</td></tr>`
                            $("#myTable").append(row);
                        }
                        
                    })
                    
                    new DataTable('#myTable', {
                        scrollX: true,
                        paging: false,
                        scrollY: '70vh',
                        bFilter: false,
                        bInfo: false
                    });
                    /* Sum of Q!, Q2, Q3, Q4 in txtApprovalAnnualTarget*/
                    $(".Q").on('keyup', function () {
                        var sum = 0;
                        var $row = $(this).closest('tr');
                        $row.find(".Q").each(function () {
                            if (this.value.length != 0) {
                                sum += parseFloat(this.value);
                            }
                        })
                        $row.find(".txtApprovalAnnualTarget").val(sum);
                    })
                    /*Multiplication of UntiCost and txtApprovalAnnualTarget*/
                    //$(".txtUnitCost").on('keyup', function () {
                    //    var mul = 0;
                    //    var $row = $(this).closest('tr');
                    //    var AnnualTarget = $row.find(".txtApprovalAnnualTarget").val();
                    //    $row.find(".txtUnitCost").each(function () {
                    //        if (this.value.length != 0) {
                    //            mul = AnnualTarget * parseFloat(this.value);
                    //        }
                    //    })
                    //    $row.find(".txtAnnualBudget").val(mul);
                    //})
                    $(".txtAnnualBudget").on('keyup', function () {
                        var mul = 0;
                        var $row = $(this).closest('tr');
                        var AnnualTarget = $row.find(".txtApprovalAnnualTarget").val();
                        $row.find(".txtAnnualBudget").each(function () {
                            if (this.value.length != 0) {
                                mul = parseFloat(this.value) / AnnualTarget;
                                $(this).css("background-color", "#FEFFB0");
                            }
                        })
                        $row.find(".txtUnitCost").val(mul);
                    })
                    let annualBudget = 0;
                    $(".txtUnitCost").on('keyup', function () {
                        var $row = $(this).closest('tr');
                        var AB = $row.find(".txtAnnualBudget").val();
                        $row.find(".txtAnnualBudget").each(function () {
                            if (this.value.length != 0) {
                                annualBudget = parseInt(annualBudget) + parseInt(AB);
                            }
                        })
                        $("#txtTotalAnnualBudgetId").val(annualBudget);
                    })
                } else {
                    alert(sms);
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function removeNullRow() {
            var $rows = $("#myTable").find('tr');
            $rows.each(function () {
                var $currentRow = $(this);
                var valueInApprovalAnnualTarget = $currentRow.find(".txtApprovalAnnualTarget").val();
                if (valueInApprovalAnnualTarget == 0) {
                    $currentRow.remove();
                }
            });
        }
        //function removeNewRow() {
        //    var $row = $("#myTable").find('tr');

        //    $row.find('.txtApprovalAnnualTarget').each(function () {
        //        let FindZero = $row.find(".txtApprovalAnnualTarget").val();
        //        if (FindZero == 0) {
        //            $row.find('.txtApprovalAnnualTarget').parent().parent().remove();
        //            /*alert(FindZero);*/
        //        }
        //        else {
        //            alert(FindZero);
        //        }
        //    });
        //}
        /*Financial Year Dropdown*/
        function getFinancialYr() {
            var data = { 'op': 'FetchFinancialYear'}
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let AddFinancialYr = $("#slctFinancialYearId");
                    let option1 = document.createElement('option');
                    option1.value = "";
                    option1.text = "Choose from the list";
                    AddFinancialYr.append(option1);
                    sms.forEach(function (item) {
                        let option = document.createElement('option');
                        option.value = item.FinancialYr;
                        option.text = item.FinancialYrName;
                        AddFinancialYr.append(option);
                        $('#slctFinancialYearId option:gt(' + (5) + ')').remove();
                    })
                    sms.forEach(function (item) {
                        if (item.IsActive == 1) {
                            $("#slctFinancialYearId").val(item.FinancialYr);
                        }
                    });
                }
                else
                {
                    alert(sms);
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        /*RWSRC Dropdown*/
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
        /*LC Dropdown*/
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
        /*Budget Type Dropdown*/
        function getBudgetType() {
            var data = { 'op': 'FetchBudgetTypeTable' }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let BudgetType = document.getElementById("slctBudgetTypeId");
                    sms.forEach(function (item) {
                        if (item.IsDeleted != 1) {
                            let option = document.createElement('option');
                            option.value = item.BudgetTypeId;
                            option.text = item.BudgetTypeName;
                            BudgetType.append(option);
                        }
                    })
                }
            }
            var e = function (msg) {
                alert(msg);
                console.log(msg);
            }
            CallHandler(data, s, e)
        }

        function TotalAnnualBudget() {
            let FinancialYear = $("#slctFinancialYearId").val();
            let LocalGovernment = $("#slctLocalGovernmentId").val();
            let BudgetType = $("#slctBudgetTypeId option:selected").text();
            /*$('#yourdropdownid').find('option:selected').text();*/
            var data = { 'op': 'PlannedFunds', 'FinancialYear': FinancialYear, 'LocalGovernment': LocalGovernment, 'BudgetType': BudgetType }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    sms.forEach(function (item) {
                        $("#plannedFundsId").val(item.PlanedFund);
                    })
                } else {
                    alert(sms);
                }
            }
            var e = function (msg) {
                alert(msg);
                console.log(msg);
            }
            CallHandler(data, s, e)
        }
        //function fetchModelActivityNumber() {
        //    var data = { "op": "ModelActivityNumber" }
        //    var s = function (sms) {
        //        var ModelActivityNumber = document.getElementById("txtModelActivityFilterByNumberId");
        //        if (Array.isArray(sms)) {
        //           /* console.log(sms);*/
        //            sms.forEach(function (item) {
        //                let option = document.createElement("option");
        //                option.value = item.SlNo;
        //                option.text = item.SlNo;
        //                ModelActivityNumber.append(option);
        //            })
        //            $("#txtModelActivityFilterByNumberId").selectpicker("refresh");
        //        }
        //    }
        //    var e = function (msg) {
        //        alert(msg);
        //    }
        //    CallHandler(data, s, e);
        //}
        
        function getWorkplanId() {
            $("#slctBudgetTypeId").prop("disabled", false);
            document.getElementById("btnSave").style.display = "none";
            document.getElementById("btnUpdate").style.display = "block";
            let FinancialYear = $("#slctFinancialYearId").val();
            let LocalGovernment = $("#slctLocalGovernmentId").val();
            let data = { "op": "GetWorkplanIdOfWorkplans", "FinancialYear": FinancialYear, "LocalGovernment": LocalGovernment };
            let s = function (sms) {
                $("#myTable_body").html("");
                $("#myTable").DataTable().clear().destroy();
                var WorkPlanId;
                var PreparedDate;
                var TotalAprovedBudget;
                var SlctBudgetTypeId;
                if (Array.isArray(sms)) {
                    sms.forEach(function (item) {
                        var row = `<tr>`;
                        row = row + `<td class="txtworkPlanDetailId">` + item.workPlanDetailId + `</td>` +
                         `<td class="txtSlNo">` + item.SlNo + `</td>` +
                            `<td class="txtModelActivity">` + item.ModelActivity + `</td>` +
                            `<td>` + `<input disabled type="number" class="form-control txtApprovalAnnualTarget " value="` + item.ApprovalAnualTargrt + `" />` + `</td>` +
                            `<td>` + `<input type="number" class="form-control txtQuarter1 Q" value="` + item.Quarter1 + `" />` + `</td>` +
                            `<td>` + `<input type="number" class="form-control txtQuarter2 Q" value="` + item.Quarter2 + `" />` + `</td>` +
                            `<td>` + `<input type="number" class="form-control txtQuarter3 Q" value="` + item.Quarter3 + `" />` + `</td>` +
                            `<td>` + `<input type="number" class="form-control txtQuarter4 Q" value="` + item.Quarter4 + `" />` + `</td>` +
                            `<td>` + `<input disabled type="number" class="form-control txtAnnualBudget" value="` + item.AnnualBudget + `" />` + `</td>` +
                            `<td>` + `<input type="number" class="form-control txtUnitCost" value="` + item.UnitCost + `" />` + `</td>` +
                            `<td>` + `<textarea typeof="text" class="form-control txtComment" txtComment">` + item.Comment + `</textarea>` + `</td></tr>`
                        $("#myTable").append(row);
                        WorkPlanId = item.WorkplanId;
                        PreparedDate = item.PreparedDate
                        TotalAprovedBudget = item.TotalAprovedBudget;
                        SlctBudgetTypeId = item.BudgetTypeId;
                        //console.log(OpeningDate);
                    })
                    $("#txtWorkplanId").html(WorkPlanId);
                    $("#dateOfApprovalByCouncilId").val(PreparedDate);
                    $("#txtTotalAnnualBudgetId").val(TotalAprovedBudget);
                    $("#slctBudgetTypeId").val(SlctBudgetTypeId);
                    

                    new DataTable('#myTable', {
                        scrollX: true,
                        paging: false,
                        scrollY: '70vh',
                        bFilter: false,
                        bInfo: false
                    });
                    /* Sum of Q!, Q2, Q3, Q4 in txtApprovalAnnualTarget*/
                    $(".Q").on('keyup', function () {
                        var sum = 0;
                        var $row = $(this).closest('tr');
                        $row.find(".Q").each(function () {
                            if (this.value.length != 0) {
                                sum += parseFloat(this.value);
                                $(this).css("background-color", "#FEFFB0");
                            }
                        })
                        $row.find(".txtApprovalAnnualTarget").val(sum);
                    })
                    /*Multiplication of UntiCost and txtApprovalAnnualTarget*/
                    $(".txtUnitCost").on('keyup', function () {
                        var mul = 0;
                        var $row = $(this).closest('tr');
                        var AnnualTarget = $row.find(".txtApprovalAnnualTarget").val();
                        $row.find(".txtUnitCost").each(function () {
                            if (this.value.length != 0) {
                                mul = AnnualTarget * parseFloat(this.value);
                                $(this).css("background-color", "#FEFFB0");
                            }
                        })
                        $row.find(".txtAnnualBudget").val(mul);
                    })
                    let annualBudget = 0;
                    $(".txtUnitCost").on('keyup', function () {
                        var $row = $(this).closest('tr');
                        var AB = $row.find(".txtAnnualBudget").val();
                        $row.find(".txtAnnualBudget").each(function () {
                            if (this.value.length != 0) {
                                annualBudget = parseInt(annualBudget) + parseInt(AB);
                            }
                        })
                        $("#txtTotalAnnualBudgetId").val(annualBudget);
                    })
                } else {
                    alert(sms);
                }
            }
            let e = function (msg) {
                alert("Add a new work plan");
                $("#myTable").DataTable().clear().destroy();
                ModelActivityTable();
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
                success: s,
                error: e,
                data: d
            })
        }
    </script>
     <style>
        label,th,td{
           /*font-size:17px;*/
            font-weight:500;
        }
        label>span {
            font-size: 13px;
            font-weight: bold;
            color:red;
        }
        th>span {
            font-size: 13px;
            font-weight: bold;
            color:red;
        }
       /* .bootstrap-select > .dropdown-toggle {
           border: 1px solid #ced4da;
           border-radius: 11px !important;
           height: calc(3.5rem + 2px);
           color: black !important;
           font-size: 12px !important;
           font-weight: 600;
       }
       .form-control-sm {
           font-size: 14px;
           border-radius:14px;
       }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container-fluid">
         <div class="m-2 pt-2">
             <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='DashBoard.aspx'"></i>&nbsp;&nbsp;Data Entry</li>
                <li class="breadcrumb-item h6">Annual Workplan (DWSCG)</li>
            </ol>
        </nav>
        </div>
        <div class="d-flix justify-content-between">
            <div>
                <div class="card shadow mb-5 bg-white rounded">
                    <div class="card-header text-center h5 alert alert-info">Annual Workplan (DWSCG)</div>
                    <div class="card-body">
                        <label id="txtWorkplanId"></label>
                                    <div class="row p-1 m-1">
                                        <div class="col-lg-3 col-12">
                                            <div class="form-floating">
                                                <select class="form-select" id="slctFinancialYearId" title="Financial Year">
                                                </select>
                                                <label class="slctFinancialYearId">Financial Year <span>*</span></label>
                                                <span class="invalid-feedback is-invalid">please select Financial year</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-sm-6">
                                            <div class="form-floating">
                                                <select class="form-select" id="slctRWSRCId" onchange="fetchLC()">
                                                    <option value="">Choose from List</option>
                                                </select>
                                                <label for="slctRWSRCId">RWSRC <span>*</span></label>
                                                <span class="invalid-feedback is-invalid">please select from list</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-sm-6">
                                            <div class="form-floating">
                                                <select disabled class="form-select" id="slctLocalGovernmentId" aria-label="A" onchange="getWorkplanId()">
                                                    <option value="">Choose from List</option>
                                                </select>
                                                <label for="slctLocalGovernmentId">Local Government <span>*</span></label>
                                                <span class="invalid-feedback is-invalid">please select from list</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-sm-6">
                                            <div class="form-floating">
                                                <select class="form-select" disabled id="slctBudgetTypeId" aria-label="A" onchange="TotalAnnualBudget()">
                                                    <option value="">Choose from List</option>
                                                </select>
                                                <label for="slctBudgetTypeId" onchange="get">Budget Type <span>*</span></label>
                                                <span class="invalid-feedback is-invalid">please select from list</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row p-1 m-1">
                                        <div class="col-lg-3 col-sm-6">
                                            <div class="form-floating">
                                                <input type="Date" class="form-control" id="dateOfApprovalByCouncilId" placeholder="Date of Approval by Council" />
                                                <label for="dateOfApprovalByCouncilId">Date of Approval by Council <span>*</span></label>
                                                <span class="invalid-feedback is-invalid">please select date</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-sm-6">
                                            <div class="form-floating">
                                                <input disabled type="Number" class="form-control text" id="plannedFundsId" placeholder="Planned Funds" title="Planned Funds" />
                                                <label for="plannedFundsId">Planned Funds (Ugx)</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-sm-6">
                                            <div class="form-floating">
                                                <input disabled type="Number" class="form-control" id="txtTotalAnnualBudgetId" placeholder="Total Annual Budget" title="Total Annual Budget" />
                                                <label for="txtTotalAnnualBudgetId">Total Annual Budget (Ugx)</label>
                                            </div>
                                        </div>
                                        <%--<div class="col-lg-3 col-sm-6">
                                                <select id="txtModelActivityFilterByNumberId" data-live-search="true"  aria-multiselectable="true" onchange="ModelActivityTable()" class="form-control default selectpicker" multiple title="Model Activity Filter By Number">
                                                    <option value="">All</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                </select>
                                        </div>--%>
                                    </div>
                        <div class="row p-1 m-1">
                               <div class="col-lg-12 col-sm-6">
                                 <div class="form-floating">
                                     <input type="text" class="form-control" id="search" placeholder="Search Here...." title="Search Here...." />
                                     <label for="search">Search By Model Activity Name/Number....</label>
                                 </div>
                             </div>
                          </div>
                <%--Table--%>                
                          
                             <div <%--style="overflow-y: visible; height: 400px; width: 150rem;" class="ms-3 me-3 mt-2 table-responsive "--%>>
                                 <table id="myTable" style="text-align: center;" class="table table-hover">
                                     <thead class="table-secondary" <%--style="position: sticky; top: 0;"--%>>
                                         <tr>
                                             <th>workPlanDetailId</th>
                                             <th>No</th>
                                             <th style="width: 250px;">Model Activity</th>
                                             <th style="width: 150px;">Approval Annual Target</th>
                                             <th style="width: 150px;">Quarter 1 (July-Sept) <span>*</span></th>
                                             <th style="width: 150px;">Quarter 2 (Oct-Dec) <span>*</span></th>
                                             <th style="width: 160px;">Quarter 3 (Jan-March) <span>*</span></th>
                                             <th style="width: 150px;">Quarter 4 (Apr-Jun) <span>*</span></th>
                                             <th style="width: 150px;">Annual Budget</th>
                                             <th style="width: 150px;">Unit Cost <span>*</span></th>
                                             <th style="width: 250px;">Comment</th>
                                            <%-- <th>Remove</th>--%>
                                         </tr>
                                     </thead>
                                     <tbody id="myTable_body">
                                     </tbody>
                                     <%-- <tr>
                                 <td>1.1</td>
                                 <td>Creating report with the village leader(LCs & VHTs) on parameters and setting date for the launch.</td>
                                 <td>
                                     <input disabled type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input disabled type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <textarea typeof="text" class="form-control"></textarea></td>
                             </tr>
                             <tr>
                                 <td>1.2</td>
                                 <td>Launching of the campaign at village level</td>
                                 <td>
                                     <input disabled type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input disabled type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <textarea typeof="text" class="form-control"></textarea></td>
                             </tr>
                             <tr>
                                 <td>1.3</td>
                                 <td>Implementation-community baselines((Transects,Mapping,PHAST tools),CAP</td>
                                 <td>
                                     <input disabled type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input type="number" class="form-control" placeholder="0" /></td>
                                 <td>
                                     <input disabled type="number" class="form-control" placeholder="0" /></td>

                                 <td>
                                     <textarea typeof="text" class="form-control"></textarea></td>
                             </tr>
                             <tr>
                                 <td></td>
                             </tr>--%>
                                 </table>
                                 
                             </div>
                         
                        <hr />
                        <div class="d-flex justify-content-center mt-4">
                            <button type="button" class="btn btn-danger" onclick="removeNullRow()">Preview</button>&nbsp;
                            <button type="button" id="btnSave" class="btn btn-primary" onclick="save()">Save</button>&nbsp;
                            <button type="button" id="btnUpdate" class="btn btn-primary" onclick="update()">Update</button>&nbsp;
                            <button type="button" class="btn btn-success" onclick="location.reload();">View Workplan History</button>&nbsp;
                            <button type="button" class="btn btn-secondary" onclick="location.reload();">Print Workplan</button>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
