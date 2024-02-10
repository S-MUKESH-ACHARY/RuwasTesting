<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="NewQuaterlyAttachment.aspx.cs" Inherits="RUWAS.QuaterlyNewAttachment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Lat_LogConversion/proj4.js"></script>
    <script src="Lat_LogConversion/utm.min.js"></script>
    <script>
        $(function () {
            document.getElementById("dataEntryId").classList.add("DE");
            getFinancialYr();
            loadTechnology();
            getDistrict();
            FundingSourceInformation();
            //getSubCounty();
        })
        function showToast(type, msg) {
            var toast = $('<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="2000" >\
        <div class="d-flex justify-content-end">\
        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close" style="padding:0px"></button></div>\
        <div class="toast-body">'+ msg + '</div>\
        </div>');
            toast.addClass("bg-" + type);
            toast.addClass("text-light");
            $(".toast-container").append(toast);
            toast.toast("show");
        }
        async function utmconv() {
            $("#UTMLocationType").css("display", "block");
            $("#LatLongLocationType").css("display", "none");
            $("#DMSLocationType").css("display", "none");
        }
        async function validate_lat_long_uganda() {
            var latitude = document.getElementById('latitudeId').value;
            if (latitude == "") {
                showToast("danger", "Please Enter Lattitude Value");
                document.getElementById('longitudeId').value = "";
                return false;
            }
            var longitude = document.getElementById('longitudeId').value;

            var num_lat = parseInt(latitude);
            var num_lon = parseInt(longitude);
            if ((-90 <= num_lat) && (num_lat <= 90)) {

            } else {
                return showToast("danger", "Latitude value Is Out of Range Map")
            }
            if (-180 <= num_lon && num_lon <= 180) {

            } else {
                return showToast("danger", "Longitude value Is Out of Range Map")
            }
            // Check if coordinates fall within Uganda's boundaries
            var uganda_boundaries = {
                'min_latitude': -1.464663,
                'max_latitude': 4.220227,
                'min_longitude': 29.573891,
                'max_longitude': 35.000345
            }
            if ((uganda_boundaries['min_latitude'] <= parseFloat(latitude)) && parseFloat(latitude) <= (uganda_boundaries['max_latitude']) &&
                (uganda_boundaries['min_longitude'] <= parseFloat(longitude) && parseFloat(longitude) <= uganda_boundaries['max_longitude'])) {

                utmconv1();
            } else {
                showToast("danger", "Coordinates are not valid for Uganda.");

            }
        }
        async function utmconv1() {
            let lat = document.getElementById("latitudeId").value;
            let lon = document.getElementById("longitudeId").value;
            var utmList = fromLatLon(parseFloat(lat), parseFloat(lon));
            console.log(utmList);
            document.getElementById('zoneId1').value = utmList["zoneNum"];
            document.getElementById('gps_utm_zone_letter').value = utmList["zoneLetter"];
            document.getElementById('eastingId').value = (utmList["easting"]).toFixed(6);
            document.getElementById('northingsId').value = (utmList["northing"]).toFixed(6);
            degresscon1();
        }
        async function latlongconv() {
            $("#UTMLocationType").css("display", "none");
            $("#LatLongLocationType").css("display", "block");
            $("#DMSLocationType").css("display", "none");
        }
        async function latlongconv1() {
            let utmZone = document.getElementById('zoneId1').value;
            let easting = document.getElementById('eastingId').value;
            let northing = document.getElementById('northingsId').value;
            let N_S = document.getElementById('gps_utm_zone_letter').value;
            var utmlatlon = toLatLon(parseFloat(easting), parseFloat(northing), utmZone, N_S);
            document.getElementById('latitudeId').value = (utmlatlon.latitude).toFixed(6);
            document.getElementById('longitudeId').value = (utmlatlon.longitude).toFixed(6);

            let latDMS = await getDD2DMS(parseFloat(utmlatlon.latitude), 'lat');
            let latarry = latDMS.split(",")
            document.getElementById('txtDeg').value = latarry[0];
            document.getElementById('txtMin').value = latarry[1];
            document.getElementById('txtSec').value = latarry[2];
            document.getElementById('slct_dir_DMS').value = latarry[3];
            let LongDMS = await getDD2DMS(parseFloat(utmlatlon.longitude), 'lon');
            let longarry = LongDMS.split(",")
            document.getElementById('txtDeg1').value = longarry[0];
            document.getElementById('txtMin1').value = longarry[1];
            document.getElementById('txtSec1').value = longarry[2];
            document.getElementById('slct_dir_DMS1').value = longarry[3];
            degresscon1();
        }
        async function getDMS2DD(days, minutes, seconds, direction) {
            direction.toUpperCase();
            var dd = days + minutes / 60 + seconds / (60 * 60);
            //alert(dd);
            if (direction == "S" || direction == "W") {
                dd = dd * -1;
            } // Don't do anything for N or E
            return dd;
        }
        async function getDD2DMS(dms, type) {

            var sign = 1, Abs = 0;
            var days, minutes, secounds, direction;

            if (dms < 0) { sign = -1; }
            Abs = Math.abs(Math.round(dms * 1000000.));
            //Math.round is used to eliminate the small error caused by rounding in the computer:
            //e.g. 0.2 is not the same as 0.20000000000284
            //Error checks
            if (type == "lat" && Abs > (90 * 1000000)) {
                //alert(" Degrees Latitude must be in the range of -90. to 90. ");
                showToast("danger", "Degrees Latitude must be in the range of -90. to 90.");
                return false;
            } else if (type == "lon" && Abs > (180 * 1000000)) {
                //alert(" Degrees Longitude must be in the range of -180 to 180. ");
                showToast("danger", "Degrees Longitude must be in the range of -180 to 180. ");
                return false;
            }

            days = Math.floor(Abs / 1000000);
            minutes = Math.floor(((Abs / 1000000) - days) * 60);
            secounds = (Math.floor(((((Abs / 1000000) - days) * 60) - minutes) * 100000) * 60 / 100000);
            days = days * sign;
            if (type == 'lat') direction = days < 0 ? 'S' : 'N';
            if (type == 'lon') direction = days < 0 ? 'W' : 'E';
            //else return value     
            return (days * sign) + ',' + minutes + "," + secounds + "," + direction;
        }
        async function degresscon() {
            $("#UTMLocationType").css("display", "none");
            $("#LatLongLocationType").css("display", "none");
            $("#DMSLocationType").css("display", "block");
        }
        async function degresscon1() {
            let utmZone = document.getElementById('zoneId1').value;
            let easting = document.getElementById('eastingId').value;
            let northing = document.getElementById('northingsId').value;
            let N_S = document.getElementById('gps_utm_zone_letter').value;
            var utmlatlon = toLatLon(parseFloat(easting), parseFloat(northing), utmZone, N_S);

            let latDMS = await getDD2DMS(parseFloat(utmlatlon.latitude), 'lat');
            let latarry = latDMS.split(",")
            document.getElementById('txtDeg').value = latarry[0];
            document.getElementById('txtMin').value = latarry[1];
            document.getElementById('txtSec').value = latarry[2];
            document.getElementById('slct_dir_DMS').value = latarry[3];
            let LongDMS = await getDD2DMS(parseFloat(utmlatlon.longitude), 'lon');
            let longarry = LongDMS.split(",")
            document.getElementById('txtDeg1').value = longarry[0];
            document.getElementById('txtMin1').value = longarry[1];
            document.getElementById('txtSec1').value = longarry[2];
            document.getElementById('slct_dir_DMS1').value = longarry[3];
        }
        function save() {
            var financialYr = $("#slctFinancialYearId").val();
            alert(financialYr);
            if (financialYr == "") {
                $("#slctFinancialYearId").addClass("is-invalid");
                $("#slctFinancialYearId").focus();
                return false;
            } else {
                $("#slctFinancialYearId").removeClass("is-invalid");
                $("#slctFinancialYearId").addClass("is-valid");
            }
            var localGovernment = $("#localGovernmentId").val();
            if (localGovernment == "") {
                $("#localGovernmentId").addClass("is-invalid");
                $("#localGovernmentId").focus();
                return false;
            } else {
                $("#localGovernmentId").removeClass("is-invalid");
                $("#localGovernmentId").addClass("is-valid");
            }
            var category = $("#categoryId option:selected").text();
            if (category == "") {
                $("#categoryId").addClass("is-invalid");
                $("#categoryId").focus();
                return false;
            } else {
                $("#categoryId").removeClass("is-invalid");
                $("#categoryId").addClass("is-valid");
            }
            var quarter = $("#quarterId").val();
            if (quarter == "") {
                $("#quarterId").addClass("is-invalid");
                $("#quarterId").focus();
                return false;
            } else {
                $("#quarterId").removeClass("is-invalid");
                $("#quarterId").addClass("is-valid");
            }
            var slctTechnology = $("#slctTechnologyId").val();
            if (slctTechnology == "") {
                $("#slctTechnologyId").addClass("is-invalid");
                $("#slctTechnologyId").focus();
                return false;
            } else {
                $("#slctTechnologyId").removeClass("is-invalid");
                $("#slctTechnologyId").addClass("is-valid");
            }
            var sub_County = $("#sub_CountyId").val();
            if (sub_County == "") {
                $("#sub_CountyId").addClass("is-invalid");
                $("#sub_CountyId").focus();
                return false;
            } else {
                $("#sub_CountyId").removeClass("is-invalid");
                $("#sub_CountyId").addClass("is-valid");
            }
            var SlctParish = $("#SlctParishId").val();
            if (SlctParish == "") {
                $("#SlctParishId").addClass("is-invalid");
                $("#SlctParishId").focus();
                return false;
            } else {
                $("#SlctParishId").removeClass("is-invalid");
                $("#SlctParishId").addClass("is-valid");
            }
            var SlctVillage = $("#SlctVillageId").val();
            if (SlctVillage == "") {
                $("#SlctVillageId").addClass("is-invalid");
                $("#SlctVillageId").focus();
                return false;
            } else {
                $("#SlctVillageId").removeClass("is-invalid");
                $("#SlctVillageId").addClass("is-valid");
            }
            //let locationType = $("input[name='locationType']:checked").val();
            //if (locationType == "UTM") {
                //let UTMZone = $("#slctUTMZone").val();
                //if (UTMZone == "") {
                //    $("#slctUTMZone").addClass("is-invalid");
                //    $("#slctUTMZone").focus();
                //    return false;
                //} else {
                //    $("#slctUTMZone").removeClass("is-invalid");
                //    $("#slctUTMZone").addClass("is-valid");
                //}
                //let UTMEasting = $("#txtUTMEasting").val();
                //if (UTMEasting == "") {
                //    $("#txtUTMEasting").addClass("is-invalid");
                //    $("#txtUTMEasting").focus();
                //    return false;
                //} else {
                //    $("#txtUTMEasting").removeClass("is-invalid");
                //    $("#txtUTMEasting").addClass("is-valid");
                //}
                //let UTMNorthing = $("#txtUTMNorthing").val();
                //if (UTMNorthing == "") {
                //    $("#txtUTMNorthing").addClass("is-invalid");
                //    $("#txtUTMNorthing").focus();
                //    return false;
                //} else {
                //    $("#txtUTMNorthing").removeClass("is-invalid");
                //    $("#txtUTMNorthing").addClass("is-valid");
                //}

           // }
           // else if (locationType == "Lat/Long") {
            let Latitude = $("#latitudeId").val();
                if (Latitude == "") {
                    $("#latitudeId").addClass("is-invalid");
                    $("#latitudeId").focus();
                    return false;
                } else {
                    $("#latitudeId").removeClass("is-invalid");
                    $("#latitudeId").addClass("is-valid");
                }
            let Longitude = $("#longitudeId").val();
                if (Longitude == "") {
                    $("#longitudeId").addClass("is-invalid");
                    $("#longitudeId").focus();
                    return false;
                } else {
                    $("#longitudeId").removeClass("is-invalid");
                    $("#longitudeId").addClass("is-valid");
            }
            let gps_utm_zone_number = $("#zoneId1").val();
            let gps_utm_zone_letter = $("#gps_utm_zone_letter").val();
            let utmEasting = $("#eastingId").val();
            let utmNorthings = $("#northingsId").val();
               
           // }
           // else if (locationType == "DMS") {
            let XDeg = $("#txtDeg").val();
                //if (Deg == "") {
                //    $("#txtDeg").addClass("is-invalid");
                //    $("#txtDeg").focus();
                //    return false;
                //} else {
                //    $("#txtDeg").removeClass("is-invalid");
                //    $("#txtDeg").addClass("is-valid");
                //}
            let XMin = $("#txtMin").val();
                //if (Min == "") {
                //    $("#txtMin").addClass("is-invalid");
                //    $("#txtMin").focus();
                //    return false;
                //} else {
                //    $("#txtMin").removeClass("is-invalid");
                //    $("#txtMin").addClass("is-valid");
                //}
            let XSec = $("#txtSec").val();
                //if (Sec == "") {
                //    $("#txtSec").addClass("is-invalid");
                //    $("#txtSec").focus();
                //    return false;
                //} else {
                //    $("#txtSec").removeClass("is-invalid");
                //    $("#txtSec").addClass("is-valid");
                //}
            let XDir_DMS = $("#slct_dir_DMS").val();
            let YDeg = $("#txtDeg1").val();
                //if (Deg1 == "") {
                //    $("#txtDeg1").addClass("is-invalid");
                //    $("#txtDeg1").focus();
                //    return false;
                //} else {
                //    $("#txtDeg1").removeClass("is-invalid");
                //    $("#txtDeg1").addClass("is-valid");
                //}
            let YMin = $("#txtMin1").val();
                //if (Min1 == "") {
                //    $("#txtMin1").addClass("is-invalid");
                //    $("#txtMin1").focus();
                //    return false;
                //} else {
                //    $("#txtMin1").removeClass("is-invalid");
                //    $("#txtMin1").addClass("is-valid");
                //}
            let YSec = $("#txtSec1").val();
            
                //if (Sec1 == "") {
                //    $("#txtSec1").addClass("is-invalid");
                //    $("#txtSec1").focus();
                //    return false;
                //} else {
                //    $("#txtSec1").removeClass("is-invalid");
                //    $("#txtSec1").addClass("is-valid");
                //}
            // }
            let YDir_DMS = $("#slct_dir_DMS1").val();
            var sourceNumber = $("#sourceNumberId").val();
            if (sourceNumber == "") {
                $("#sourceNumberId").addClass("is-invalid");
                $("#sourceNumberId").focus();
                return false;
            } else {
                $("#sourceNumberId").removeClass("is-invalid");
                $("#sourceNumberId").addClass("is-valid");
            }
            var nameOfWaterSource = $("#nameOfWaterSourceId").val();
            if (nameOfWaterSource == "") {
                $("#nameOfWaterSourceId").addClass("is-invalid");
                $("#nameOfWaterSourceId").focus();
                return false;
            } else {
                $("#nameOfWaterSourceId").removeClass("is-invalid");
                $("#nameOfWaterSourceId").addClass("is-valid");
            }
            var SlctFundSourceType = $("#SlctFundSourceTypeId").val();
            if (SlctFundSourceType == "") {
                $("#SlctFundSourceTypeId").addClass("is-invalid");
                $("#SlctFundSourceTypeId").focus();
                return false;
            } else {
                $("#SlctFundSourceTypeId").removeClass("is-invalid");
                $("#SlctFundSourceTypeId").addClass("is-valid");
            }
            var funderName = $("#funderNameId").val();
            if (funderName == "") {
                $("#funderNameId").addClass("is-invalid");
                $("#funderNameId").focus();
                return false;
            } else {
                $("#funderNameId").removeClass("is-invalid");
                $("#funderNameId").addClass("is-valid");
            }
            var investmentCost = $("#investmentCostId").val();
            if (investmentCost == "") {
                $("#investmentCostId").addClass("is-invalid");
                $("#investmentCostId").focus();
                return false;
            } else {
                $("#investmentCostId").removeClass("is-invalid");
                $("#investmentCostId").addClass("is-valid");
            }
            var title = $("#titleId").val();
            if (title == "") {
                $("#titleId").addClass("is-invalid");
                $("#titleId").focus();
                return false;
            } else {
                $("#titleId").removeClass("is-invalid");
                $("#titleId").addClass("is-valid");
            }
            //var Doc1 = $("#txtDoc1").val();
            //if (Doc1 == "") {
            //    $("#txtDoc1").addClass("is-invalid");
            //    $("#txtDoc1").focus();
            //    return false;
            //} else {
            //    $("#txtDoc1").removeClass("is-invalid");
            //    $("#txtDoc1").addClass("is-valid");
            //}
            alert("Saved Successfully.");
            var data = {
                "op": "SaveQuarterlyAttachment",
                "financialYr": financialYr,
                "localGovernment": localGovernment,
                "category": category,
                "quarter": quarter,
                "slctTechnology": slctTechnology,
                "SlctVillage": SlctVillage,
                "Latitude": Latitude,
                "Longitude": Longitude,
                "gps_utm_zone_number": gps_utm_zone_number,
                "gps_utm_zone_letter": gps_utm_zone_letter,
                "utmEasting": utmEasting,
                "utmNorthings": utmNorthings,
                "XDeg": XDeg,
                "XMin": XMin,
                "XSec": XSec,
                "XDir_DMS": XDir_DMS, 
                "YDeg": YDeg,
                "YMin": YMin,
                "YSec": YSec,
                "YDir_DMS": YDir_DMS,
                "sourceNumber": sourceNumber,
                "nameOfWaterSource": nameOfWaterSource,
                "SlctFundSourceType": SlctFundSourceType,
                "funderName": funderName,
                "investmentCost": investmentCost,
                "title": title
            }
            var s = function (sms) {
                alert(sms);
            }
            var e = function (msg) {
                alert(msg);
            }
            console.log(data);
            CallHandler(data, s, e);
        }
        function getFinancialYr() {
            var data = { 'op': 'FetchFinancialYear' }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    
                    let AddFinancialYr = $("#slctFinancialYearId");
                    
                        sms.forEach(function (item) {

                            let option = document.createElement('option');
                            option.value = item.FinancialYr;
                            option.text = item.FinancialYrName;
                            AddFinancialYr.append(option);
                         //It uses the: gt() selector, which stands for "greater than." 
                         //It selects all the < option > elements that have an index greater
                         //than the value specified in the parentheses ie values of dropdown. 
                            ///var maxItemsToShow = 5;
                            $('#slctFinancialYearId option:gt(' + (4) + ')').remove();
                        })
                        sms.forEach(function (item) {
                            if (item.IsActive == 1) {
                                $("#slctFinancialYearId").val(item.FinancialYr);
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
        
        function getDistrict() {
            var data = { "op": "FetchLC" }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let District = document.getElementById("slctDistrictId");
                    sms.forEach((msg) => {
                        let option = document.createElement('option');
                        option.value = msg.LCId;
                        option.text = msg.LCName;
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
            let districtId = document.getElementById("slctDistrictId").value;
           
            var data = { 'op': 'FetchSubCountyOfDistrict', 'districtId': districtId }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let SubCounty = document.getElementById("sub_CountyId");
                    SubCounty.innerHTML = "";
                    let ParishId = document.getElementById("SlctParishId");
                    ParishId.innerHTML = "";
                    sms.forEach((item) => {
                        let option = document.createElement('option');
                        option.value = item.SubCountyId;
                        option.text = item.SubCountyName;
                        SubCounty.appendChild(option);
                    })
                } else {
                    let SubCounty = document.getElementById("sub_CountyId");
                    SubCounty.innerHTML = "";
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function getParish() {
            let sub_CountyId = $("#sub_CountyId").val();
            var data = { 'op': 'FetchParishOfSubcounty', 'sub_CountyId': sub_CountyId }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let ParishId = document.getElementById("SlctParishId");
                    ParishId.innerHTML = "";
                    let option1 = document.createElement('option');
                    option1.value = "";
                    option1.text = "Choose From List";
                    ParishId.append(option1);
                    sms.forEach(function (item) {
                        let option = document.createElement('option');
                        option.value = item.ParishId;
                        option.text = item.ParishName;
                        ParishId.appendChild(option);
                    })
                }
                else {
                    let ParishId = document.getElementById("SlctParishId");
                    ParishId.innerHTML = "";
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function getVillage() {
            let ParishId = $("#SlctParishId").val();
            var data = { 'op': 'VillageOfParish', 'ParishId': ParishId }
            var s = function (sms) {
                if (Array.isArray(sms)) {
                    let Village = document.getElementById("SlctVillageId");
                    Village.innerHTML = "";
                    sms.forEach(function (item) {
                        let option = document.createElement('option');
                        option.value = item.VillageId;
                        option.text = item.VillageName;
                        Village.appendChild(option);
                    })
                }
                else {
                    let Village = document.getElementById("SlctVillageId");
                    Village.innerHTML = "";
                }
            }
            var e = function (msg) {
                alert(msg);
            }
            CallHandler(data, s, e);
        }
        function FundingSourceInformation() {
            var data = { 'op': 'FundingSourceInformation' }
            var s = function (sms) {
                let FundingSource = document.getElementById('SlctFundSourceTypeId');
                if (Array.isArray(sms)) {
                    sms.forEach(function (item) {
                        let option = document.createElement('option');
                        option.value = item.FundingSourceId;
                        option.text = item.FundingSourceName;
                        FundingSource.appendChild(option);
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
        <%--Toast--%>
 <div class="toast-container position-fixed top-0 end-0">
 </div>
        <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb d-flex justify-content-start">
                <li class="breadcrumb-item h6 active"><i class="fa-solid fa-arrow-left" style="cursor:pointer;" onclick="location.href='QuarterlyAttachments.aspx'"></i>&nbsp;&nbsp;Data Entry</li>
                <li class="breadcrumb-item h6 active">Quarterly Attachments</li>
                <li class="breadcrumb-item h6">New Quarterly Attachment</li>
            </ol>

        </nav>
        <div class="card shadow mb-5 bg-white rounded">
            <div class="card-header  text-center h5 alert alert-info">
                New Quarterly Attachment
            </div>
            <div>
                <div>
                    <div><strong class="ms-3">1.Basic Information</strong></div>
                    <div class="row p-2 m-1">
                        <div class="col-lg-3 col-12">
                            <div class="form-floating">
                                <select class="form-select" id="slctFinancialYearId" title="Financial Year">
                                    <%--<option value="">Choose From List</option>--%>
                                </select>
                                <label class="slctFinancialYearId">Financial Year <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select Financial year</span>
                            </div>
                        </div>
                        <%--<div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <input disabled type="text" id="workplanId" class="form-control" title="Enter the Workplan Id" placeholder="Workplan Id" />
                                <label for="workplanId">Workplan Id</label>
                                <span class="invalid-feedback is-invalid">please enter the workplan id</span>
                            </div>
                        </div>--%>
                    </div>
                    <div class="row p-1 m-1 mb-4">
                       <%-- <div class="col-lg-3 col-sm-6">
                            <div class="form-floating">
                                <select class="form-select" id="localGovernmentId" aria-label="A">
                                    <option value="">Choose From List</option>
                                </select>
                                <label for="localGovernmentId">Local Government <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>--%>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="categoryId" title="Category">
                                    <option value="">Choose From List</option>
                                    <option value="1">New water sources constructed in this quarter</option>
                                    <option value="2">Water sources rehabilitated in this quarter</option>
                                </select>
                                <label for="categoryId">New Rehabilitated Category <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="quarterId" title="Quarter">
                                    <option value="">Choose From List</option>
                                    <option value="1">Q One (July-Sept)</option>
                                    <option value="2">Q Two (Oct-Dec)</option>
                                    <option value="3">Q Three (Jan-March)</option>
                                    <option value="4">Q Four (Apr-Jun)</option>
                                </select>
                                <label for="quarterId">Quarter <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="slctTechnologyId" title="Technology">
                                    <option value="">Choose From List</option>

                                </select>
                                <label for="slctTechnologyId">Technology <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                    </div>
                    <div class="row ms-2"><strong>2.Location Information</strong></div>
                    <div class="row p-1 m-1">
                             <div class="row p-1 m-1">
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="slctDistrictId" title="District" onchange="getSubCounty()">
                                    <option value="">Choose from List</option>
                                    
                                </select>
                                <label for="slctDistrictId">District <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select id="sub_CountyId" class="form-select" title="Sub-County" onchange="getParish()">
                                    <option value="">Choose From List</option>
                                </select>
                                <label for="sub_CountyId">Sub-County <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>

                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="SlctParishId" title="Parish" onchange=" getVillage()">
                                    <option value="">Choose From List</option>

                                </select>
                                <label for="SlctParishId">Parish <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="SlctVillageId" title="Village">
                                    <option value="">Choose From List</option>
                                    <%--<option value="1">Example One</option>
                                    <option value="2">Example Two</option>
                                    <option value="3">Example Three</option>--%>
                                </select>
                                <label for="SlctVillageId">Village <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                    </div>
                    <%--<div class="row p-1 m-1">
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="SlctVillageId" title="Village">
                                    <option value="">Choose From List</option>
                                    <option value="1">Example One</option>
                                    <option value="2">Example Two</option>
                                    <option value="3">Example Three</option>
                                </select>
                                <label for="SlctVillageId">Village <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                    </div>--%>
                    <div class="row ms-2"><strong>3.GPS Information:</strong></div>
                    <div class="d-flex p-1 p-1 m-1">
                        <div class="form-check form-switch m-1">
                            <input class="form-check-input" type="radio" role="switch" checked name="locationType" value="Lat/Long" onclick="latlongconv()" id="rdbtn_lat_long">
                            <label class="form-check-label">Lat/Long</label>
                        </div>
                        <div class="form-check form-switch m-1">
                            <input class="form-check-input" type="radio" role="switch" name="locationType" value="UTM" onclick="utmconv()" id="rdbtn_utm">
                            <label class="form-check-label">UTM</label>
                        </div>

                        <div class="form-check form-switch m-1">
                            <input class="form-check-input" type="radio" role="switch" name="locationType" value="DMS" onclick="degresscon()">
                            <label class="form-check-label">DMS</label>
                        </div>
                    </div>
                    <div id="LatLongLocationType">
                        <div class="row p-1">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="latitudeId" placeholder="Enter Latitude" title="Enter Latitude" />
                                    <label for="latitudeId">Latitude</label>
                                    <span class="invalid-feedback">please enter latitude</span>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="longitudeId" placeholder="Enter Longitude" title="Enter Longitude" onchange="validate_lat_long_uganda()" />
                                    <label for="longitudeId">Longitude</label>
                                    <span class="invalid-feedback">please enter longitude</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="UTMLocationType" style="display: none">
                        <div class="row p-1">
                            <div class="col-sm-12 col-lg-3 col-md-3">
                                <div class="form-floating">
                                    <input type="number" id="zoneId1" class="form-control" placeholder="zonal number" title="zonal number" onchange="latlongconv1()" />
                                    <label>Zonal Number</label>
                                    
                                </div>
                            </div>
                            <div class="col-sm-12 col-lg-3 col-md-3">
                                <div class="form-floating">
                                    <input type="text" id="gps_utm_zone_letter" placeholder="zonal letter" title="zonal letter" class="form-control" onchange="latlongconv1()" />
                                    <label>Zonal Letter</label>
                                    
                                </div>
                            </div>
                            <div class="col-sm-12 col-lg-3 col-md-3">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="eastingId" title="enter easting" placeholder="Enter Easting" onchange="latlongconv1()" />
                                    <label for="eastingId">Easting</label>
                                    <span class="invalid-feedback">please enter easting</span>
                                </div>

                            </div>
                            <div class="col-sm-12 col-lg-3 col-md-3">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="northingsId" placeholder="Enter Northings Name" title="Enter Northings" onchange="latlongconv1()" />
                                    <label for="northingsId">Northings</label>
                                    <span class="invalid-feedback">please enter northings</span>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div id="DMSLocationType" style="display: none">
                        <div class="row p-1">
                            <div class="col-lg-2 col-md-2 col-sm-12 d-flex">
                                <input type="number" class="form-control" id="txtDeg" />&nbsp;<div class="pt-1">Deg</div>
                                <span class="notValid" id="errDeg">*</span>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 d-flex">
                                <input type="number" class="form-control" id="txtMin" />&nbsp;<div class="pt-1">Min</div>
                                <span class="notValid" id="errMin">*</span>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 d-flex">
                                <input type="number" class="form-control" id="txtSec" />&nbsp;<div class="pt-1">Sec</div>
                                <span class="notValid" id="errSec">*</span>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12">
                                <select class="form-select" id="slct_dir_DMS">
                                    <option value="">select</option>
                                    <option value="E">E</option>
                                    <option value="W">W</option>
                                    <option value="N">N</option>
                                    <option value="S">S</option>
                                </select>
                                <span class="notValid" id="err_slct_dir_DMS">*</span>
                            </div>
                        </div>
                        <div class="row p-1">
                            <div class="col-lg-2 col-md-2 col-sm-12 d-flex">
                                <input type="number" class="form-control" id="txtDeg1" />&nbsp;<div class="pt-1">Deg</div>
                                <span class="notValid" id="errDeg1">*</span>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 d-flex">
                                <input type="number" class="form-control" id="txtMin1" />&nbsp;<div class="pt-1">Min</div>
                                <span class="notValid" id="errMin1">*</span>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 d-flex">
                                <input type="number" class="form-control" id="txtSec1" />&nbsp;<div class="pt-1">Sec</div>
                                <span class="notValid" id="errSec1">*</span>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12">
                                <select class="form-select" id="slct_dir_DMS1">
                                    <option value="">select</option>
                                    <option value="E">E</option>
                                    <option value="W">W</option>
                                    <option value="N">N</option>
                                    <option value="S">S</option>
                                </select>
                                <span class="notValid" id="err_slct_dir_DMS1">*</span>
                            </div>
                        </div>
                    </div>
                    <table class="w-100 m-2" id="add_table">
                        <tr>
                            <td>
                                <div class="row ms-2"><strong>3.Source Information</strong></div>
                            </td>
                        </tr>
                        <tr class="row m-1 p-1">
                            <td class="col-3">
                                <div class="form-floating">
                                    <input type="text" min="1" class="form-control" id="sourceNumberId" title="Enter the Source Number" placeholder="Enter Source Number" />
                                    <label for="sourceNumberId">Source Number <span>*</span></label>
                                    <span class="invalid-feedback is-invalid">please enter the source number</span>
                                </div>
                            </td>
                            <td class="col-3">
                                <div class="form-floating">
                                    <input type=" text" id="nameOfWaterSourceId" class="form-control" title="Enter the Name of Water Source" placeholder="Enter Name of Water Source" />
                                    <label for="nameOfWaterSourceId">Name of Water Source <span>*</span></label>
                                    <span class="invalid-feedback is-invalid">please enter the name of water source</span>
                                </div>
                            </td>
                            <%-- <td class="col-3 mt-2">
                                <button type="button" class="btn btn-light" onclick="addNewRow()"><i class="fa-solid fa-circle-plus fa-1x"></i></button>
                                &nbsp;&nbsp;
                                <button type="button" class="btn btn-light" onclick="removeNewRow(this)"><i class="fa-solid fa-circle-minus fa-1x"></i></button>
                            </td>--%>
                        </tr>
                    </table>
                    <div class="row ms-2 mt-4"><strong>4.Funding Information</strong></div>
                    <div class="row m-1 p-1">
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <select class="form-select" id="SlctFundSourceTypeId" title="Fund Source Type">
                                    <option value="">Choose From List</option>
                                </select>
                                <label for="SlctFundSourceTypeId">Fund Source Type <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please select from list</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="funderNameId" placeholder="Enter the Name of Funder" title="Enter the Name of Funder" />
                                <label for="funderNameId">Funder Name <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please enter the name of funder</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <input type="number" id="investmentCostId" class="form-control" placeholder="Enter the Investment Cost in USX(000)" title="Enter the Investment Cost in USX(000)" />
                                <label for="investmentCostId">Investment Cost UGX(000) <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please enter the Investment Cost in USX(000)</span>
                            </div>
                        </div>
                    </div>
                   <%-- <div class="row ms-2 mt-4">
                        <strong>5.Attachments</strong>
                    </div>
                    <div class="row m-1 p-1">
                        <div class="col-lg-3 col-6">
                            <div class="form-floating">
                                <input type="text" id="titleId" class="form-control" placeholder="Enter the Title of Document" title="Enter the Title of Document" />
                                <label>Title <span>*</span></label>
                                <span class="invalid-feedback is-invalid">please enter the title of document</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <input class="form-control form-control-lg " type="file" id="txtDoc1" />
                            <span class="invalid-feedback is-invalid">please select any file</span>
                        </div>
                        <div class="col-lg-3 col-6 text-sm-start mt-4 fst-italic" style="font-weight: 400">(Docment File, Max 10MB) <span>*</span></div>
                    </div>
                </div>--%>
                <div class="d-flex justify-content-center p-2 mt-3 mb-3">
                    <button type="button" class="btn btn-warning" id="saveId" onclick="save()">Save</button>&nbsp;
                        <button type="button" class="btn btn-danger" id="cancelId" onclick="location.reload();">Clear</button>
                </div>
            </div>
        </div>
    </section>
   
</asp:Content>
