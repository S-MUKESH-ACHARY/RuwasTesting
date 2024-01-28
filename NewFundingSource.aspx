<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewFundingSource.aspx.cs" Inherits="RUWAS.NewFundingSource" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
        })
        function saveFundingSource() {
            let slctFundingSourceId = $("#slctFundingSourceId").val();
            if (slctFundingSourceId == "") {
                $("#slctFundingSourceId").addClass("is-invalid");
                $("#slctFundingSourceId").focus();
                return false;
            } else {
                $("#slctFundingSourceId").removeClass("is-invalid");
                $("#slctFundingSourceId").addClass("is-valid");s
            }
            var data = {
                'op': 'SaveFundingSource',
                'slctFundingSource': slctFundingSourceId
            }
            var s = function (sms) {
                alert(sms);
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
       label,th,td{
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='FundingSource.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6">View Founding Source</li>
                    <li class="breadcrumb-item h6">New Source</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">New Source</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="slctFundingSourceId" placeholder="Funding Source" title="Funding Source" />
                                <label for="slctFundingSourceId">Funding Source</label>
                                <span class="invalid-feedback is-invalid">please enter funding source</span>
                            </div>
                        </div>
                        <div class="text-center mt-3">
                            <button type="button" class="btn btn-primary" onclick="saveFundingSource()">Save</button>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</asp:Content>
