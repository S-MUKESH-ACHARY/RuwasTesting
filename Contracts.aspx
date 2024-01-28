<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="Contracts.aspx.cs" Inherits="RUWAS.Contracts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("dataEntryId").classList.add("DE");
            getTableData();
            getFinancialYr();
            fetchLC();
        })
        
        function getTableData() {
            var data = {
                'op':'ContractTableData'
            }
            var s = function (sms) {
                sms.forEach(function (item) {
                    var row = '<tr>'
                    row = row + `<td>` + item.LocalGovernment + `</td>` +
                        `<td>` + item.FinancialYear+`</td>`+
                        `<td>` + item.ContractNumber+`</td>`+
                        `<td>` + item.NameofContractor+`</td>`+
                        `<td>` + item.ContractorCountry+`</td>`+
                        `<td>` + item.DescriptionOfGoods+`</td>`+
                        `<td>` + item.ContractSum+`</td>`+
                        `<td>` + item.AnnualPaymentUnderContract+`</td>`+
                        `<td>` + item.Status+`</td>`+
                        `<td>` + `<button class="btn btn-primary" type="button" onclick="EditSubCounty(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button> ` + `</td></tr>`
                    $("#myTable").append(row);
                })
                $('#myTable').DataTable();
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function getFinancialYr() {
            var data = {
                'op': 'FetchFinancialYear',
            }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let AddFinancialYr = $("#slctFinancialYearId");
                    sms.forEach(function (msg) {
                        msg.IsActive;
                        let option = document.createElement('option');
                        option.value = msg.FinancialYr;
                        option.text = msg.FinancialYrName;
                        AddFinancialYr.append(option);
                    });
                    /* $("#slctFinancialYearId").val("1");*/
                    sms.forEach(function (msg) {
                        if (msg.IsActive == 1) {
                            $("#slctFinancialYearId").val(msg.FinancialYr);
                        }
                    });
                }
                else {
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
                    let LC = document.getElementById("txtDistrictId");
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
        //function Edit() {
        //    let row = '<tr>';
        //    row += '<td><input type="text" class="form-control" value="Abim" /></td>';
        //    row += '<td><input type="text" class="form-control" value="2017/2018" /></td>';
        //    row += '<td><input type="number" class="form-control" value="10" /></td>';
        //    row += '<td><input type="text" class="form-control" value="Okerenyang" /></td>';
        //    row += '<td><input type="text" class="form-control" value="Uganda" /></td>';
        //    row += '<td><input type="text" class="form-control" value="Services" /></td>';
        //    row += '<td><input type="text" class="form-control" value="15,630,600" /></td>';
        //    row += '<td><input type="text" class="form-control" value="32,375,600" /></td>';
        //    row += '<td><select class="form-select" ><option value="Signed">Signed</option><option value="Awarded">Awarded</option></select></td>';
        //    row += '<td class="d-flex"><button type="button" class="btn btn-primary" onclick="saveRow()"> Save</button></td >';
        //    row += '</tr>';
        //    document.getElementById("editContract").innerHTML = row;
        //}
        //function saveRow() {
        //    alert("Saved");
        //    location.reload();
        //}
    </script>
   <style>
        label,th,td,li{
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='DashBoard.aspx'"></i>&nbsp;&nbsp;Data Entry</li>
                    <li class="breadcrumb-item h6">Contracts</li>
                </ol>
            </nav>
        </div>
        <div class="d-flix justify-content-between">
            <div>
                <div class="card shadow mb-5 bg-white rounded">
                    <div class="card-header text-center h5 alert alert-info">View Contracts</div>
                    <div class="card-body">

                        <%-- <div class="d-flex justify-content-center" >
                            <input type="text" id="searchContractId" class="form-control w-50"  placeholder="Search" style="border-radius:20px;" /><button type="button" class="btn"><i class="fa fa-search"></i></button>
                            </div> 
                        <div class="row mt-3">
                            <div class="col d-flex justify-content-end"><button type="button" class="btn btn-warning"> Search</button></div>
                            <div class="col"><button type="button" class="btn btn-danger">Reset</button></div>
                        </div>--%>
                        <div class="mb-2">
                            <button class="btn text-light" type="button" style="background-color: #0059b3;" onclick="location.href='NewContract.aspx'">New Contract</button>
                        </div>
                        <div>
                            <table id="myTable" class="table table-hover p-1 mt-5" style="width: 100%; overflow-x: auto;">
                                <thead>
                                    <tr class="table-secondary">
                                        <th>Local Government</th>
                                        <th>Financial Year</th>
                                        <th>Contract Number</th>
                                        <th>Name of Contractor or Consultant/Company Name</th>
                                        <th>Country of Origin of Contractor or Consultant</th>
                                        <th style="width: 10%;">Description of Goods,Services or Works Procured</th>
                                        <th>Contract Sum (UGX)(000)</th>
                                        <th>Annual Payment Under Contract</th>
                                        <th>Status</th>
                                        <th>Edit</th>
                                        <%-- <th>Edit</th>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <%--Modal for Edit--%>
         <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
             <div class="modal-dialog modal-dialog-centered modal-lg">
                 <div class="modal-content">
                     <div class="modal-header alert alert-info justify-content-center">
                         <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Contract</h1>
                     </div>
                     <div class="modal-body">
                         <label style="display: none;" id="txtContractId"></label>
                         <div class="row m-1 p-1">
                             <div class="col-lg-4 col-md-6 col-sm-12">
                                 <div class="form-floating">
                                     <select id="txtLCId" class="form-select" placeholder="LC" title="LC">
                                         <option value="">Choose from List</option>
                                     </select>
                                     <label for="txtDistrictId">Local Government</label>
                                     <span class="invalid-feedback is-invalid">Please enter local government</span>
                                 </div>
                             </div>
                             <div class="col-lg-4 col-md-6 col-sm-12">
                                 <div class="form-floating">
                                     <select class="form-select" id="slctFinancialYearId" title="Financial Year">
                                         <option value="">Choose from List</option>
                                     </select>
                                     <label class="slctFinancialYearId">Financial Year</label>
                                     <span class="invalid-feedback is-invalid">please select Financial year</span>
                                 </div>
                             </div>
                             <div class="col-lg-4 col-md-6 col-sm-12">
                                 <div class="form-floating">
                                     <input id="txtContractNumberId" type="number" class="form-control" placeholder="Contract Number" title="Contract Number" />
                                     <label for="txtContractNumberId">Contract Number</label>
                                     <span class="invalid-feedback is-invalid">Contract Number</span>
                                 </div>
                             </div>
                         </div>
                         <div class="row m-1 p-1">
                             <div class="col-lg-6 col-md-6 col-sm-12">
                                 <div class="form-floating">
                                     <input id="txtContractName" type="text" class="form-control" placeholder="Name of Contractor or Consultant/Company Name" title="Name of Contractor or Consultant/Company Name" />
                                     <label for="txtContractName">Name of Contractor or Consultant/Company Name</label>
                                     <span class="invalid-feedback is-invalid">please enter contract</span>
                                 </div>
                             </div>
                             <div class="col-lg-6 col-md-6 col-sm-12">
                                 <div class="form-floating">
                                     <input id="txtContractorCountry" type="text" class="form-control" placeholder="Country of Origin of Contractor or Consultant" title="Country of Origin of Contractor or Consultant" />
                                     <label for="txtContractorCountry">Country of Origin of Contractor or Consultant</label>
                                     <span class="invalid-feedback is-invalid">please enter contract</span>
                                 </div>
                             </div>
                             </div>
                         <div class="row m-1 p-1">
                             <div class="col-lg-6 col-md-6 col-sm-12">
                                 <div class="form-floating">
                                     <input id="txtDescriptionGoodsId" type="number" class="form-control" placeholder="Description of Goods,Services or Works Procured" title="Description of Goods,Services or Works Procured" />
                                     <label for="txtDescriptionGoodsId">Description of Goods,Services or Works Procured</label>
                                     <span class="invalid-feedback is-invalid">Description of Goods,Services or Works Procured</span>
                                 </div>
                             </div>
                             <div class="col-lg-6 col-md-6 col-sm-12">
                                 <div class="form-floating">
                                     <input id="txtContractSum" type="text" class="form-control" placeholder="Contract Sum (UGX)(000)" title="Contract Sum (UGX)(000)" />
                                     <label for="txtContractSum">Contract Sum (UGX)(000)</label>
                                     <span class="invalid-feedback is-invalid">please enter contract</span>
                                 </div>
                             </div>
                         </div>
                         <div class="row m-1 p-1">
                             <div class="col-lg-6 col-md-6 col-sm-12">
                                 <div class="form-floating">
                                     <input id="txtAnnualPaymenttUnderContract" type="text" class="form-control" placeholder="Annual Payment Under Contract" title="Annual Payment Under Contract" />
                                     <label for="txtAnnualPaymenttUnderContract">Annual Payment Under Contract</label>
                                     <span class="invalid-feedback is-invalid">please enter contract</span>
                                 </div>
                             </div>
                             <div class="col-lg-6 col-md-6 col-sm-12">
                                 <div class="form-floating">
                                     <input id="txtStatusId" type="number" class="form-control" placeholder="Status" title="Status" />
                                     <label for="txtStatusId">Status</label>
                                     <span class="invalid-feedback is-invalid">Status</span>
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
