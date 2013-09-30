var NM = (function() {

    var self = this
      , news = '#news'
      , urls = []
      , items = {};

    var init = function(url) {
        getData(url);
    };

    var getData = function(url) {
        $.getJSON(url, function(data) {
            items = data.value.items;
            createSnippet();
        });
    };

    var createSnippet = function() {
        $.each(items, function(i, value) {
            urls.push(value.link);
            $('<article id="'+i+'"><div class="snippet"><h2>'
            + value.title
            + '</h2><p>'
            + value.description
            + '</p><a>www'
            + value.link.match(/\..*\.(de|com|net|org)/).toString().replace(/\,(de|com|net|org)/,'')
            + '</a></div></article>').appendTo(self.news);
            NM.getUrl(i);
        });
    };

    var getUrl = function(i) {
        $(self.news).on('click', '#'+i, function() {
            if(navigator.userAgent.match(/iPhone/i)) {
                window.location = 'objc://showUrl/' + urls[i];
            } else {
                window.location = 'http://' + urls[i];
            }
        });
    };

    return {
        init: init,
        getUrl: getUrl
    };

})();

var newspipes = 'http://pipes.yahoo.com/pipes/pipe.run?_id=3248c0b78ea8eb37e969bde1c91cf863&_render=json';
$(document).ready(NM.init(newspipes));