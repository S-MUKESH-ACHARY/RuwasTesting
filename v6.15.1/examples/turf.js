"use strict";(self.webpackChunk=self.webpackChunk||[]).push([[4835],{8161:function(e,t,n){var r=n(1118),o=n(1376),s=n(4354),a=n(5783),u=n(9847),c=n(1372),f=n(2010),i=n(2810);const m=new a.Z;fetch("data/geojson/roads-seoul.geojson").then((function(e){return e.json()})).then((function(e){const t=new r.Z,n=t.readFeatures(e)[0],o=t.writeFeatureObject(n),s=turf.lineDistance(o,"kilometers");for(let e=1;e<=s/.2;e++){const n=turf.along(o,.2*e,"kilometers"),r=t.readFeature(n);r.getGeometry().transform("EPSG:4326","EPSG:3857"),m.addFeature(r)}n.getGeometry().transform("EPSG:4326","EPSG:3857"),m.addFeature(n)}));const w=new c.Z({source:m}),d=new f.Z({source:new u.Z});new o.Z({layers:[d,w],target:document.getElementById("map"),view:new s.ZP({center:(0,i.mi)([126.980366,37.52654]),zoom:15})})}},function(e){var t=function(t){return e(e.s=t)};t(9877),t(8161)}]);
//# sourceMappingURL=turf.js.map