window.addEventListener('DOMContentLoaded', function(){
  $("#category-form").on("change",function(){
    var parentValue = document.getElementById("category-form").value;
    $.ajax({
      url: '/goods/search',
      type: "GET",
      data: {
        parent_id: parentValue 
      },
      dataType: 'json'
  })
  $("#category-form-child").on("change",function(){
    var childValue = document.getElementById("category-form").value;
  
})