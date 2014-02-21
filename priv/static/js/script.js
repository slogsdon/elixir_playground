(function (window, document, $, undefined) {
  $(document).ready(function () {
    // Bind to StateChange Event
    History.Adapter.bind(window,'statechange',function(){ // Note: We are using statechange instead of popstate
        var State = History.getState(); // Note: We are using History.getState() instead of event.state
    });

    $('.snippet-form-action').unbind('click').click(function (e) {
      var href = $(this).attr('href');
      e.preventDefault();

      $.ajax({
        type: "POST",
        url: href,
        data: {
          snippet: $('textarea[name="snippet"]').val()
        },
        success: function (data) {
          var $result = $('textarea[name="result"]');

          if (data.status === "error") {
            $result.css('color', 'red');
          } else if (data.status === "redirect") {
            History.pushState(null, document.title, data.location); 
            return;
          } else {
            $result.css('color', 'black');
          }

          $result.val(data.result);
        }
      });
    });

  });
})(window, document, jQuery);