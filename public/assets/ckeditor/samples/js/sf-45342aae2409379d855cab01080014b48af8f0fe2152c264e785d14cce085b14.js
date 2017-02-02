var SF=function(){function t(t){return(t=t.attributes?t.attributes.getNamedItem("class"):null)?t.value.split(" "):[]}function e(t){var e=document.createAttribute("class");return e.value=t.join(" "),e}var n={attachListener:function(t,e,n){if(t.addEventListener)t.addEventListener(e,n,!1);else{if(!t.attachEvent)throw Error("Could not attach event.");t.attachEvent("on"+e,function(){n.apply(t,arguments)})}}};return n.indexOf=function(){var t=Array.prototype.indexOf;return"function"===t?function(e,n){return t.call(e,n)}:function(t,e){for(var n=t.length,o=0;n>o;o++)if(t[o]===e)return o;return-1}}(),n.accept=function(t,e){var o;t.children?(o=t.children,e(t)):"number"==typeof t.length&&(o=t);for(var i=o?o.length||0:0;i--;)n.accept(o[i],e)},n.getByClass=function(){var t=document.getElementsByClassName;return"function"==typeof t?function(e,n){return"string"==typeof e&&(n=e,e=document),t.call(e,n)}:function(t,e){"string"==typeof t&&(e=t,t=document.getElementsByTagName("html")[0]);var o=[];return n.accept(t,function(t){n.classList.contains(t,e)&&o.push(t)}),o}}(),n.classList={},n.classList.add=function(n,o){var i=t(n);i.push(o),n.attributes.setNamedItem(e(i))},n.classList.remove=function(o,i){var r=t(o,i),s=n.indexOf(r,i);-1!==s&&(r.splice(s,1),o.attributes.setNamedItem(e(r)))},n.classList.contains=function(e,o){return-1!==n.indexOf(t(e),o)},n.classList.toggle=function(t,e){this.contains(t,e)?this.remove(t,e):this.add(t,e)},n}();!function(){function t(t){for(var e in t)delete t[e]}SF.modal=function(e){function n(t){27==t.keyCode&&r.close()}e.modalClass="modal content",e.closeClass="modal-close",e.modalStyles=t,e.closeStyles=t;var o=e.afterCreate,i=e.afterClose;e.afterCreate=function(t){o&&o(t),window.addEventListener("keydown",n)},e.afterClose=function(t){i&&i(t),window.removeEventListener("keydown",n)};var r=new picoModal(e).afterCreate(e.afterCreate).afterClose(e.afterClose);return r}}(),function(){for(var t=SF.getByClass("toggler"),e=t.length;e--;)SF.attachListener(t[e],"click",function(){var t=SF.classList.contains(this,"icon-toggler-expanded")||SF.classList.contains(this,"icon-toggler-collapsed"),e=document.getElementById(this.getAttribute("data-for"));SF.classList.toggle(this,"collapsed"),SF.classList.contains(this,"collapsed")?(SF.classList.add(e,"collapsed"),t&&(SF.classList.remove(this,"icon-toggler-expanded"),SF.classList.add(this,"icon-toggler-collapsed"))):(SF.classList.remove(e,"collapsed"),t&&(SF.classList.remove(this,"icon-toggler-collapsed"),SF.classList.add(this,"icon-toggler-expanded")))})}(),function(){for(var t=SF.getByClass("tree-a"),e=t.length;e--;)SF.attachListener(t[e],"click",function(t){t=t.target||t.srcElement,"H2"!==t.nodeName||SF.classList.contains(t,"tree-a-no-sub")||SF.classList.toggle(t,"tree-a-active")})}(),function(t,e){function n(t){return"object"==typeof Node?t instanceof Node:t&&"object"==typeof t&&"number"==typeof t.nodeType}function o(){var t=[];return{watch:t.push.bind(t),trigger:function(e){for(var n=!0,o={preventDefault:function(){n=!1}},i=0;i<t.length;i++)t[i](e,o);return n}}}function i(t){this.elem=t}function r(t,e){return i.div().clazz("pico-overlay").clazz(t("overlayClass","")).stylize({display:"block",position:"fixed",top:"0px",left:"0px",height:"100%",width:"100%",zIndex:1e4}).stylize(t("overlayStyles",{opacity:.5,background:"#000"})).onClick(function(){t("overlayClose",!0)&&e()})}function s(t,e){var n=t("width","auto");return"number"==typeof n&&(n=""+n+"px"),i.div().clazz("pico-content").clazz(t("modalClass","")).stylize({display:"block",position:"fixed",zIndex:10001,left:"50%",top:"50px",width:n,"-ms-transform":"translateX(-50%)","-moz-transform":"translateX(-50%)","-webkit-transform":"translateX(-50%)","-o-transform":"translateX(-50%)",transform:"translateX(-50%)"}).stylize(t("modalStyles",{backgroundColor:"white",padding:"20px",borderRadius:"5px"})).html(t("content")).attr("role","dialog").onClick(function(t){new i(t.target).anyAncestor(function(t){return/\bpico-close\b/.test(t.elem.className)})&&e()})}function a(t){return function(){return t().elem}}function c(e){function i(t,n){var o=e[t];return"function"==typeof o&&(o=o(n)),void 0===o?n:o}function c(){C().hide(),v().hide(),g.trigger(w)}function l(){y.trigger(w)&&c()}function u(t){return function(){return t.apply(this,arguments),w}}function d(t){if(!f){var e,n=s(i,l),o=r(i,l);e=i("closeButton",!0)?n.child().html(i("closeHtml","&#xD7;")).clazz("pico-close").clazz(i("closeClass")).stylize(i("closeStyles",{borderRadius:"2px",cursor:"pointer",height:"15px",width:"15px",position:"absolute",top:"5px",right:"5px",fontSize:"16px",textAlign:"center",lineHeight:"15px",background:"#CCC"})):void 0,f={modal:n,overlay:o,close:e},h.trigger(w)}return f[t]}("string"==typeof e||n(e))&&(e={content:e});var f,h=o(),p=o(),m=o(),y=o(),g=o(),v=d.bind(t,"modal"),C=d.bind(t,"overlay"),b=d.bind(t,"close"),w={modalElem:a(v),closeElem:a(b),overlayElem:a(C),show:function(){return p.trigger(w)&&(C().show(),b(),v().show(),m.trigger(w)),this},close:u(l),forceClose:u(c),destroy:function(){v=v().destroy(),C=C().destroy(),b=void 0},options:function(t){e=t},afterCreate:u(h.watch),beforeShow:u(p.watch),afterShow:u(m.watch),beforeClose:u(y.watch),afterClose:u(g.watch)};return w}i.div=function(t){var n=e.createElement("div");return(t||e.body).appendChild(n),new i(n)},i.prototype={child:function(){return i.div(this.elem)},stylize:function(t){t=t||{},"undefined"!=typeof t.opacity&&(t.filter="alpha(opacity="+100*t.opacity+")");for(var e in t)t.hasOwnProperty(e)&&(this.elem.style[e]=t[e]);return this},clazz:function(t){return this.elem.className+=" "+t,this},html:function(t){return n(t)?this.elem.appendChild(t):this.elem.innerHTML=t,this},onClick:function(t){return this.elem.addEventListener("click",t),this},destroy:function(){e.body.removeChild(this.elem)},hide:function(){this.elem.style.display="none"},show:function(){this.elem.style.display="block"},attr:function(t,e){return this.elem.setAttribute(t,e),this},anyAncestor:function(t){for(var e=this.elem;e;){if(t(new i(e)))return!0;e=e.parentNode}return!1}},"function"==typeof t.define&&t.define.amd?t.define(function(){return c}):t.picoModal=c}(window,document);