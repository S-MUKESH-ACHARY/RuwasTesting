"use strict";(self.webpackChunk=self.webpackChunk||[]).push([[2799],{3368:function(t,e,i){var s=i(6566),n=i(4975),r=i(5395),a=i(2275),o=i(2016),h=i(2990);function l(t){return parseFloat(t)}function _(t){return function(t){return(0,h.FH)(t,5)}(t).toString()}function c(t,e){return!isNaN(t)&&t!==l(_(e))}class p extends n.ZP{constructor(t){super();const e=(0,a.f0)({animate:!0,replace:!1,prefix:""},t||{});let i;i=!0===e.animate?{duration:250}:e.animate?e.animate:null,this.animationOptions_=i,this.replace_=e.replace,this.prefix_=e.prefix,this.listenerKeys_=[],this.initial_=!0,this.updateState_=this.updateState_.bind(this)}getParamName_(t){return this.prefix_?this.prefix_+t:t}get_(t,e){return t.get(this.getParamName_(e))}set_(t,e,i){t.set(this.getParamName_(e),i)}delete_(t,e){t.delete(this.getParamName_(e))}setMap(t){const e=this.getMap();super.setMap(t),t!==e&&(e&&this.unregisterListeners_(e),t&&(this.initial_=!0,this.updateState_(),this.registerListeners_(t)))}registerListeners_(t){this.listenerKeys_.push((0,o.oL)(t,r.Z.MOVEEND,this.updateUrl_,this),(0,o.oL)(t.getLayerGroup(),s.Z.CHANGE,this.updateUrl_,this),(0,o.oL)(t,"change:layergroup",this.handleChangeLayerGroup_,this)),this.replace_||addEventListener("popstate",this.updateState_)}unregisterListeners_(t){for(let t=0,e=this.listenerKeys_.length;t<e;++t)(0,o.bN)(this.listenerKeys_[t]);this.listenerKeys_.length=0,this.replace_||removeEventListener("popstate",this.updateState_);const e=new URL(window.location.href),i=e.searchParams;this.delete_(i,"x"),this.delete_(i,"y"),this.delete_(i,"z"),this.delete_(i,"r"),this.delete_(i,"l"),window.history.replaceState(null,"",e)}handleChangeLayerGroup_(){const t=this.getMap();t&&(this.unregisterListeners_(t),this.registerListeners_(t),this.initial_=!0,this.updateUrl_())}updateState_(){const t=this.getMap();if(!t)return;const e=t.getView();if(!e)return;const i=new URL(window.location.href).searchParams;let s=!1;const n={},r=l(this.get_(i,"z"));c(r,e.getZoom())&&(s=!0,n.zoom=r);const o=l(this.get_(i,"r"));c(o,e.getRotation())&&(s=!0,n.rotation=o);const h=[l(this.get_(i,"x")),l(this.get_(i,"y"))];var _,p;_=h,p=e.getCenter(),(c(_[0],p[0])||c(_[1],p[1]))&&(s=!0,n.center=h),s&&(!this.initial_&&this.animationOptions_?e.animate((0,a.f0)(n,this.animationOptions_)):(n.center&&e.setCenter(n.center),"zoom"in n&&e.setZoom(n.zoom),"rotation"in n&&e.setRotation(n.rotation)));const u=t.getAllLayers(),g=this.get_(i,"l");if(g&&g.length===u.length)for(let t=0,e=u.length;t<e;++t){const e=parseInt(g[t]);if(!isNaN(e)){const i=Boolean(e),s=u[t];s.getVisible()!==i&&s.setVisible(i)}}}updateUrl_(){const t=this.getMap();if(!t)return;const e=t.getView();if(!e)return;const i=this.initial_;this.initial_=!1;const s=e.getCenter(),n=e.getZoom(),r=e.getRotation(),a=t.getAllLayers(),o=new Array(a.length);for(let t=0,e=a.length;t<e;++t)o[t]=a[t].getVisible()?"1":"0";const h=new URL(window.location.href),l=h.searchParams;this.set_(l,"x",_(s[0])),this.set_(l,"y",_(s[1])),this.set_(l,"z",_(n)),this.set_(l,"r",_(r)),this.set_(l,"l",o.join("")),h.href!==window.location.href&&(i||this.replace_?window.history.replaceState(null,"",h):window.history.pushState(null,"",h))}}var u=p,g=i(1376),d=i(9847),f=i(2010),m=i(4354);new g.Z({layers:[new f.Z({source:new d.Z})],target:"map",view:new m.ZP({center:[0,0],zoom:2})}).addInteraction(new u)}},function(t){var e=function(e){return t(t.s=e)};e(9877),e(3368)}]);
//# sourceMappingURL=link.js.map