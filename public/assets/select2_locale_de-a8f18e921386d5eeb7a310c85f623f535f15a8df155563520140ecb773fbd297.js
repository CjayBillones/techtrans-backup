!function(){if(jQuery&&jQuery.fn&&jQuery.fn.select2&&jQuery.fn.select2.amd)var e=jQuery.fn.select2.amd;return e.define("select2/i18n/de",[],function(){return{inputTooLong:function(e){var n=e.input.length-e.maximum;return"Bitte "+n+" Zeichen weniger eingeben"},inputTooShort:function(e){var n=e.minimum-e.input.length;return"Bitte "+n+" Zeichen mehr eingeben"},loadingMore:function(){return"Lade mehr Ergebnisse\u2026"},maximumSelected:function(e){var n="Sie k\xf6nnen nur "+e.maximum+" Eintr";return n+=1===e.maximum?"ag":"\xe4ge",n+=" ausw\xe4hlen"},noResults:function(){return"Keine \xdcbereinstimmungen gefunden"},searching:function(){return"Suche\u2026"}}}),{define:e.define,require:e.require}}();