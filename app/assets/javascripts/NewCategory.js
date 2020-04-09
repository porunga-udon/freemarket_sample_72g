window.addEventListener('DOMContentLoaded', function(){
  var buildHtmlOption = function(cat) {
    var option = `<option value ="${cat.id}">${cat.name}</option>`
    return option
  }

  $("#category-form").on("change",function(){
    var parentValue = $(this).val();
    console.log(parentValue);
    $.ajax({
      url: '/goods/search',
      type: "GET",
      data: {
        parent_id: parentValue 
      },
      dataType: 'json'
    })
      .done(function(categories) {
          $('.category-form-child').css('display', 'block');
          $('#category-form-child').empty();
          $('.grand_child').css('display', 'none');
          $('#child').append(buildPrompt);

          categories.forEach(function(cat) {
              var html_option = buildHtmlOption(cat);
              $('#child').append(html_option);
          });
        })
        .fail(function() {
        })
  });
  $("#category-form-child").on("change",function(){
    var childValue = document.getElementById("category-form").value;
  });
});