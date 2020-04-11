$(function() {
  var buildPrompt = `<option value>---</option>`
  var buildHtmlOption = function(cat) {
      var option = `<option value ="${cat.id}">${cat.name}</option>`
      return option
  }
  $('#parent').change(function() {
    var parent_id = $(this).val();
    console.log(location.href);
    $.ajax({
      type: 'GET',
      url: '/api/child',
      data: {id: parent_id},
      dataType: 'json'
    })
    .done(function(category) {
      $('.child').css('display', 'block');
      $('#child').empty();
      $('.grand_child').css('display', 'none');
      $('#child').append(buildPrompt);

      category.forEach(function(cat) {
        var html_option = buildHtmlOption(cat);
        $('#child').append(html_option);
      });
    })
    .fail(function(XMLHttpRequest, textStatus, errorThrown){
      console.log(XMLHttpRequest.status);
      console.log(textStatus);
      console.log(errorThrown);
    })
  });
  $(this).on("change", "#child", function() {
    var child_id = $("#child").val();
    $.ajax({
      type: 'GET',
      url: '/api/grand_child',
      data: {id: child_id},
      dataType: 'json'
    })
    .done(function(category) {
      console.log("成功");
      $('.grand_child').css('display', 'block');
      $('#grand_child').empty();
      $('#grand_child').append(buildPrompt);
      category.forEach(function(cat) {
        var html_option = buildHtmlOption(cat);
        $('#grand_child').append(html_option);
      });
    })
    .fail(function() {
    })
  });
});