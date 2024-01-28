<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewTechnology.aspx.cs" Inherits="RUWAS.NewTechnology" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
        })
        function saveTechnology() {
            let txtTechnology = $("#txtTechnologtId").val();
            if (txtTechnology == "") {
                $("#txtTechnologtId").addClass("is-invalid");
                $("#txtTechnologtId").focus();
                return false;
            } else {
                $("#txtTechnologtId").removeClass("is-invalid");
                $("#txtTechnologtId").addClass("is-valid");
            }
            let txtPopulationServed = $("#txtPopulationServedId").val();
            if (txtPopulationServed == "") {
                $("#txtPopulationServedId").addClass("is-invalid");
                $("#txtPopulationServedId").focus();
                return false;
            } else {
                $("#txtPopulationServedId").removeClass("is-invalid");
                $("#txtPopulationServedId").addClass("is-valid");
            }
            var chkNoEastingAndNorthing = 0;
            let chkValue = document.getElementById("txtNoEastingAndNorthingId");
            if (chkValue.checked) {
                chkNoEastingAndNorthing = 1;
            }
            let data = {
                'op': 'SaveTechnology',
                'txtTechnology': txtTechnology,
                'txtPopulationServed': txtPopulationServed,
                'chkNoEastingAndNorthing': chkNoEastingAndNorthing
            }
            let s = function (sms) {
                alert(sms);
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='Technology.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6 active">Technology</li>
                    <li class="breadcrumb-item h6">New Technology</li>
                </ol>
            </nav>
            <div class="card shadow mb-5  bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">New Technology</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <input id="txtTechnologtId" type="text" class="form-control" placeholder="Technology"/>
                                <label for="txtTechnologtId">Technology</label>
                                <span class="invalid-feedback is-invalid">please enter technology</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <input id="txtPopulationServedId" type="number" class="form-control" placeholder="Population Served"/>
                                <label for="txtPopulationServedId">Population Served</label>
                                <span class="invalid-feedback is-invalid">please enter population served</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6 mt-3">
                                <input id="txtNoEastingAndNorthingId" style="cursor:pointer;" type="checkbox" class="form-check-input" placeholder="Population Served"/>&nbsp;
                                <label for="txtPopulationServedId">No Eastings and Northings</label>
                                <span class="invalid-feedback is-invalid">please check it</span>
                         </div>
                    </div>
                    <div class="text-center mt-3">
                                <buttin type="button" class="btn btn-primary" onclick="saveTechnology()">Save</buttin>
                        </div>
                    </div>
                </div>
            </div>
        
    </section>
</asp:Content>
