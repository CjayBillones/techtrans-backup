!function(){if(jQuery&&jQuery.fn&&jQuery.fn.select2&&jQuery.fn.select2.amd)var n=jQuery.fn.select2.amd;return n.define("select2/i18n/lt",[],function(){function n(n,e,i,t){return n%10===1&&(11>n%100||n%100>19)?e:n%10>=2&&9>=n%10&&(11>n%100||n%100>19)?i:t}return{inputTooLong:function(e){var i=e.input.length-e.maximum,t="Pa\u0161alinkite "+i+" simbol";return t+=n(i,"\u012f","ius","i\u0173")},inputTooShort:function(e){var i=e.minimum-e.input.length,t="\u012era\u0161ykite dar "+i+" simbol";return t+=n(i,"\u012f","ius","i\u0173")},loadingMore:function(){return"Kraunama daugiau rezultat\u0173\u2026"},maximumSelected:function(e){var i="J\u016bs galite pasirinkti tik "+e.maximum+" element";return i+=n(e.maximum,"\u0105","us","\u0173")},noResults:function(){return"Atitikmen\u0173 nerasta"},searching:function(){return"Ie\u0161koma\u2026"}}}),{define:n.define,require:n.require}}();