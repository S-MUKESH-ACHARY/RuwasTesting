<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewSubTechnology.aspx.cs" Inherits="RUWAS.NewSubTechnology" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            document.getElementById("administrationId").classList.add("DE");
            loadTechnology()
        })
        function saveSTechnology() {
            let txtSubTechnologt = $("#txtSubTechnologtId").val();
            if (txtSubTechnologt == "") {
                $("#txtSubTechnologtId").addClass("is-invalid");
                $("#txtSubTechnologtId").focus();
                return false;
            } else {
                $("#txtSubTechnologtId").removeClass("is-invalid");
                $("#txtSubTechnologtId").addClass("is-valid");
            }
            let slctTechnology = $("#slctTechnologyId").val();
            if (slctTechnology == "") {
                $("#slctTechnologyId").addClass("is-invalid");
                $("#slctTechnologyId").focus();
                return false;
            } else {
                $("#slctTechnologyId").removeClass("is-invalid");
                $("#slctTechnologyId").addClass("is-valid");
            }
            var datas = {
                'op':'SaveSubTechnology',
                "txtSubTechnologt": txtSubTechnologt,
                "slctTechnology": slctTechnology
            }
            console.log(datas);
            var s = function (msg) {
                alert(msg);
            }
            var e = function (sms) {
                alert(sms);
            }
            CallHandler(datas,s,e)
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
                    <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor: pointer;" onclick="location.href='SubTechnologies.aspx'"></i>&nbsp;&nbsp;Administration</li>
                    <li class="breadcrumb-item h6 active">Sub Technology</li>
                    <li class="breadcrumb-item h6">New Sub Technology</li>
                </ol>
            </nav>
            <div class="card shadow mb-5  bg-white rounded">
                <div class="card-header text-center h5 alert alert-info">New Sub Technology</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <textarea id="txtSubTechnologtId" type="text" class="form-control" placeholder="Sub Technology"></textarea>
                                <label for="txtSubTechnologtId">Sub Technology</label>
                                <span class="invalid-feedback is-invalid">please enter sub technology</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select id="slctTechnologyId" class="form-select" title="Technology">
                                    <option value="">Choose from List</option>
                                </select>
                                <label for="slctTechnologyId">Technology</label>
                                <span class="invalid-feedback is-invalid">please select technology</span>
                            </div>
                        </div>
                    </div>
                    <div class="text-center mt-3">
                                <buttin type="button" class="btn btn-primary" onclick="saveSTechnology()">Save</buttin>
                        </div>
                    </div>
                </div>
            </div>
        
    </section>
</asp:Content>
