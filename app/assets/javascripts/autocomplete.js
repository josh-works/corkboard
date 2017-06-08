
$(document).ready(function(){
  $( function() {
    $(".search-form").autocomplete({
      source: function( request, response ) {
         $.ajax({
          url: "/api/v1/autocomplete",
          method: "GET",
          dataType: "json",
          data: { q: request.term },
          success: function(data) {
            response( data);}
        })
      },
      minLength: 1,
      focus: function( event, ui ) {
      $(this).val(ui.item.label);
      return false;
      },
      select: function( event, ui ) {
      $(this).val(ui.item.label);
      return false;
    },
      select: function( event, ui ) {
            window.location.href = ui.item.value;
        },
    });
  } );
})
