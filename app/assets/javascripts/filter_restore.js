const filterRestore = function filterRestoreUrl() {
  var str = document.getElementById('url_params').value;
  if (str) {
    var updated_url = location.pathname + '?' + encodeURI(str);
    var page = location.search.match(/page=\d+/);
    if (page) {
      updated_url += '&' + page;
    }
    history.replaceState({}, document.title, updated_url);
  }
};

document.onreadystatechange = function() {
  if (document.readyState === 'interactive') {
    filterRestore();
  }
};
