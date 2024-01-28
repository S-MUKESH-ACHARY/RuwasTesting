<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="AddFacility .aspx.cs" Inherits="Wfp.AddFacility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        label{
            font-weight:600;
            font-size:16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="container-fluid p-3">
        <div class="row">
            <div class="col-md-12">
                <div class=" justify-content-between ">

                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active h4">Home</li>
                            <li class="breadcrumb-item active h4">Valley Tank Facility </li>
                            <li class="breadcrumb-item h4" aria-content="page">Technical information</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="accordion accordion-flush" id="accordionFlushExample">
  <div class="accordion-item p-3">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" style="background-color: #77deee" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
      Facility  Technical information
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
          <strong>1.Valley Tank Facility Information</strong>
          <div class="row">
              <div class="col-4 p-2">
                  <div class="form-floating mb-3">
                      <input type="text" class="form-control" id="volumeOfTheFacilityId" title="Enter Volume of the Facility" placeholder="Enter Volume of the Facility" />
                      <label for="volumeOfTheFacilityId">Volume of the Facility</label>
                  </div>

              </div>
              <div class="col-4 p-2">
                  <div class="form-floating">
                      <select type="text" class="form-select" id="abstractionMethodId" placeholder="Abstraction Method">
                          <option selected="">--Choose from the list--</option>
                          <option value="1">--Choose from the list--</option>
                          <option value="2">--Choose from the list--</option>
                          <option value="3">--Choose from the list--</option>
                      </select>
                      <label for="abstractionMethodId">Abstraction Method</label>
                  </div>
              </div>
              <div class="col-4 p-2">
                  <div class="form-floating">
                      <select type="text" class="form-select" onchange="Cattle()" id="doUhaveCattleId" placeholder="Do you Have Domestic Animal ?">
                          <option value="No">No</option>
                          <option value="Yes">Yes</option>
                      </select>
                      <label for="doUhaveCattleId">Do you Have Domestic Animal ?</label>
                  </div>
              </div>
              <div class="col-4 p-2">
                  <div class="form-floating">
                      <select type="text" class="form-select" id="waterUseId" placeholder="Water Use">
                          <option selected="">--Choose from the list--</option>
                          <option value="1">--Choose from the list--</option>
                          <option value="2">--Choose from the list--</option>
                          <option value="3">--Choose from the list--</option>
                      </select>
                      <label for="waterUseId">Water Use</label>
                  </div>
              </div>
               
              <div class="col-4 p-2">
                  <div class="form-floating mb-3">
                      <input type="text" class="form-control" id="coverageAreaId" title="Enter Volume of the Facility" placeholder="Enter Volume of the Facility" />
                      <label for="volumeOfTheFacilityId">Coverage Area</label>
                  </div>
              </div>
              <div class="col-4 p-2">
                  <div class="form-floating mb-3">
                      <input type="text" class="form-control" id="numberOfHouseHoldId" title="Number Of HouseHolds" placeholder="Number Of HouseHolds" />
                      <label for="numberOfHouseHoldId">Number Of HouseHolds</label>
                  </div>
              </div> 
              <div class="col-4 p-2 cattle" style="display:none;">
                  <div class="form-floating mb-3">
                      <input type="text" class="form-control" id="numberOfCattleId" title="Number Of Cattle" placeholder="Number Of Cattle" />
                      <label for="numberOfCattleId">Number Of Cattle</label>
                  </div>
              </div>
              <div class="col-4 p-2 cattle" style="display:none;">
                  <div class="form-floating mb-3">
                      <input type="text" class="form-control" id="numberOfGoatsOrSheepId" title="Number Of Cattle" placeholder="Number Of Goats or Sheep" />
                      <label for="numberOfGoatsOrSheepId">Number Of Goats or Sheep</label>
                  </div>
              </div> 
              <div class="col-4 p-2 cattle" style="display:none;">
                  <div class="form-floating mb-3">
                      <input type="text" class="form-control" id="numberOfPigsId" title="Number Of Pigs" placeholder="Number Of Pigs" />
                      <label for="numberOfPigsId">Number Of Pigs</label>
                  </div>
              </div>
              <div class="col-4 p-2">
                  <div class="form-floating mb-3">
                      <input type="text" class="form-control" id="amountOfWaterUsedId" title="Amount of Water Used" placeholder="Amount of Water Used" />
                      <label for="amountOfWaterUsedId">Amount of Water Used</label>
                  </div>
              </div> 
              <div class="col-4 p-2">
                  <div class="form-floating mb-3">
                      <input type="text" class="form-control" id="amountOfWasteWaterUsedId" title="Amount of Waste Water Used" placeholder="Amount of Waste Water Used" />
                      <label for="amountOfWasteWaterUsedId">Amount of Waste Water Used</label>
                  </div>
              </div>
               <div class="col-4 p-2">
                  <div class="form-floating mb-3">
                      <input type="text" class="form-control" id="totalAmountOfWaterRequiredId" title="Total Amount of Water Required" placeholder="Total Amount of Water Required" />
                      <label for="totalAmountOfWaterRequiredId">Total Amount of Water Required</label>
                  </div>
              </div> 
              <div>

              </div>
          </div>
           <div class="d-flex justify-content-end">
                                              <button type="button" class="btn btn-danger">Clear</button>
                                              <button type="button" class="btn btn-secondary">Back</button>
                                              <button type="button" class="btn btn-info">Save & Next</button>
                                            </div>
      </div>
    </div>
  </div>
</div>
        </div>
    </section>
</asp:Content>
