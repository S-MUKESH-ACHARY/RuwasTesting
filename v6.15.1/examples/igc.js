"use strict";(self.webpackChunk=self.webpackChunk||[]).push([[8178],{9899:function(e,t,n){var o=n(2739),r=n(277),a=n(1376),i=n(9847),s=n(5783),c=n(4354),l=n(9039),u=n(720),d=n(7138),g=n(7975),w=n(5469),f=n(5265),m=n(1372),p=n(2010),h=n(8164);const y={"Clement Latour":"rgba(0, 0, 255, 0.7)","Damien de Baesnt":"rgba(0, 215, 255, 0.7)","Sylvain Dhonneur":"rgba(0, 165, 255, 0.7)","Tom Payne":"rgba(0, 255, 255, 0.7)","Ulrich Prinz":"rgba(0, 215, 255, 0.7)"},Z={},C=new s.Z,b=["data/igc/Clement-Latour.igc","data/igc/Damien-de-Baenst.igc","data/igc/Sylvain-Dhonneur.igc","data/igc/Tom-Payne.igc","data/igc/Ulrich-Prinz.igc"];function P(e,t){const n=new XMLHttpRequest;n.open("GET",e),n.onload=function(){t(n.responseText)},n.send()}const v=new r.Z;for(let e=0;e<b.length;++e)P(b[e],(function(e){const t=v.readFeatures(e,{featureProjection:"EPSG:3857"});C.addFeatures(t)}));const L={start:1/0,stop:-1/0,duration:0};C.on("addfeature",(function(e){const t=e.feature.getGeometry();L.start=Math.min(L.start,t.getFirstCoordinate()[2]),L.stop=Math.max(L.stop,t.getLastCoordinate()[2]),L.duration=L.stop-L.start}));const T=new m.Z({source:C,style:function(e){const t=y[e.get("PLT")];let n=Z[t];return n||(n=new l.ZP({stroke:new u.Z({color:t,width:3})}),Z[t]=n),n}}),k=new a.Z({layers:[new p.Z({source:new i.Z({attributions:['All maps © <a href="https://www.opencyclemap.org/">OpenCycleMap</a>',i.h],url:"https://{a-c}.tile.thunderforest.com/cycle/{z}/{x}/{y}.png?apikey=0e6fc415256d4fbb9b5166a718591d71"})}),T],target:"map",view:new c.ZP({center:[703365.7089403362,5714629.865071137],zoom:9})});let E=null,G=null;const M=function(e){const t=C.getClosestFeatureToCoordinate(e),n=document.getElementById("info");if(null===t)E=null,G=null,n.innerHTML="&nbsp;";else{const o=t.getGeometry().getClosestPoint(e);null===E?E=new w.Z(o):E.setCoordinates(o);const r=new Date(1e3*o[2]);n.innerHTML=t.get("PLT")+" ("+r.toUTCString()+")";const a=[e,[o[0],o[1]]];null===G?G=new f.Z(a):G.setCoordinates(a)}k.render()};k.on("pointermove",(function(e){if(e.dragging)return;const t=k.getEventCoordinate(e.originalEvent);M(t)})),k.on("click",(function(e){M(e.coordinate)}));const F=new u.Z({color:"rgba(255,0,0,0.9)",width:1}),S=new l.ZP({stroke:F,image:new d.Z({radius:5,fill:null,stroke:F})});T.on("postrender",(function(e){const t=(0,h.u3)(e);t.setStyle(S),null!==E&&t.drawGeometry(E),null!==G&&t.drawGeometry(G)}));const D=new m.Z({source:new s.Z,map:k,style:new l.ZP({image:new d.Z({radius:5,fill:new g.Z({color:"rgba(255,0,0,0.9)"})})})}),z=document.getElementById("time"),B=function(){const e=parseInt(z.value,10)/100,t=L.start+L.duration*e;C.forEachFeature((function(e){const n=e.getGeometry().getCoordinateAtM(t,!0);let r=e.get("highlight");void 0===r?(r=new o.Z(new w.Z(n)),e.set("highlight",r),D.getSource().addFeature(r)):r.getGeometry().setCoordinates(n)})),k.render()};z.addEventListener("input",B),z.addEventListener("change",B)}},function(e){var t=function(t){return e(e.s=t)};t(9877),t(9899)}]);
//# sourceMappingURL=igc.js.map