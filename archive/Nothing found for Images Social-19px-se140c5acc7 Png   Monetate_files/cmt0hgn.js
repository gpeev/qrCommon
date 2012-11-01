/*{"created":"2012-06-22T21:42:13Z","k":"0.16.0","version":"11523000","mac":"1:5346c3d9434aadf75b9892af2610a838fca1215a92adff15675c11634b64da7c"}*/
;(function(window,document,undefined){
var g=void 0,l=!0,n=null,o=!1;function p(a){return function(){return this[a]}}var q;function r(a,c,b){var d=2<arguments.length?Array.prototype.slice.call(arguments,2):[];return function(){d.push.apply(d,arguments);return c.apply(a,d)}}function s(a){this.m=a;this.w=g}s.prototype.createElement=function(a,c,b){a=this.m.createElement(a);if(c)for(var d in c)c.hasOwnProperty(d)&&("style"==d?this.pa(a,c[d]):a.setAttribute(d,c[d]));b&&a.appendChild(this.m.createTextNode(b));return a};
function t(a,c,b){a=a.m.getElementsByTagName(c)[0];a||(a=document.documentElement);a&&a.lastChild&&a.insertBefore(b,a.lastChild)}function u(a){function c(){document.body?a():setTimeout(c,0)}c()}function v(a){a.parentNode&&a.parentNode.removeChild(a)}function w(a,c){for(var b=a.className.split(/\s+/),d=0,e=b.length;d<e;d++)if(b[d]==c)return;b.push(c);a.className=b.join(" ").replace(/^\s+/,"")}
function x(a,c){for(var b=a.className.split(/\s+/),d=[],e=0,f=b.length;e<f;e++)b[e]!=c&&d.push(b[e]);a.className=d.join(" ").replace(/^\s+/,"").replace(/\s+$/,"")}function y(a,c){for(var b=a.className.split(/\s+/),d=0,e=b.length;d<e;d++)if(b[d]==c)return l;return o}s.prototype.pa=function(a,c){this.U()?a.setAttribute("style",c):a.style.cssText=c};s.prototype.U=function(){if(this.w===g){var a=this.m.createElement("p");a.innerHTML='<a style="top:1px;">w</a>';this.w=/top/.test(a.getElementsByTagName("a")[0].getAttribute("style"))}return this.w};
function z(a,c,b,d,e,f,h){this.W=a;this.Pa=c;this.wa=b;this.va=d;this.Ka=e;this.Ja=f;this.ua=h}q=z.prototype;q.getName=p("W");q.getVersion=p("Pa");q.getEngine=p("wa");q.getEngineVersion=p("va");q.getPlatform=p("Ka");q.getPlatformVersion=p("Ja");q.getDocumentMode=p("ua");function A(a,c){this.c=a;this.v=c}var ca=new z("Unknown","Unknown","Unknown","Unknown","Unknown","Unknown",g);
A.prototype.parse=function(){var a;if(-1!=this.c.indexOf("MSIE"))if(a=B(this.c,/(MSIE [\d\w\.]+)/,1),""!=a){var c=a.split(" ");a=c[0];c=c[1];a=new z(a,c,a,c,C(this),D(this),E(this.v),6<=G(c))}else a=new z("MSIE","Unknown","MSIE","Unknown",C(this),D(this),E(this.v));else if(-1!=this.c.indexOf("Opera"))a:{var c=a="Unknown",b=B(this.c,/(Presto\/[\d\w\.]+)/,1);""!=b?(c=b.split("/"),a=c[0],c=c[1]):(-1!=this.c.indexOf("Gecko")&&(a="Gecko"),b=B(this.c,/rv:([^\)]+)/,1),""!=b&&(c=b));if(-1!=this.c.indexOf("Version/")&&
(b=B(this.c,/Version\/([\d\.]+)/,1),""!=b)){a=new z("Opera",b,a,c,C(this),D(this),E(this.v),10<=G(b));break a}b=B(this.c,/Opera[\/ ]([\d\.]+)/,1);a=""!=b?new z("Opera",b,a,c,C(this),D(this),E(this.v),10<=G(b)):new z("Opera","Unknown",a,c,C(this),D(this),E(this.v))}else if(-1!=this.c.indexOf("AppleWebKit")){a=C(this);c=D(this);b=B(this.c,/AppleWebKit\/([\d\.]+)/,1);""==b&&(b="Unknown");var d="Unknown";-1!=this.c.indexOf("Chrome")||-1!=this.c.indexOf("CrMo")?d="Chrome":-1!=this.c.indexOf("Safari")?
d="Safari":-1!=this.c.indexOf("AdobeAIR")&&(d="AdobeAIR");var e="Unknown";-1!=this.c.indexOf("Version/")?e=B(this.c,/Version\/([\d\.\w]+)/,1):"Chrome"==d?e=B(this.c,/(Chrome|CrMo)\/([\d\.]+)/,2):"AdobeAIR"==d&&(e=B(this.c,/AdobeAIR\/([\d\.]+)/,1));"AdobeAIR"==d?(B(e,/\d+\.(\d+)/,1),2<G(e)||G(e)):(B(b,/\d+\.(\d+)/,1),526<=G(b)||G(b));a=new z(d,e,"AppleWebKit",b,a,c,E(this.v))}else if(-1!=this.c.indexOf("Gecko")){c=a="Unknown";d=o;-1!=this.c.indexOf("Firefox")?(a="Firefox",b=B(this.c,/Firefox\/([\d\w\.]+)/,
1),""!=b&&(d=B(b,/\d+\.(\d+)/,1),c=b,d=""!=b&&3<=G(b)&&5<=parseInt(d,10))):-1!=this.c.indexOf("Mozilla")&&(a="Mozilla");b=B(this.c,/rv:([^\)]+)/,1);if(""==b)b="Unknown";else if(!d){var d=G(b),e=parseInt(B(b,/\d+\.(\d+)/,1),10),f=parseInt(B(b,/\d+\.\d+\.(\d+)/,1),10);1<d||1==d&&9<e||1==d&&9==e&&2<=f||b.match(/1\.9\.1b[123]/)!=n||b.match(/1\.9\.1\.[\d\.]+/)}a=new z(a,c,"Gecko",b,C(this),D(this),E(this.v))}else a=ca;return a};
function C(a){var c=B(a.c,/(iPod|iPad|iPhone|Android)/,1);if(""!=c)return c;a=B(a.c,/(Linux|Mac_PowerPC|Macintosh|Windows|CrOS)/,1);return""!=a?("Mac_PowerPC"==a&&(a="Macintosh"),a):"Unknown"}function D(a){var c=B(a.c,/(OS X|Windows NT|Android|CrOS) ([^;)]+)/,2);if(c||(c=B(a.c,/(iPhone )?OS ([\d_]+)/,2)))return c;return(a=B(a.c,/Linux ([i\d]+)/,1))?a:"Unknown"}function G(a){a=B(a,/(\d+)/,1);return""!=a?parseInt(a,10):-1}function B(a,c,b){return(a=a.match(c))&&a[b]?a[b]:""}
function E(a){if(a.documentMode)return a.documentMode}function da(a,c,b){this.j=a;this.l=c;this.$=b;this.p="wf";this.o=new H("-")}function I(a){x(a.l,a.o.k(a.p,"loading"));y(a.l,a.o.k(a.p,"active"))||w(a.l,a.o.k(a.p,"inactive"));J(a,"inactive")}function J(a,c,b,d){if(a.$[c])a.$[c](b,d)}function K(a,c,b,d,e){this.j=a;this.A=c;this.C=b;this.u=d;this.H=e;this.O=0;this.qa=this.ia=o}
K.prototype.watch=function(a,c,b,d,e){for(var f=a.length,h=0;h<f;h++){var i=a[h];c[i]||(c[i]=["n4"]);this.O+=c[i].length}e&&(this.ia=e);for(h=0;h<f;h++)for(var i=a[h],e=c[i],j=b[i],k=0,m=e.length;k<m;k++){var aa=e[k],F=this.A,L=i,ba=aa;w(F.l,F.o.k(F.p,L,ba,"loading"));J(F,"fontloading",L,ba);F=r(this,this.xa);L=r(this,this.ya);(new d(F,L,this.j,this.C,this.u,this.H,i,aa,j)).start()}};
K.prototype.xa=function(a,c){var b=this.A;x(b.l,b.o.k(b.p,a,c,"loading"));x(b.l,b.o.k(b.p,a,c,"inactive"));w(b.l,b.o.k(b.p,a,c,"active"));J(b,"fontactive",a,c);this.qa=l;ea(this)};K.prototype.ya=function(a,c){var b=this.A;x(b.l,b.o.k(b.p,a,c,"loading"));y(b.l,b.o.k(b.p,a,c,"active"))||w(b.l,b.o.k(b.p,a,c,"inactive"));J(b,"fontinactive",a,c);ea(this)};
function ea(a){0==--a.O&&a.ia&&(a.qa?(a=a.A,x(a.l,a.o.k(a.p,"loading")),x(a.l,a.o.k(a.p,"inactive")),w(a.l,a.o.k(a.p,"active")),J(a,"active")):I(a.A))}
function M(a,c,b,d,e,f,h,i,j){this.sa=a;this.Ca=c;this.j=b;this.C=d;this.u=e;this.H=f;this.Ia=new fa;this.Aa=new ga;this.Q=h;this.P=i;this.za=j||"BESbswy";this.ja=ha(this,"arial,'URW Gothic L',sans-serif");this.ka=ha(this,"Georgia,'Century Schoolbook L',serif");this.ga=this.ja;this.ha=this.ka;this.X=N(this,"arial,'URW Gothic L',sans-serif");this.Y=N(this,"Georgia,'Century Schoolbook L',serif")}M.prototype.start=function(){this.Na=this.H();this.aa()};
M.prototype.aa=function(){var a=this.C.T(this.X),c=this.C.T(this.Y);(this.ja!=a||this.ka!=c)&&this.ga==a&&this.ha==c?(a=this.sa,v(this.X),v(this.Y),a(this.Q,this.P)):5E3<=this.H()-this.Na?(a=this.Ca,v(this.X),v(this.Y),a(this.Q,this.P)):(this.ga=a,this.ha=c,ia(this))};function ia(a){a.u(function(a,b){return function(){b.call(a)}}(a,a.aa),25)}function ha(a,c){var b=N(a,c,l),d=a.C.T(b);v(b);return d}function N(a,c,b){c=a.j.createElement("span",{style:ja(a,c,a.P,b)},a.za);t(a.j,"body",c);return c}
function ja(a,c,b,d){b=a.Aa.expand(b);return"position:absolute;top:-999px;left:-999px;font-size:300px;width:auto;height:auto;line-height:normal;margin:0;padding:0;font-variant:normal;font-family:"+(d?"":a.Ia.quote(a.Q)+",")+c+";"+b}function H(a){this.Ga=a||"-"}H.prototype.k=function(a){for(var c=[],b=0;b<arguments.length;b++)c.push(arguments[b].replace(/[\W_]+/g,"").toLowerCase());return c.join(this.Ga)};function fa(){this.oa="'"}
fa.prototype.quote=function(a){for(var c=[],a=a.split(/,\s*/),b=0;b<a.length;b++){var d=a[b].replace(/['"]/g,"");-1==d.indexOf(" ")?c.push(d):c.push(this.oa+d+this.oa)}return c.join(",")};function ga(){this.ma=ka;this.D=la}var ka=["font-style","font-weight"],la={"font-style":[["n","normal"],["i","italic"],["o","oblique"]],"font-weight":[["1","100"],["2","200"],["3","300"],["4","400"],["5","500"],["6","600"],["7","700"],["8","800"],["9","900"],["4","normal"],["7","bold"]]};
function ma(a,c,b){this.Da=a;this.La=c;this.D=b}ma.prototype.expand=function(a,c){for(var b=0;b<this.D.length;b++)if(c==this.D[b][0]){a[this.Da]=this.La+":"+this.D[b][1];break}};ga.prototype.expand=function(a){if(2!=a.length)return n;for(var c=[n,n],b=0,d=this.ma.length;b<d;b++){var e=this.ma[b];(new ma(b,e,this.D[e])).expand(c,a.substr(b,1))}return c[0]&&c[1]?c.join(";")+";":n};function O(a){this.m=a;this.w=g}O.prototype=s.prototype;O.prototype.Ba=function(){return this.m.location.hostname};
function na(a,c,b){var d=a.m.getElementsByTagName("head")[0];if(d){var e=a.m.createElement("script");e.src=c;var f=o;e.onload=e.onreadystatechange=function(){if(!f&&(!this.readyState||"loaded"==this.readyState||"complete"==this.readyState))f=l,b&&b(),e.onload=e.onreadystatechange=n,"HEAD"==e.parentNode.tagName&&d.removeChild(e)};d.appendChild(e)}}O.prototype.pa=function(a,c){this.U()?a.setAttribute("style",c):a.style.cssText=c};
O.prototype.U=function(){if(this.w===g){var a=this.m.createElement("p");a.innerHTML='<a style="top:1px;">w</a>';this.w=/top/.test(a.getElementsByTagName("a")[0].getAttribute("style"))}return this.w};function oa(a,c){this.Ma=a;this.ba=c}function pa(a){for(var c=a.Ma.join(","),b=[],d=0;d<a.ba.length;d++){var e=a.ba[d];b.push(e.name+":"+e.value+";")}return c+"{"+b.join("")+"}"}function P(a,c){this.B=a;this.G=c;this.da={};this.ca={}}P.prototype.z=function(a){return a?(this.da[a.I]||this.G).slice(0):this.G.slice(0)};
function qa(a,c,b){for(var d=[],e=a.B.split(",")[0].replace(/"|'/g,""),f=a.z(),h,i=[],j={},k=0;k<f.length;k++)h=f[k],0<h.length&&!j[h]&&(j[h]=l,i.push(h));b=b.na?b.na(e,i,d):i;c=c.I;a.da[c]=b;a.ca[c]=d}P.prototype.watch=function(a,c,b){var d=[],e={};ra(this,c,d,e);a(d,e,b)};function ra(a,c,b,d){b.push(a.B);d[a.B]=a.z(c);a=a.ca[c.I]||[];for(c=0;c<a.length;c++){for(var e=a[c],f=e.B,h=o,i=0;i<b.length;i++)b[i]==f&&(h=l);h||(b.push(f),d[f]=e.z())}}function sa(a,c){this.B=a;this.G=c}sa.prototype.z=p("G");
function ta(a){var c=new Image(1,1);c.src=a;c.onload=function(){c.onload=n}}function Q(a,c){this.I=a;this.fa=c}function R(a){ua.L.push(a)}function va(a){this.j=a;this.r=this.c=this.K=n;this.ta=this.Ea=this.Fa=l;this.n=[];this.F=[];this.ra=this.R=this.M=this.N=n}
function wa(a,c){a.c=c;if(a.K){var b;a:{b=a.K;for(var d=a.c,e=a.Fa,f=a.Ea,h=a.ta,i=0;i<b.L.length;i++){var j=b.L[i];if(j.fa&&j.fa(d.getName(),d.getVersion(),d.getEngine(),d.getEngineVersion(),d.getPlatform(),d.getPlatformVersion(),d.getDocumentMode(),e,f,h)){b=j;break a}}b=n}a.r=b}}q=va.prototype;q.supportsConfiguredBrowser=function(){return!!this.r};
q.init=function(){for(var a=[],c=0;c<this.F.length;c++)a.push(pa(this.F[c]));var c=this.j,a=a.join(""),b=this.j.m.createElement("style");b.setAttribute("type","text/css");b.styleSheet?b.styleSheet.cssText=a:b.appendChild(document.createTextNode(a));t(c,"head",b)};
q.load=function(a,c){var b=this.r.I;if(this.R)for(var d=xa(this.R,b),e=0;e<this.n.length;e++)qa(this.n[e],this.r,d);this.N&&(d=[],this.M&&(d=new ya(this.j,this.r,this.n),d=za(this.M,b,d)),b=this.N.k("https:"==this.j.m.location.protocol,Aa(b,d)),t(this.j,"head",this.j.createElement("link",{rel:"stylesheet",href:b})));a&&u(function(a,b,c,e){return function(){for(var d=0;d<a.n.length;d++)a.n[d].watch(b,c,e&&d==a.n.length-1)}}(this,a,this.r,c))};
q.collectFontFamilies=function(a,c){for(var b=0;b<this.n.length;b++)ra(this.n[b],this.r,a,c)};q.performOptionalActions=function(a){this.V&&u(function(a,b,d,e){return function(){var b=a.V;if(b.la){var h=window.__adobewebfontsappname__,h=h?h.toString().substr(0,20):"";ta(b.la.k("https:"==e.m.location.protocol,{host:encodeURIComponent(e.m.location.hostname),app:encodeURIComponent(h),_:(+new Date).toString()}))}b=a.V;b.Z&&(b=b.Z.k(d,e),t(e,"body",b))}}(this,a,this.c,this.j))};
function S(a,c,b,d){this.Ha=a;this.j=c;this.l=b;this.u=d;this.q=[]}S.prototype.J=function(a){this.q.push(a)};S.prototype.load=function(a,c){var b=a,d=c||{};if("string"==typeof b)b=[b];else if(!b||!b.length)d=b||{},b=[];if(b.length)for(var e=this,f=b.length,h=0;h<b.length;h++)Ba(this,b[h],function(){0==--f&&Ca(e,d)});else Ca(this,d)};function Ba(a,c,b){na(a.j,a.Ha.k("https:"==a.j.m.location.protocol,{id:encodeURIComponent(c)}),b)}
function Ca(a,c){for(var b=new da(a.j,a.l,c),d=o,e=0;e<a.q.length;e++)a.q[e].init(),d=d||a.q[e].supportsConfiguredBrowser();d?(w(b.l,b.o.k(b.p,"loading")),J(b,"loading"),Da(a,b)):I(b);a.q=[]}function Da(a,c){function b(a,b,c){d.watch(a,b,{},M,c)}for(var d=new K(a.j,c,{T:function(a){return a.offsetWidth}},a.u,function(){return+new Date}),e=0;e<a.q.length;e++){var f=a.q[e];f.supportsConfiguredBrowser()&&(f.load(b,e==a.q.length-1),f.performOptionalActions(window))}}
function T(a,c){this.ea=a;this.u=c;this.q=[]}T.prototype.J=function(a){this.q.push(a)};T.prototype.load=function(){var a=this.ea.__webfonttypekitmodule__;if(a)for(var c=0;c<this.q.length;c++){var b=this.q[c],d=a[b.ra];if(d){var e=this.u;d(function(a,c,d){var c=[],j={};wa(b,a);b.supportsConfiguredBrowser()&&(b.init(),b.load(n,e),b.collectFontFamilies(c,j),b.performOptionalActions(window));d(b.supportsConfiguredBrowser(),c,j)})}}};function U(a,c){this.W=a;this.na=c}U.prototype.getName=p("W");
function Ea(a){var c=V;Fa(c,a.getName())||c.S.push(a)}function Fa(a,c){for(var b=0;b<a.S.length;b++){var d=a.S[b];if(c===d.getName())return d}return n}function xa(a,c){var b=a.s[c];return b?Fa(a,b):n}function za(a,c,b){for(var d=[],a=a.t[c]||[],c=0;c<a.length;c++){var e;a:switch(a[c]){case "observeddomain":e=new Ga(b.j);break a;case "fontmask":e=new Ha(b.r,b.n);break a;default:e=n}e&&d.push(e)}return d}function ya(a,c,b){this.j=a;this.r=c;this.n=b}function Ga(a){this.j=a}
Ga.prototype.toString=function(){return encodeURIComponent(this.j.Ba?this.j.m.location.hostname:document.location.hostname)};function Ha(a,c){this.r=a;this.n=c}Ha.prototype.toString=function(){for(var a=[],c=0;c<this.n.length;c++)for(var b=this.n[c],d=b.z(),b=b.z(this.r),e=0;e<d.length;e++){var f;a:{for(f=0;f<b.length;f++)if(d[e]===b[f]){f=l;break a}f=o}a.push(f?1:0)}a=a.join("");a=a.replace(/^0+/,"");c=[];for(d=a.length;0<d;d-=4)b=a.slice(0>d-4?0:d-4,d),c.unshift(parseInt(b,2).toString(16));return c.join("")};
function W(a){this.Oa=a}W.prototype.k=function(a,c){var b=c||{},d=this.Oa.replace(/\{\/?([^*}]*)(\*?)\}/g,function(a,c,d){return d&&b[c]?"/"+b[c].join("/"):b[c]||""});d.match(/^\/\//)&&(d=(a?"https:":"http:")+d);return d.replace(/\/*\?*($|\?)/,"$1")};function Aa(a,c){for(var b=[],d=0;d<c.length;d++)b.push(c[d].toString());return{format:a,extras:b}}var ua=new function(){this.L=[]};
R(new Q("a",function(a,c,b,d,e,f){if(o||("Windows"==e&&"Unknown"==f?l:o)||("Ubuntu"==e||"Linux"==e?l:o))a:{if("AdobeAIR"==a&&(a=/([0-9]+.[0-9]+)/.exec(c))){a=2.5<=parseFloat(a[1]);break a}a=o}else a=o;return a}));
R(new Q("b",function(a,c,b,d,e,f,h,i,j,k){var m;m=o||function(a,b,c,e,d,f){a=/^([0-9]+)(_|.)([0-9]+)/.exec(f);return"Macintosh"==d&&a?(d=parseInt(a[1],10),f=parseInt(a[3],10),10<d||10==d&&4<=f):"Macintosh"==d&&"Unknown"==f?l:o}(a,c,b,d,e,f,h,i,j,k);return!m?o:function(a,b){if("AdobeAIR"==a){var c=/([0-9]+.[0-9]+)/.exec(b);if(c)return 2.5<=parseFloat(c[1])}return o}(a,c,b,d,e,f,h,i,j,k)}));
R(new Q("a",function(a,c,b,d,e,f,h,i,j,k){var m;m=(m=o||("Windows"==e&&"5.1"==f?l:o)||("Windows"==e&&"5.2"==f?l:o)||("Windows"==e&&"6.0"==f?l:o)||function(a,b,c,d,e,f){a=/^([0-9]+).([0-9]+)/.exec(f);return"Windows"==e&&a?(e=parseInt(a[1],10),a=parseInt(a[2],10),6<e||6==e&&1<=a):o}(a,c,b,d,e,f,h,i,j,k))||function(a,b,c,e,d,f){a=/^([0-9]+)(_|.)([0-9]+)/.exec(f);return"Macintosh"==d&&a?(d=parseInt(a[1],10),f=parseInt(a[3],10),10<d||10==d&&4<=f):"Macintosh"==d&&"Unknown"==f?l:o}(a,c,b,d,e,f,h,i,j,k);
return!m&&!("Ubuntu"==e||"Linux"==e?l:o)?o:function(a,b){if("Chrome"==a){var c=/([0-9]+.[0-9]+).([0-9]+).([0-9]+)/.exec(b);if(c){var d=parseFloat(c[1]),e=parseInt(c[2],10),c=parseInt(c[3],10);if(!(6<=d)&&(4<d||4==d&&249<e||4==d&&249==e&&4<=c))return l}}return o}(a,c,b,d,e,f,h,i,j,k)}));
R(new Q("d",function(a,c,b,d,e,f,h,i,j,k){var m;m=(m=(m=o||("Windows"==e&&"5.1"==f?l:o)||("Windows"==e&&"5.2"==f?l:o)||("Windows"==e&&"6.0"==f?l:o)||function(a,b,c,d,e,f){a=/^([0-9]+).([0-9]+)/.exec(f);return"Windows"==e&&a?(e=parseInt(a[1],10),a=parseInt(a[2],10),6<e||6==e&&1<=a):o}(a,c,b,d,e,f,h,i,j,k))||function(a,b,c,d,e,f){a=/^([0-9]+)(_|.)([0-9]+)/.exec(f);return"Macintosh"==e&&a?(e=parseInt(a[1],10),f=parseInt(a[3],10),10<e||10==e&&4<=f):"Macintosh"==e&&"Unknown"==f?l:o}(a,c,b,d,e,f,h,i,j,
k))||("Ubuntu"==e||"Linux"==e?l:o)||function(a,b,c,e,d,f,h,i,j,k){a=/([0-9]+).([0-9]+)/.exec(f);return k&&"Android"==d&&a?(d=parseInt(a[1],10),k=parseInt(a[2],10),3==d&&1<=k||3<d):o}(a,c,b,d,e,f,h,i,j,k);return!(m||"CrOS"==e)?o:function(a,b){if("Chrome"==a){var c=/([0-9]+.[0-9]+).([0-9]+).([0-9]+)/.exec(b);if(c&&6<=parseFloat(c[1]))return l}}(a,c,b,d,e,f,h,i,j,k)}));
R(new Q("a",function(a,c,b,d,e,f,h,i,j,k){var m;m=o||("Windows"==e&&"5.1"==f?l:o)||("Windows"==e&&"5.2"==f?l:o)||("Windows"==e&&"6.0"==f?l:o)||function(a,b,c,d,e,f){a=/^([0-9]+).([0-9]+)/.exec(f);return"Windows"==e&&a?(e=parseInt(a[1],10),a=parseInt(a[2],10),6<e||6==e&&1<=a):o}(a,c,b,d,e,f,h,i,j,k);return!m&&!("Ubuntu"==e||"Linux"==e?l:o)?o:function(a,b,c,e){return"Gecko"==c?(a=/1.9.1b[1-3]{1}/,/1.9.1/.test(e)&&!a.test(e)):o}(a,c,b,d,e,f,h,i,j,k)}));
R(new Q("b",function(a,c,b,d,e,f,h,i,j,k){var m;m=o||function(a,b,c,e,d,f){a=/^([0-9]+)(_|.)([0-9]+)/.exec(f);return"Macintosh"==d&&a?(d=parseInt(a[1],10),f=parseInt(a[3],10),10<d||10==d&&4<=f):"Macintosh"==d&&"Unknown"==f?l:o}(a,c,b,d,e,f,h,i,j,k);return!m?o:function(a,b,c,e){return"Gecko"==c?(a=/1.9.1b[1-3]{1}/,/1.9.1/.test(e)&&!a.test(e)):o}(a,c,b,d,e,f,h,i,j,k)}));
R(new Q("d",function(a,c,b,d,e,f,h,i,j,k){var m;m=(m=o||("Windows"==e&&"5.1"==f?l:o)||("Windows"==e&&"5.2"==f?l:o)||("Windows"==e&&"6.0"==f?l:o)||function(a,b,c,e,d,f){a=/^([0-9]+).([0-9]+)/.exec(f);return"Windows"==d&&a?(d=parseInt(a[1],10),a=parseInt(a[2],10),6<d||6==d&&1<=a):o}(a,c,b,d,e,f,h,i,j,k))||function(a,b,c,d,e,f){a=/^([0-9]+)(_|.)([0-9]+)/.exec(f);return"Macintosh"==e&&a?(e=parseInt(a[1],10),f=parseInt(a[3],10),10<e||10==e&&4<=f):"Macintosh"==e&&"Unknown"==f?l:o}(a,c,b,d,e,f,h,i,j,k);
return!m&&!("Ubuntu"==e||"Linux"==e?l:o)?o:function(a,b,c,e){return"Gecko"==c&&(b=/([0-9]+.[0-9]+)(.([0-9]+)|)/.exec(e))?(a=parseFloat(b[1]),b=parseInt(b[3],10),1.9<a||1.9<=a&&1<b):o}(a,c,b,d,e,f,h,i,j,k)}));
R(new Q("i",function(a,c,b,d,e,f,h,i,j,k){var m;m=o||("Windows"==e&&"5.1"==f?l:o)||("Windows"==e&&"5.2"==f?l:o)||("Windows"==e&&"6.0"==f?l:o)||function(a,b,c,e,d,f){a=/^([0-9]+).([0-9]+)/.exec(f);return"Windows"==d&&a?(d=parseInt(a[1],10),a=parseInt(a[2],10),6<d||6==d&&1<=a):o}(a,c,b,d,e,f,h,i,j,k);return!m?o:function(a,b,c,e,d,f,h){if("MSIE"==a)return(a=/([0-9]+.[0-9]+)/.exec(b))?6<=parseFloat(a[1])&&(h===g||9>h):o}(a,c,b,d,e,f,h,i,j,k)}));
R(new Q("d",function(a,c,b,d,e,f,h){if(!(c=o))b=/^([0-9]+).([0-9]+)/.exec(f),"Windows"==e&&b?(c=parseInt(b[1],10),b=parseInt(b[2],10),c=6<c||6==c&&1<=b):c=o;a=c||("Windows"==e&&"6.0"==f?l:o)?"MSIE"==a?9<=h:g:o;return a}));
R(new Q("a",function(a,c,b,d,e,f,h,i,j,k){var m;m=o||("Windows"==e&&"5.1"==f?l:o)||("Windows"==e&&"5.2"==f?l:o)||("Windows"==e&&"6.0"==f?l:o)||function(a,b,c,e,d,f){a=/^([0-9]+).([0-9]+)/.exec(f);return"Windows"==d&&a?(d=parseInt(a[1],10),a=parseInt(a[2],10),6<d||6==d&&1<=a):o}(a,c,b,d,e,f,h,i,j,k);return!m&&!("Ubuntu"==e||"Linux"==e?l:o)?o:function(a,b){if("Opera"==a){var c=parseFloat(b);return 10.54<=c&&11.1>c}return o}(a,c,b,d,e,f,h,i,j,k)}));
R(new Q("b",function(a,c,b,d,e,f,h,i,j,k){var m;m=o||function(a,b,c,d,e,f){a=/^([0-9]+)(_|.)([0-9]+)/.exec(f);return"Macintosh"==e&&a?(e=parseInt(a[1],10),f=parseInt(a[3],10),10<e||10==e&&4<=f):"Macintosh"==e&&"Unknown"==f?l:o}(a,c,b,d,e,f,h,i,j,k);return!m?o:function(a,b){if("Opera"==a){var c=parseFloat(b);return 10.54<=c&&11.1>c}return o}(a,c,b,d,e,f,h,i,j,k)}));
R(new Q("d",function(a,c,b,d,e,f,h,i,j,k){var m;m=(m=o||("Windows"==e&&"5.1"==f?l:o)||("Windows"==e&&"5.2"==f?l:o)||("Windows"==e&&"6.0"==f?l:o)||function(a,b,c,e,d,f){a=/^([0-9]+).([0-9]+)/.exec(f);return"Windows"==d&&a?(d=parseInt(a[1],10),a=parseInt(a[2],10),6<d||6==d&&1<=a):o}(a,c,b,d,e,f,h,i,j,k))||function(a,b,c,d,e,f){a=/^([0-9]+)(_|.)([0-9]+)/.exec(f);return"Macintosh"==e&&a?(e=parseInt(a[1],10),f=parseInt(a[3],10),10<e||10==e&&4<=f):"Macintosh"==e&&"Unknown"==f?l:o}(a,c,b,d,e,f,h,i,j,k);
return!m&&!("Ubuntu"==e||"Linux"==e?l:o)?o:"Opera"==a?11.1<=parseFloat(c):o}));R(new Q("b",function(a,c,b,d,e,f,h,i,j,k){var m;m=o||function(a,b,c,e,d,f){a=/^([0-9]+)(_|.)([0-9]+)/.exec(f);return"Macintosh"==d&&a?(d=parseInt(a[1],10),f=parseInt(a[3],10),10<d||10==d&&4<=f):"Macintosh"==d&&"Unknown"==f?l:o}(a,c,b,d,e,f,h,i,j,k);return!m?o:function(a,b,c,d){return"Safari"==a&&"AppleWebKit"==c&&(a=/([0-9]+.[0-9]+)/.exec(d))?(a=parseFloat(a[1]),525.13<=a&&534.5>a):o}(a,c,b,d,e,f,h,i,j,k)}));
R(new Q("a",function(a,c,b,d,e,f,h,i,j,k){var m;m=o||("Windows"==e&&"5.1"==f?l:o)||("Windows"==e&&"5.2"==f?l:o)||("Windows"==e&&"6.0"==f?l:o)||function(a,b,c,d,e,f){a=/^([0-9]+).([0-9]+)/.exec(f);return"Windows"==e&&a?(e=parseInt(a[1],10),a=parseInt(a[2],10),6<e||6==e&&1<=a):o}(a,c,b,d,e,f,h,i,j,k);return!m?o:function(a,b,c,e){return"Safari"==a&&"AppleWebKit"==c&&(a=/([0-9]+.[0-9]+)/.exec(e))?(a=parseFloat(a[1]),525.13<=a&&534.5>a):o}(a,c,b,d,e,f,h,i,j,k)}));
R(new Q("d",function(a,c,b,d,e,f,h,i,j,k){var m;m=(m=o||("Windows"==e&&"5.1"==f?l:o)||("Windows"==e&&"5.2"==f?l:o)||("Windows"==e&&"6.0"==f?l:o)||function(a,b,c,e,d,f){a=/^([0-9]+).([0-9]+)/.exec(f);return"Windows"==d&&a?(d=parseInt(a[1],10),a=parseInt(a[2],10),6<d||6==d&&1<=a):o}(a,c,b,d,e,f,h,i,j,k))||function(a,b,c,d,e,f){a=/^([0-9]+)(_|.)([0-9]+)/.exec(f);return"Macintosh"==e&&a?(e=parseInt(a[1],10),f=parseInt(a[3],10),10<e||10==e&&4<=f):"Macintosh"==e&&"Unknown"==f?l:o}(a,c,b,d,e,f,h,i,j,k);
return!m?o:function(a,b,c,e){return"Safari"==a&&"AppleWebKit"==c&&(a=/([0-9]+.[0-9]+)/.exec(e))?534.5<=parseFloat(a[1]):o}(a,c,b,d,e,f,h,i,j,k)}));
R(new Q("a",function(a,c,b,d,e,f,h,i,j,k){var m;m=(m=(m=o||function(a,b,c,e,d,f,h,i,k,j){a=/([0-9]+).([0-9]+)/.exec(f);return j&&"Android"==d&&a?(d=parseInt(a[1],10),j=parseInt(a[2],10),2==d&&2<=j||3==d&&1>j):o}(a,c,b,d,e,f,h,i,j,k))||function(a,b,c,e,d,f,h,i,j){return j&&"iPad"==d&&(a=/^([0-9]+)_([0-9]+)/.exec(f))?(b=parseInt(a[2],10),4==parseInt(a[1],10)&&2<=b):o}(a,c,b,d,e,f,h,i,j,k))||function(a,b,c,e,d,f,h,i){if(i&&("iPhone"==d||"iPod"==d))if(a=/^([0-9]+)_([0-9]+)/.exec(f))return b=parseInt(a[2],
10),4==parseInt(a[1],10)&&2<=b;return o}(a,c,b,d,e,f,h,i,j,k);return!m?o:"Safari"==a&&"AppleWebKit"==b||"Unknown"==a&&"AppleWebKit"==b&&("iPhone"==e||"iPad"==e)?l:o}));R(new Q("f",function(a,c,b,d,e,f,h,i,j,k){if(!(c=o))f=/([0-9]+).([0-9]+)/.exec(f),k&&"Android"==e&&f?(k=parseInt(f[1],10),f=parseInt(f[2],10),c=3==k&&1<=f||3<k):c=o;return!c?o:"Safari"==a&&"AppleWebKit"==b||"Unknown"==a&&"AppleWebKit"==b&&("iPhone"==e||"iPad"==e)?l:o}));
R(new Q("d",function(a,c,b,d,e,f,h,i,j,k){var m;m=(m=o||function(a,b,c,d,e,f,h,i,j){return j&&"iPad"==e?(a=/^([0-9]+)_([0-9]+)/.exec(f))?5<=parseInt(a[1],10):o:o}(a,c,b,d,e,f,h,i,j,k))||function(a,b,c,e,d,f,h,i){return i&&("iPhone"==d||"iPod"==d)?(a=/^([0-9]+)_([0-9]+)/.exec(f))?5<=parseInt(a[1],10):o:o}(a,c,b,d,e,f,h,i,j,k);return!m?o:"Safari"==a&&"AppleWebKit"==b||"Unknown"==a&&"AppleWebKit"==b&&("iPhone"==e||"iPad"==e)?l:o}));var V=new function(){this.S=[];this.s={}};
Ea(new U("AllFonts",function(a,c){return c}));
Ea(new U("DefaultFourFontsWithSingleFvdFamilies",function(a,c,b){for(var d=0;d<c.length;d++){var e=c[d],f=a.replace(/(-1|-2)$/,"").slice(0,28)+"-"+e;b.push(new sa(f,[e]))}a={};for(e=0;e<c.length;e++)b=c[e],d=b.charAt(1),(a[d]||(a[d]=[])).push(b);b=[[4,3,2,1,5,6,7,8,9],[7,8,9,6,5,4,3,2,1]];d=[];for(e=0;e<b.length;e++)for(var f=b[e],h=0;h<f.length;h++){var i=f[h];if(a[i]){d=d.concat(a[i]);break}}b=d;d={};a=[];for(e=0;e<b.length;e++)f=b[e],d[f]||(d[f]=l,a.push(f));b=[];for(d=0;d<c.length;d++){e=c[d];
for(f=0;f<a.length;f++)h=a[f],h==e&&b.push(h)}return b}));V.s.a="AllFonts";V.s.b="AllFonts";V.s.d="AllFonts";V.s.e="AllFonts";V.s.f="AllFonts";V.s.g="AllFonts";V.s.h="AllFonts";V.s.i="DefaultFourFontsWithSingleFvdFamilies";var X=new function(){this.t={}};X.t.a=[];X.t.b=[];X.t.d=[];X.t.e=[];X.t.f=["observeddomain"];X.t.g=["observeddomain"];X.t.h=["observeddomain"];X.t.i=["observeddomain","fontmask"];window.Typekit||(window.Typekit={});
if(!window.Typekit.load){var Ia=function(a,c){setTimeout(a,c)},Y=new S(new W("//use.typekit.com/{id}.js"),new O(document),document.documentElement,Ia),Z=new T(window,Ia);window.Typekit.load=function(){Y.load.apply(Y,arguments)};window.Typekit.addKit=function(){Y.J.apply(Y,arguments)}}var Ja,$;Ja=new function(){this.la=this.Z=n};$=new va(new O(document));$.ra="cmt0hgn";$.N=new W("//use.typekit.com/k/cmt0hgn-{format}.css?3bb2a6e53c9684ffdc9a9eff135b2a62e364df7385cc768b6d1938c572ecabea630e39870da3f8d2ea9012552796a2a80009e4ccc1413303a4fbb36cb4855a8ea4352e35f86ac6792304c832a80d7b505dae597fd70cb6b686d94c00b1022b65c800427ea4ad75cccf37bad60b4a8cd8cfda9809b9ad49f749e9b7453b4307a9cfd0fec8f9daa5ed69735ce723a44357ca3eb5ee795c138d5573b6ba7d844c8210699ef917321b7cf38184c15be2d85a04ade7300af6ab62b01ea7897900504c54be9d2ea4fe09f1e8b8fdf08eda1f639e74d98382d36d985a288b6b6b81545ffcd9225466b80e19d846baddbf4fe453876951ca041826b85865f7fdb6bb6c4578f12b611aca60bcf6c7e545875ad7b5a7c5caed9310b3e1b81a95f7d00fc443d5981fe5dde77a3dc6c1ceb6775a941691486cde8f1df89891ae218af66c03c16e21d55390575f930f17e57099f8dcc2011fefd394270f740c5c55c63ab62cab8249c687d0e789f22b08424b54428f08312dfc13d974360803d8c3dfccc94f42aa0d54edce4197b879a96d062e484e049b0838485815d19af9d8e440f58388786434db40f6fda85b0c47d8fb7a725b8d425ef7e4e223c6d9f6a45399d09002a43f3b94f2bc890bc6204a7acc45bff4299816f19e77522c23faf8293444c8dea23464a1f163cd05bbd229b2b70d1c0e5cab1e2a");
$.V=Ja;$.n.push(new P("wordy-diva",["n5"]));$.n.push(new P("facitweb",["n2","n4","n6"]));$.F.push(new oa([".tk-wordy-diva"],[{name:"font-family",value:'"wordy-diva",cursive'}]));$.F.push(new oa([".tk-facitweb"],[{name:"font-family",value:'"facitweb",sans-serif'}]));$.K=ua;$.M=X;$.R=V;Z&&Z.ea.__webfonttypekitmodule__?(Z.J($),Z.load()):(wa($,(new A(navigator.userAgent,document)).parse()),window.Typekit.addKit($));
})(this,document);
window.Typekit.config={"p":"//p.typekit.net/p.gif?s=1&k=cmt0hgn&ht=tk&h={host}&f=816.6037.6041.6043&a=246807&_={_}"};
/*{"created":"2012-08-14T00:37:18Z","k":"1.0.1"}*/
;(function(window,document,undefined){
function e(a){this.a=a}e.prototype=function(a){this.a=a}.prototype;function f(a){var b=new Image(1,1);b.src=a;b.onload=function(){b.onload=null}}function g(){this.c=window.Typekit.config.p}function h(a,b,c){var d=c||{},a=a.c.replace(/\{\/?([^*}]*)(\*?)\}/g,function(a,b,c){return c&&d[b]?"/"+d[b].join("/"):d[b]||""});a.match(/^\/\//)&&(a=(b?"https:":"http:")+a);return a.replace(/\/*\?*($|\?)/,"$1")}window.Typekit||(window.Typekit={});var i=new e(document),j=new function(){this.b=new g},k=!1;
function l(){if(!k)for(var a=document.getElementsByTagName("link"),b=0;b<a.length;b++){var c=a[b].getAttribute("href");if(c&&0<=c.indexOf("use.typekit")){a=j;b=i;a.b&&(c=(c=window.__adobewebfontsappname__)?c.toString().substr(0,20):"",f(h(a.b,"https:"==b.a.location.protocol,{host:encodeURIComponent(b.a.location.hostname),app:encodeURIComponent(c),_:(+new Date).toString()})));k=!0;break}}}var m=window.Typekit.load;window.Typekit.load=function(){m&&m.apply(window.Typekit,arguments);l()};
window.__webfonttypekitmodule__&&l();
})(this,document);