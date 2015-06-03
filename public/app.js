;(function() {
  var method = 'GET',
      url = '/members.json',
      async = true,
      process,
      html,
      node;

  process = function(request) {
    members = JSON.parse(request.responseText);
    html = '';
    html += '<ul class="members list--horz list--bare">';
    members.forEach(function(member) {
      html += '<li class="member align--center">' +
        '<div class="member__image" style="background-image: url(' + member.image_uri + ')"></div>' +
        '<div class="member__name">' + member.first_name + ' ' + member.last_name +'</div>' +
        '</li>';
    });
    html += "</ul>";
    node = document.querySelector('[data-js="members"]');
    node.innerHTML = html;
  };

  window.setInterval(function() {
    var request = new XMLHttpRequest();

    if (request.withCredentials != null) {
      request.open(method, url, async);
      request.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
      request.onreadystatechange = function() {
        if (request.readyState === 4 && request.status === 200) {
          return process(request);
        }
      };
    } else if (typeof XDomainRequest !== "undefined" && XDomainRequest != null) {
      request = new XDomainRequest();
      request.open(method, url);
      request.onload = function() {
        return process(request);
      };
    }

    request.send();
  }, 1000);
})();
