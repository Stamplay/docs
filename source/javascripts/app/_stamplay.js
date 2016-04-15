//= require ../lib/_jquery
var app_id = window.location.search.split("&")[1] || 'APP-ID';

function setAppId() {
  app_id = window.location.search.split("&")[1] || 'APP-ID';
  var cbs = document.querySelectorAll("pre.highlight code");
  for(var i = 0; i < cbs.length; i += 1) {
    var html = cbs[i].innerHTML;
    cbs[i].innerHTML = html.replace("APP-ID", "<span style='color:#f92672; font-weight:bold'>" + app_id + "</span>")
  }
}

$(document).ready(function() {
  
  setAppId();
  if(app_id === "APP-ID") {
    setTimeout(function() {
      console.log(window.location.search.split("&"))
      setAppId();
    }, 3000)
  }
})