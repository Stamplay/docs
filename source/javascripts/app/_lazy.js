!function (window) {
    var images = document.querySelectorAll('img');
    for (var i = 0; i < images.length; i++) {
      var img = images[i];
      img.dataset.src = img.src;
      img.src = '';
    }

}(this);