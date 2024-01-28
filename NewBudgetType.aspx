<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewBudgetType.aspx.cs" Inherits="RUWAS.NewBudgetType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            fetchUnder();
        })
        function saveBudgetType() {
            let txtBudgetType = $("#txtBudgetTypeId").val();
            if (txtBudgetType == "") {
                $("#txtBudgetTypeId").addClass("is-invalid");
                $("#txtBudgetTypeId").focus();
                return false;
            } else {
                $("#txtBudgetTypeId").removeClass("is-invalid");
                $("#txtBudgetTypeId").addClass("is-valid");
            }
            let slctUnder = $("#slctUnderId").val();
            if (slctUnder == "") {
                $("#slctUnderId").addClass("is-invalid");
                $("#slctUnderId").focus();
                return false;
            } else {
                $("#slctUnderId").removeClass("is-invalid");
                $("#slctUnderId").addClass("is-valid");
            }
            var data = {
                'op': 'SaveNewBudgetType',
                'txtBudgetType': txtBudgetType,
                'slctUnder': slctUnder
            }
            
            var s = function (msg) {
                alert(msg);
            }
            var e = function (sms) {
                alert(sms);
            }
            CallHandler(data, s, e);
        }
        function fetchUnder() {
            let data = { "op" : "FetchUnder" };
            let s = function (sms) {
                if (Array.isArray(sms)) {
                    let under = $("#slctUnderId");
                    sms.forEach(function (msg) {
                        let option = document.createElement("option");
                        option.value = msg.budgetId;
                        option.text = msg.under;
                        under.append(option);   
                    })
                } else {
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
                error:e
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
        option{
            font-size:14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container-fluid">
         <div class="m-2 pt-2">
            <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='BudgetType.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6 active">Budget Type</li>
                    <li class="breadcrumb-item h6">New Budget Type</li>
                </ol>
            </nav>
             <div class="card shadow mb-5 bg-white rounded">
                 <div class="card-header text-center h5 alert alert-info">New Budget Type</div>
                 <div class="card-body">
                     <div class="row p-1 m-1">
                         <div class="col-lg-3 col-12">
                             <div class="form-floating">
                                 <textarea id="txtBudgetTypeId" class="form-control" placeholder="Budget Type"></textarea>
                                 <label for="txtBudgetTypeId">Budget Type</label>
                                 <span class="invalid-feedback is-invalid">Please enter budget type</span>
                             </div>
                         </div>
                         <div class="col-lg-3 col-12">
                             <div class="form-floating">
                                 <select class="form-select" id="slctUnderId" title="Under">
                                     <option value="">Choose from List</option>
                                 </select>
                                 <label for="slctUnderId">Under</label>
                                 <span class="invalid-feedback is-invalid">Please select from list</span>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="text-center mb-3">
                         <button type="button" class="btn btn-primary" onclick="saveBudgetType()">Save</button>
                   </div>
             </div>
        </div>
    </section>
</asp:Content>
