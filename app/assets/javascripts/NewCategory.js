window.addEventListener('DOMContentLoaded', function(){
  $("#category-form").on("change",function(){
    var parentValue = $(this).val();
    consol.log(parentValue)
    $.ajax({
      url: '/goods/search',
      type: "GET",
      data: {
        parent_id: parentValue 
      },
      dataType: 'json'
  })
  .done(function(categories) {
    $('.child').css('display', 'block');
    $('#child').empty();
    $('.grand_child').css('display', 'none');
    $('#child').append(buildPrompt);

    categories.forEach(function(cat) {
        var html_option = buildHtmlOption(cat);
        $('#child').append(html_option);
    });
})
.fail(function() {
});

  $("#category-form-child").on("change",function(){
    var childValue = document.getElementById("category-form").value;
  
})