<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewRWSRC.aspx.cs" Inherits="RUWAS.NewRWSRC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
        })
        function saveRWSRC() {
            let slctRWSRC = $("#slctRWSRCId").val();
            if (slctRWSRC == "") {
                $("#slctRWSRCId").addClass("is-invalid");
                $("#slctRWSRCId").focus();
                return false;
            } else {
                $("#slctRWSRCId").removeClass("is-invalid");
                $("#slctRWSRCId").addClass("is-valid");
            }
            var data = {
                'op': 'SaveRWSRC',
                'slctRWSRC': slctRWSRC
            }
            var s = function (msg) {
                alert(msg)
            }
            var e = function (sms) {
                alert(sms);
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='RWSRC.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6 active">TSU List</li>
                    <li class="breadcrumb-item h6">New RWSRC</li>
                </ol>
            </nav>
            <div class="card shadow mb-5 bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">New RWSRC</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="slctRWSRCId" placeholder="RWSRC" title="Enter RWSRC" />
                                <label for="slctRWSRCId">RWSRC</label>
                                <span class="invalid-feedback is-invalid">please enter RWSRC</span>
                            </div>
                        </div>
                        <div class="text-center mt-3">
                            <button type="button" class="btn btn-primary" onclick="saveRWSRC()">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
