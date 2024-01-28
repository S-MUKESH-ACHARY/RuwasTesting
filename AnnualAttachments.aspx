<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="AnnualAttachments.aspx.cs" Inherits="RUWAS.AnnualAttachments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("dataEntryId").classList.add("DE");       
            getFinancialYr();
            getDistrict();
            addNewRow();
        })
        function save() {
            let slctFinancialYear = $("#slctFinancialYearId").val();
            if (slctFinancialYear == "") {
                $("#slctFinancialYearId").addClass("is-invalid");
                $("#slctFinancialYearId").focus();
                return false;
            } else {
                $("#slctFinancialYearId").removeClass("is-invalid");
                $("#slctFinancialYearId").addClass("is-valid");
            }
            let localGovernment = $("#localGovernmentId").val();
            if (localGovernment == "") {
                $("#localGovernmentId").addClass("is-invalid");
                $("#localGovernmentId").focus();
                return false;
            } else {
                $("#localGovernmentId").removeClass("is-invalid");
                $("#localGovernmentId").addClass("is-valid");
            }
            var SitanDetailsList = [];
            $("#myTable>tbody>tr").each(function () {
                let SlctSubCounty = $(this).find("#slctSubcountyId").val();
                let txtProtectSpringF = $(this).find("#txtProtectSpringFId").val();
                let txtProtectSpringNF = $(this).find("#txtProtectSpringNFId").val();
                let txtShallowWellF = $(this).find("#txtShallowWellFId").val();
                let txtShallowWellNF = $(this).find("#txtShallowWellNFId").val();
                let txtDeepBoreHoleF = $(this).find("#txtDeepBoreHoleFId").val();
                let txtDeepBoreHoleNF = $(this).find("#txtDeepBoreHoleNFId").val();
                let txtGravityFlowSCH = $(this).find("#txtGravityFlowSCHId").val();
                let txtGravityFlowF = $(this).find("#txtGravityFlowFId").val();
                let txtGravityFlowNF = $(this).find("#txtGravityFlowNFId").val();
                let txtPumpedPipeSCH = $(this).find("#txtPumpedPipeSCHId").val();
                let txtPumpedPipeF = $(this).find("#txtPumpedPipeFId").val();
                let txtPumpedPipeNF = $(this).find("#txtPumpedPipeNFId").val();
                let txtSmallRainwaterTanksF = $(this).find("#txtSmallRainwaterTanksFId").val();
                let txtSmallRainwaterTanksNF = $(this).find("#txtSmallRainwaterTanksNFId").val();
                let txtLargeRainwaterTanksF = $(this).find("#txtLargeRainwaterTanksFId").val();
                let txtLargeRainwaterTanksNF = $(this).find("#txtLargeRainwaterTanksNFId").val();
                let txtValleyF = $(this).find("#txtValleyFId").val();
                let txtValleyNF = $(this).find("#txtValleyNFId").val();
                let txtDamsF = $(this).find("#txtDamsFId").val();
                let txtDamsNF = $(this).find("#txtDamsNFId").val();
                let txtCommunityTWPV = $(this).find("#txtCommunityTWPVId").val();
                let txtCommunityWSC = $(this).find("#txtCommunityWSCId").val();
                let txtCommunityWSCWP = $(this).find("#txtCommunityWSCWPId").val();
                let txtWaterQualityTST = $(this).find("#txtWaterQualityTSTId").val();
                let txtWaterQualitySCWG = $(this).find("#txtWaterQualitySCWGId").val();
                SitanDetailsList.push({
                    SlctSubCounty: SlctSubCounty, txtProtectSpringF: txtProtectSpringF,
                    txtProtectSpringNF: txtProtectSpringNF, txtShallowWellF: txtShallowWellF,
                    txtShallowWellNF: txtShallowWellNF, txtDeepBoreHoleF: txtDeepBoreHoleF,
                    txtDeepBoreHoleNF: txtDeepBoreHoleNF, txtGravityFlowSCH: txtGravityFlowSCH,
                    txtGravityFlowF: txtGravityFlowF, txtGravityFlowNF: txtGravityFlowNF,
                    txtPumpedPipeSCH: txtPumpedPipeSCH, txtPumpedPipeF: txtPumpedPipeF,
                    txtPumpedPipeNF: txtPumpedPipeNF, txtSmallRainwaterTanksF: txtSmallRainwaterTanksF,
                    txtSmallRainwaterTanksNF: txtSmallRainwaterTanksNF, txtLargeRainwaterTanksF: txtLargeRainwaterTanksF,
                    txtLargeRainwaterTanksNF: txtLargeRainwaterTanksNF, txtValleyF: txtValleyF, txtValleyNF: txtValleyNF,
                    txtDamsF: txtDamsF, txtDamsNF: txtDamsNF, txtCommunityMgtTWPV: txtCommunityTWPV,
                    txtCommunityMgtWSC: txtCommunityWSC, txtCommunityMgtWSCWP: txtCommunityWSCWP,
                    txtWaterQualityTST: txtWaterQualityTST, txtWaterQualitySCWG: txtWaterQualitySCWG
                });
            })
            var data = {
                "op": "SaveAnnualAttachments",
                "slctFinancialYear": slctFinancialYear,
                "localGovernment": localGovernment,
                "SitanDetailsList": SitanDetailsList
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
        function addNewRow() {
            getSubCounty();
            let row = `<tr>`;
            row += `<td><select id="slctSubcountyId"  class="form-select slctClass" style="width:150px;" ></select></td>`;
            row += `<td><input id="txtProtectSpringFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtProtectSpringNFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtShallowWellFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtShallowWellNFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtDeepBoreHoleFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtDeepBoreHoleNFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtGravityFlowSCHId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtGravityFlowFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtGravityFlowNFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtPumpedPipeSCHId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtPumpedPipeFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtPumpedPipeNFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtSmallRainwaterTanksFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtSmallRainwaterTanksNFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtLargeRainwaterTanksFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtLargeRainwaterTanksNFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtValleyFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtValleyNFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtDamsFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtDamsNFId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtCommunityTWPVId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtCommunityWSCId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtCommunityWSCWPId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtWaterQualityTSTId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td><input id="txtWaterQualitySCWGId" type="number" class="form-control" style="width:250px;" /></td>`;
            row += `<td class="d-flex"><button type="button" class="btn btn-light" onclick="addNewRow()"><i class="fa-solid fa-circle-plus fa-1x"></i></button>&nbsp;&nbsp;<button type="button" class="btn btn-light" onclick="removeNewRow(this)"><i class="fa-solid fa-circle-minus fa-1x"></i></button></td >`;
            row += '</tr>';
            $("#myTable").append(row);
        }
        function removeNewRow(child) {
            let rowLength = $("#myTable tr").length;
            if (rowLength == 3) {
                alert("First row can't be deleted");
                return;
            } else {
                child.parentNode.parentNode.remove();
            }
        }
        
        function getFinancialYr() {
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
        function getDistrict() {
            var data = { "op": "FetchDistrict" }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let District = document.getElementById("localGovernmentId");
                    sms.forEach((msg) => {
                        let option = document.createElement('option');
                        option.value = msg.DistrictId;
                        option.text = msg.DistrictName;
                        District.appendChild(option);
                    })
                }
                else {
                    alert(sms);
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e)
        }
        function getSubCounty() {
            let districtId = document.getElementById("localGovernmentId").value;
            var data = { 'op': 'FetchSubCountyOfDistrict', 'districtId': districtId }
            var s = function (sms) {
                if (Array.isArray(sms)) {

                    /*let SubCounty = document.getElementById("slctSubcountyId");*/
                    let subCountys = document.getElementsByClassName('slctClass');
                    //console.log(subCountys);
                    //    sms.forEach((msg) => {
                    //        for (let i = 0; i < subCountys.length; i++) {
                    //            var dropdown = subCountys[i];
                    //            let option = document.createElement('option');
                    //            option.value = msg.SubCountyId;
                    //            option.text = msg.SubCountyName;
                    //            dropdown.appendChild(option);
                    //        }
                    //    })
                    let option = "";
                    sms.forEach((msg) => {
                        option = `<option value="${msg.SubCountyId}">${msg.SubCountyName}</option>`;
                        $(".slctClass").append(option);
                    })
                } else {
                    let SubCounty = document.getElementById("slctSubcountyId");
                    SubCounty.innerHTML = "";
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
                success: s,
                error: e,
                data: d
            })
        }
    </script>
     <style>
        label,th,td{
            font-weight:500
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
            <div class="row m-1 pt-2">
                <div class="col">
                    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb d-flex justify-content-start">
                <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='DashBoard.aspx'"></i>&nbsp;&nbsp;Data Entry</li>
                <li class="breadcrumb-item h6">Annual Attachments</li>
            </ol>
        </nav>
                </div>
               <%-- <div class="col d-flex justify-content-end m-2">
                    <button type="button" disabled id="newAttachmentId"  onclick="location.href='NewAnnualAttachment.aspx'" class="btn text-light" style="background-color:#0059b3"> New Attachment</button>
                </div>--%>
        </div>
           <div class="card shadow mb-5 bg-white rounded">
               <div class="card-header h5 text-center alert alert-info ">
                   Annual Attachment
               </div>
               <div clss="card-body">
                   <div class="row p-4">
                       <div class="col-lg-3 col-12">
                           <div class="form-floating">
                               <select class="form-select" id="slctFinancialYearId" title="Financial Year">
                                   <option value="">Choose from List</option>
                               </select>
                               <label class="slctFinancialYearId">Financial Year <span>*</span></label>
                               <span class="invalid-feedback is-invalid">please select Financial year</span>
                           </div>
                       </div>
                       <div class="col-lg-3 col-12">
                           <div class="form-floating">
                               <select class="form-select" id="localGovernmentId" onchange="getSubCounty()" aria-label="A">
                                   <option value="">Choose from List</option>
                               </select>
                               <label for="localGovernmentId">Local Government <span>*</span></label>
                               <span class="invalid-feedback is-invalid">please select from list</span>
                           </div>
                       </div>
                   </div>
                   <div style="overflow-x: auto; white-space: nowrap;">
                       <table id="myTable" class="table table-hover table-bordered" style="text-align: center; width: 100%">
                           <thead>
                               <tr class="table-secondary">
                                   <th>Location</th>
                                   <th colspan="2">No of Protected Spring</th>
                                   <th colspan="2">No of Shallow Wells(With Hand Pump)[Detth < 30 Mtr}</th>
                                   <th colspan="2">No of Deep Borehole(With Hand Pump)[Detth > 30 Mtr}</th>
                                   <th colspan="3" style="width: 20%">Gravity Flow Schemes</th>
                                   <th colspan="3">Pumped Piped Water Supply System</th>
                                   <th colspan="2">No of Rainwater Tanks [Volumn < 10 Cubic Mtr]</th>
                                   <th colspan="2">No of Rainwater Tanks [Volumn > 10 Cubic Mtr]</th>
                                   <th colspan="2">Valley Tanks</th>
                                   <th colspan="2">Dams</th>
                                   <th colspan="3">Community Management</th>
                                   <th colspan="2">Water Quality</th>
                                   <th>Remove</th>
                               </tr>
                               <tr>
                                   <th>Sub-county</th>
                                   <th title="Functioning">F</th>
                                   <th title="Non Functioning">NF</th>
                                   <th title="Functioning">F</th>
                                   <th title="Non Functioning">NF</th>
                                   <th title="Functioning">F</th>
                                   <th title="Non Functioning">NF</th>
                                   <th title="Number Of Schemes">SCH</th>
                                   <th title="Functioning">F</th>
                                   <th title="Non Functioning">NF</th>
                                   <th title="Number Of Schemes">SCH</th>
                                   <th title="Functioning">F</th>
                                   <th title="Non Functioning">NF</th>
                                   <th title="Functioning">F</th>
                                   <th title="Non Functioning">NF</th>
                                   <th title="Functioning">F</th>
                                   <th title="Non Functioning">NF</th>
                                   <th title="Functioning">F</th>
                                   <th title="Non Functioning">NF</th>
                                   <th title="Functioning">F</th>
                                   <th title="Non Functioning">NF</th>
                                   <th title="Total Number Of Water Points Visited">TWPV</th>
                                   <th>WSC</th>
                                   <th>WSCWP</th>
                                   <th>TST</th>
                                   <th>SCWG</th>
                               </tr>
                           </thead>
                           <tbody id="tbl_div"></tbody>
                       </table>
                   </div>
                   <div class="d-flex justify-content-center mt-2 mb-3">
                       <button type="button" class="btn btn-warning" onclick="save()">Save</button>&nbsp;
                                            <button type="button" class="btn btn-danger" onclick="location.reload();">Clear</button>
                   </div>
               </div>
              </div>
    </section>
</asp:Content>
