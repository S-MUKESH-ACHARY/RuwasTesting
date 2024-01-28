<%@ Page Title="" Language="C#" MasterPageFile="~/Operation.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="RUWAS.Map" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <%--<script src="https://unpkg.com/jsts@2.3.0/dist/jsts.min.js"></script>--%>
    <!-- Openlayers -->
    <link href="v6.15.1/css/ol.css" rel="stylesheet" />
    <script src="v6.15.1/build/ol.js"></script>
    <!-- ol-ext -->
    <link href="ol-ext/dist/ol-ext.css" rel="stylesheet" />
    <script src="ol-ext/dist/ol-ext.js"></script>
    <script>
        $(function () {
            $("#mapId").addClass("DE");
        })
    </script>
    <style>
        #map {
            position: relative;
            top: 0;
            bottom: 0;
            width: 100%;
            height: 59vh;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid " id="map_redirect">
    <div id="map" class="map mb-2" style="border:solid; border-color:#0059b3;border-width:1px;border-radius:5px 5px;"></div>
    </div>
   <script>
        var map = new ol.Map({
            target: "map",
            layers: [
                new ol.layer.Tile({
                    source: new ol.source.OSM(),
                }),
                // straitsLayer,
            ],
            view: new ol.View({
                center: ol.proj.fromLonLat([32.51684538495738, 1.5744890820508601]),
                //maxZoom: 16,
                zoom: 7,
            }),
        });
    </script> 
</asp:Content>
