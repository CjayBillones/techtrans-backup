(function(){$(document).ready(function(){$("#article_tag_list").tokenInput("/tags.json",{crossDomain:!1,tokenValue:"name",preventDuplicates:!0,allowFreeTagging:!0,onFreeTaggingAdd:!0,prePopulate:$("#ip_offer_tag_list").data("pre"),theme:"facebook"})})}).call(this);