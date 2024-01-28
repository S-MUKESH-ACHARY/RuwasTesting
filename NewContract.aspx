<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewContract.aspx.cs" Inherits="RUWAS.NewContract" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("dataEntryId").classList.add("DE");
            addNewRow()
            fetchLC()
            loadFinancialYr()
        })
        function saveNewContract() {
            let slctLc = $("#slctLcId").val();
            if (slctLc == "") {
                $("#slctLcId").addClass("is-invalid");
                $("#slctLcId").focus();
                return false;
            } else {
                $("#slctLcId").removeClass("is-invalid");
                $("#slctLcId").addClass("is-valid");
            }
            let slctFinancialYr = $("#slctFinancialYrId").val();
            if (slctFinancialYr == "") {
                $("#slctFinancialYrId").addClass("is-invalid");
                $("#slctFinancialYrId").focus();
                return false;
            } else {
                $("#slctFinancialYrId").removeClass("is-invalid");
                $("#slctFinancialYrId").addClass("is-valid");
            }
            var CategoryDetailList = [];
            console.log(CategoryDetailList);
            $("#contractDtlTableId>tbody>tr").each(function () {
                let ContractsNumber = $(this).find("#txtContractNumberId").val();
                let ContractorName = $(this).find("#txtContractorNameId").val();
                let ContractorCountry = $(this).find("#txtContractorCountryId").val();
                let DescriptionGoods = $(this).find("#txtDescriptionGoodsId").val();
                let ContractSum = $(this).find("#txtContractSumId").val();
                let AnnualPaymenttUnderContract = $(this).find("#txtAnnualPaymenttUnderContractId").val();
                let Status = $(this).find("#slctStatusId").val();
                CategoryDetailList.push({ ContractsNumber: ContractsNumber, ContractorName: ContractorName, ContractorCountry: ContractorCountry, DescriptionGoods: DescriptionGoods, ContractSum: ContractSum, AnnualPaymenttUnderContract: AnnualPaymenttUnderContract, Status: Status });
            })
            let data = {
                "op": "Contracts",
                "LocalGovernment": slctLc,
                "FinancialYr": slctFinancialYr,
                "CategoryDetailList": CategoryDetailList
            }
            let s = function (sms) {
                alert(sms);
            }
            let e = function (msg) {
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
        function addNewRow() {
            let row = '<tr>';
            row += '<td><input id="txtContractNumberId" type="number" class="form-control" /></td>';
            row += '<td><input id="txtContractorNameId" type="text" class="form-control" /></td>';
            row += '<td><input id="txtContractorCountryId" type="text" class="form-control" /></td>';
            row += '<td><input id="txtDescriptionGoodsId" type="text" class="form-control" /></td>';
            row += '<td><input id="txtContractSumId" type="number" class="form-control" /></td>';
            row += '<td><input id="txtAnnualPaymenttUnderContractId" type="number" class="form-control" /></td>';
            row += '<td><select id="slctStatusId"  class="form-select" ><option value="1">Signed</option><option value="2">Awarded</option></select></td>';
            row += '<td class="d-flex"><button type="button" class="btn btn-light" onclick="addNewRow()"><i class="fa-solid fa-circle-plus fa-1x"></i></button>&nbsp;&nbsp;<button type="button" class="btn btn-light" onclick="removeNewRow(this)"><i class="fa-solid fa-circle-minus fa-1x"></i></button></td >';
            row += '</tr>';
            $("#myTable").append(row);
        }
        function removeNewRow(child) {
            let rowLength = $("#myTable tr").length;
            if (rowLength == 1) {
                alert("First row can't be deleted");
                return;
            } else {
                child.parentNode.parentNode.remove();
            }
        }
        function loadFinancialYr() {
            var data = {
                'op': 'FetchFinancialYear',
            }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let AddFinancialYr = $("#slctFinancialYrId");
                    sms.forEach(function (item) {
                        let option = document.createElement('option');
                        option.value = item.FinancialYr;
                        option.text = item.FinancialYrName;
                        AddFinancialYr.append(option);
                    })
                    sms.forEach(function (item) {
                        if (item.IsActive == 1) {
                            $("#slctFinancialYrId").val(item.FinancialYr);
                            console.log(item);
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
        function fetchLC() {
            let data = { "op": "FetchLC" };
            let s = function (sms) {

                if (Array.isArray(sms)) {
                    let LC = document.getElementById("slctLcId");

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
            /*font-size:17px;*/
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
                <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='Contracts.aspx'"></i>&nbsp;&nbsp;Data Entry</li>
                <li class="breadcrumb-item h6">Contracts</li>
                <li class="breadcrumb-item h6">New Contracts</li>
            </ol>
        </nav>
        </div>
        <div class="d-flix justify-content-between">
            <div>
                <div class="card shadow mb-5 bg-white rounded">
                    <div class="card-header text-center h5 alert alert-info">New Contracts</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3 col-12">
                                <div class="form-floating">
                                    <select class="form-select" id="slctLcId" title="Local Government">
                                        <option value="">Choose from List</option>
                                    </select>
                                    <label>Local Government <span>*</span></label>
                                    <span class="invalid-feedback is-invalid">Please select from list</span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-12">
                                <div class="form-floating">
                                    <select class="form-select" id="slctFinancialYrId" title="Financial Year">
                                        <option value="">Choose from List</option>
                                    </select>
                                    <label>Financial Year <span>*</span></label>
                                    <span class="invalid-feedback is-invalid">Please select from list</span>
                                </div>
                            </div>
                        </div>
                        <table id="contractDtlTableId"  class="table p-1 mt-5" style="text-align:center;width:100%;">
                            <thead>
                                <tr class="table-secondary">
                                <th>Contract Number</th>
                                <th>Name of Contractor or Consultant/Company Name</th>
                                <th>Country of Origin of Contractor or Consultant</th>
                                <th>Description of Goods,Services or Works Procured</th>
                                <th>Contract Sum (UGX)(000)</th>
                                <th>Annual Payment Under Contract</th>
                                <th>Status</th>
                                <th>Edit</th>
                            </tr>
                            </thead>
                            <tbody id="myTable">
                                <%--<tr>
                                <td><input type="number" class="form-control" /></td>
                                <td><input type="text" class="form-control" /></td>
                                <td><input type="text" class="form-control" /></td>
                                <td><input type="text" class="form-control" /></td>
                                <td><input type="text" class="form-control" /></td>
                                <td><input type="text" class="form-control" /></td>
                                <td>
                                    <select class="form-select">
                                        <option value="Signed">Signed</option>
                                        <option value="Awarded">Awarded</option>
                                    </select></td>
                                <td class="d-flex"><button type="button" class="btn btn-light" onclick="addNewRow()"><i class="fa-solid fa-circle-plus fa-1x"></i></button>
                                &nbsp;&nbsp;
                                <button type="button" class="btn btn-light" onclick="removeNewRow(this)"><i class="fa-solid fa-circle-minus fa-1x"></i></button></td>
                            </tr>--%>
                                </tbody>
                            </table>

                        </div>
                    <div class="text-center mb-3">
                        <button type="button" class="btn btn-primary" onclick="saveNewContract()">Save</button>
                    </div>
                        </div>
                        </div>
                        </div>
        </section>
</asp:Content>
