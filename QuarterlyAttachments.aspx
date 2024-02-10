<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="QuarterlyAttachments.aspx.cs" Inherits="RUWAS.QuarterlyAttachments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("dataEntryId").classList.add("DE");
            getTableData();
            loadTechnology();
        })
        function getTableData (){
            var data = { 'op': 'FetchQuarterlyAttachmentData' }
            var s = function (sms) {
                sms.forEach(function (item) {
                    var row = `<tr>`
                    row = row +
                        `<td class="1">` + item.FinancialYr + `</td>` +
                        `<td class="2">` + item.LC+`</td>`+
                        `<td class="3">` + item.NewRehabitation+`</td>`+
                        `<td class="4">` + item.Quarter+`</td>`+
                        `<td class="5" style="display:none;">` + item.TeachnologyId+`</td>`+
                        `<td class="6">` + item.Teachnology+`</td>`+
                        `<td class="7">` + item.SubCounty+`</td>`+
                        `<td class="8">` + item.Parish+`</td>`+
                        `<td class="9">` + item.Village+`</td>`+
                        `<td class="10">` + item.SourceNumber+`</td>`+
                        `<td class="11">` + item.NameOfWaterSource+`</td>`+
                        `<td class="12">` + item.Easting+`</td>`+
                        `<td class="13">` + item.Northing+`</td>`+
                        `<td class="14">` + item.InvestmentCostUgx+`</td>`+
                        `<td class="15">` + item.SourceOfFunding+`</td>`+
                        `<td>` + `<button class="btn btn-primary" type="button" onclick="EditQuarterlyAttachment(this)" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i></button>`+ `</td></tr>`
                    $("#myTable").append(row);
                })
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function EditQuarterlyAttachment(thisId) {
            
            let FinancialYr = $(thisId).closest('tr').find(`.1`).html();
            $("#slctFinancialYearId").val(FinancialYr);
            let LC = $(thisId).closest('tr').find('.2').html();
            $("#txtDistrictId").val(LC);
            let Category = $(thisId).closest('tr').find('.3').html();
            $("#txtCategoryId").val(Category);
            let Quarter = $(thisId).closest('tr').find('.4').html();
            $("#quarterId").val(Quarter);
            let Teachnology = $(thisId).closest('tr').find('.5').html();
            $("#slctTechnologyId").val(Teachnology);
            let SubCounty = $(thisId).closest('tr').find('.7').html();
            $("#txtSubCountyId").val(SubCounty);
            let Parish = $(thisId).closest('tr').find('.8').html();
            $("#SlctParishId").val(Parish);
            let Village = $(thisId).closest('tr').find('.9').html();
            $("#SlctVillageId").val(Village);
            let SourceNumber = $(thisId).closest('tr').find('.10').html();
            $("#sourceNumberId").val(SourceNumber);
            let NameOfWaterSource = $(thisId).closest('tr').find('.11').html();
            $("#nameOfWaterSourceId").val(NameOfWaterSource);
            let UTMEasting = $(thisId).closest('tr').find('.12').html();
            $("#txtUTMEasting").val(UTMEasting);
            let UTMNorthing = $(thisId).closest('tr').find('.13').html();
            $("#txtUTMNorthing").val(UTMNorthing);
            let InvestmentCost = $(thisId).closest('tr').find('.14').html();
            $("#investmentCostId").val(InvestmentCost);
            let SourceOfFunding = $(thisId).closest('tr').find('.15').html();
            $("#txtSourceOfFundingId").val(SourceOfFunding);
        }
        function loadTechnology() {
            var data = { 'op': 'FetchTeachnologyTable' };
            var s = function (sms) {
                console.log(sms);
                if (Array.isArray(sms)) {
                    let teachnology = $("#slctTechnologyId");
                    sms.forEach(function (msg) {
                        let option = document.createElement('option');
                        option.value = msg.TechnologyId;
                        option.text = msg.TechnologyName;
                        teachnology.append(option);
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
      label,th,td,li{
           /* font-size:14px;*/
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
            <nav class="row" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <div class="col">
            <ol class="breadcrumb d-flex justify-content-start mt-2">
                <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='DashBoard.aspx'"></i>&nbsp;&nbsp;Data Entry</li>
                <li class="breadcrumb-item h6">Quarterly Attachments</li>
            </ol></div>
                <div class="col d-flex justify-content-end m-2">
                    <button type="button" id="newAttachmentId" onclick="location.href='NewQuaterlyAttachment.aspx'" class="btn text-light" style="background-color:#0059b3"> New Attachment</button>
                </div>
        </nav>
        <div class="card shadow mb-5 bg-white rounded">

      
        <div class="text-center h5 card-header alert alert-info">Quarterly Attachment</div>
            <div clss="card-body">
                <div style="overflow:auto;height:400px;" class="mb-4">   
                <table id="myTable" class="table table-hover" style="text-align:center;">
                    <thead>
                        <tr class="table-secondary" style="position:sticky;top:0;">
                            <th>Financial Year</th>
                            <th>Local Government</th>
                            <th>Category</th>
                            <th>Quater</th>
                            <th style="display:none;">TechnologyId</th>
                            <th>Technology</th>
                            <th>Subcounty</th>
                            <th>Parish</th>
                            <th>Village/LC</th>
                            <th>Source Number</th>
                            <th>Name of Water Source</th>
                            <th>Eastings</th>
                            <th>Northings</th>
                            <th>Investment Cost UGX(000)</th>
                            <th>Source of Funding</th>
                            <th>Edit</th>
                        </tr>
                   </thead>
                    <tbody>

                    </tbody>
                     </table>
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
                     <label id="ContractDtlId"></label>
                     <div class="col-lg-4 col-md-6 col-sm-12">
                         <div class="form-floating">
                             <input disabled id="slctFinancialYearId" class="form-control" placeholder="Financial Year" title="Financial Year" />
                             <label class="slctFinancialYearId">Financial Year</label>
                             <span class="invalid-feedback is-invalid">please select Financial year</span>
                         </div>
                     </div>
                     <div class="col-lg-4 col-md-6 col-sm-12">
                         <div class="form-floating">
                             <input disabled id="txtDistrictId" class="form-control" placeholder="LC" title="LC" />
                             <label for="txtDistrictId">Local Government</label>
                             <span class="invalid-feedback is-invalid">Please enter local government</span>
                         </div>
                     </div>
                     <div class="col-lg-4 col-md-12 col-sm-12">
                         <div class="form-floating">
                             <input type="text" class="form-control" id="SlctVillageId" title="Village" placeholder="Village" onchange=" getVillage()" />
                             <label for="SlctVillageId">Village</label>
                             <span class="invalid-feedback is-invalid">please select from list</span>
                         </div>
                     </div>
                     <%-- <div class="col-lg-4 col-md-12 col-sm-12">
                         <div class="form-floating">
                             <select class="form-select" id="slctCategoryId" title="Quarter">
                                 <option value="">Choose from List</option>
                                 <option value="1">Q One (July-Sept)</option>
                                 <option value="2">Q Two (Oct-Dec)</option>
                                 <option value="3">Q Three (Jan-March)</option>
                                 <option value="4">Q Four (Apr-Jun)</option>
                             </select>
                             <label for="quarterId">Quarter <span>*</span></label>
                             <span class="invalid-feedback is-invalid">please select from list</span>
                         </div>
                     </div>--%>
                     <div class="row m-1 p-1">
                         <div class="col-lg-6 col-md-12 col-sm-12">
                             <div class="form-floating">
                                 <input id="txtCategoryId" type="text" class="form-control" placeholder="Description of Goods,Services or Works Procured" title="Description of Goods,Services or Works Procured" />
                                 <label for="txtCategoryId">Sub-County</label>
                                 <span class="invalid-feedback is-invalid">Sub County</span>
                             </div>
                         </div>
                         <div class="col-lg-6 col-md-12 col-sm-12">
                             <div class="form-floating">
                                 <select class="form-select" id="quarterId" title="Quarter">
                                     <option value="">Choose from List</option>
                                     <option value="1">Q One (July-Sept)</option>
                                     <option value="2">Q Two (Oct-Dec)</option>
                                     <option value="3">Q Three (Jan-March)</option>
                                     <option value="4">Q Four (Apr-Jun)</option>
                                 </select>
                                 <label for="quarterId">Quarter <span>*</span></label>
                                 <span class="invalid-feedback is-invalid">please select from list</span>
                             </div>
                         </div>
                         <div class="col-lg-6 col-md-12 col-sm-12">
                             <div class="form-floating">
                                 <select class="form-select" id="slctTechnologyId" title="Technology">
                                     <option value="">Choose from List</option>
                                 </select>
                                 <label for="slctTechnologyId">Technology <span>*</span></label>
                                 <span class="invalid-feedback is-invalid">please select from list</span>
                             </div>
                         </div>
                     </div>
                    <%-- <div class="row m-1 p-1">
                         <div class="col-lg-3 col-md-12 col-sm-12">
                             <div class="form-floating">
                                 <input id="txtSubCountyId" type="text" class="form-control" placeholder="Description of Goods,Services or Works Procured" title="Description of Goods,Services or Works Procured" />
                                 <label for="txtSubCountyId">Sub-County</label>
                                 <span class="invalid-feedback is-invalid">Sub County</span>
                             </div>
                         </div>
                         <div class="col-lg-3 col-md-12 col-sm-12">
                             <div class="form-floating">
                                 <input type="text" class="form-control" id="SlctParishId" title="Parish" placeholder="Parish" onchange=" getVillage()" />
                                 <label for="SlctParishId">Parish</label>
                                 <span class="invalid-feedback is-invalid">please select from list</span>
                             </div>
                         </div>

                     </div>--%>
                     <div class="row m-1 p-1">
                         <div class="col-lg-6 col-md-6 col-sm-12">
                             <div class="form-floating">
                                 <input type="text" min="1" class="form-control" id="sourceNumberId" title="Enter the Source Number" placeholder="Enter Source Number" />
                                 <label for="sourceNumberId">Source Number</label>
                                 <span class="invalid-feedback is-invalid">please enter the source number</span>
                             </div>
                         </div>
                         <div class="col-lg-6 col-md-6 col-sm-12">
                             <div class="form-floating">
                                 <input type=" text" id="nameOfWaterSourceId" class="form-control" title="Enter the Name of Water Source" placeholder="Enter Name of Water Source" />
                                 <label for="nameOfWaterSourceId">Name of Water Source</label>
                                 <span class="invalid-feedback is-invalid">please enter the name of water source</span>
                             </div>
                         </div>
                     </div>
                     <div class="row m-1 p-1">
                         <div class="col-lg-4 col-md-6 col-sm-12">
                             <div class="form-floating">
                                 <input type="number" class="form-control" title="UTM Easting" placeholder="UTM Easting" id="txtUTMEasting" />
                                 <label>UTM Easting</label>
                                 <span class="invalid-feedback is-invalid">please enter UTM easting</span>
                             </div>
                         </div>
                         <div class="col-lg-4 col-md-6 col-sm-12">
                             <div class="form-floating">
                                 <input type="number" class="form-control" title="UTM Northing" placeholder="UTM Northing" id="txtUTMNorthing" />
                                 <label>UTM Northing</label>
                                 <span class="invalid-feedback is-invalid">please enter UTM Northing</span>
                             </div>
                         </div>
                         <div class="col-lg-4 col-md-6 col-sm-12">
                             <div class="form-floating">
                                 <input type="number" id="investmentCostId" class="form-control" placeholder="Enter the Investment Cost in USX(000)" title="Enter the Investment Cost in USX(000)" />
                                 <label for="investmentCostId">Investment Cost UGX(000)</label>
                                 <span class="invalid-feedback is-invalid">please enter the Investment Cost in USX(000)</span>
                             </div>
                         </div>
                     </div>
                     <div class="row m-1 p-1">
                         <div class="col-lg-12 col-md-6 col-sm-12">
                             <div class="form-floating">
                                 <input type="text" id="txtSourceOfFundingId" class="form-control" placeholder="Source Of Funding" title="Source Of Funding" />
                                 <label for="txtSourceOfFundingId">Source Of Funding</label>
                                 <span class="invalid-feedback is-invalid">please enter the Source Of Funding</span>
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
          </div>
    </section>
</asp:Content>
