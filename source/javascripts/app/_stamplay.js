//= require ../lib/_jquery
var app_id = window.location.search.split("&")[1] || "APP-ID";

$(document).ready(function() {
  var cbs = document.querySelectorAll("pre.highlight code")
  for(var i = 0; i < cbs.length; i += 1) {
    var html = cbs[i].innerHTML;
    cbs[i].innerHTML = html.replace("APP-ID", "<span style='color:#f92672; font-weight:bold'>" + app_id + "</span>")
  }
  console.log(cbs)
}, 1000)