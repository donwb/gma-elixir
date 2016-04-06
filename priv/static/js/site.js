$(document).ready(function(){
  
  $.getJSON('/data', function(json){
    var headerSource = $("#header-template").html();
    var footerSource = $('#footer-template').html();
    var homesSource = $('#homes-template').html();

    var headerTemplate = Handlebars.compile(headerSource);
    var footerTemplate = Handlebars.compile(footerSource);

    $('#header').html(headerTemplate(json));
    $('#footer').html(footerTemplate(json));

    $.getJSON('/homes', function(h){
      var homes = {homes:h}
      
      var homesTemplate = Handlebars.compile(homesSource);
      $('#homes').html(homesTemplate(homes));
    })
  });
  
  
});

Handlebars.registerHelper('grouped_each', function(every, context, options){
  var out = "", subcontext = [], i;
  if (context && context.length > 0) {
    
      for (i = 0; i < context.length; i++) {
          if (i > 0 && i % every === 0) {
              out += options.fn(subcontext);
              subcontext = [];
          }
          subcontext.push(context[i]);
      }
      
      out += options.fn(subcontext);
  }
  
  return out;
})
