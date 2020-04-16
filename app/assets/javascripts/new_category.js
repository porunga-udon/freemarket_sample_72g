$(function() {
  var child_id = $('#child');
  var grand_child_id = $('#grand_child');
  var buildPrompt = `<option value>選択してください</option>`
  var buildHtmlOption = function(cat) {
    var option = `<option value ="${cat.id}">${cat.name}</option>`
    return option
  }
  //新規投稿
  if($(`#good_images_attributes_0__destroy`).length == 0) {
    $('#parent').change(function() {
      var parent_id = $(this).val();
      $.ajax({
        type: 'GET',
        url: '/api/child',
        data: {id: parent_id},
        dataType: 'json'
      })
      .done(function(category) {
        $('.child').css('display', 'block');
        child_id.empty();
        $('.grand_child').css('display', 'none');
        child_id.append(buildPrompt);

        category.forEach(function(cat) {
          var html_option = buildHtmlOption(cat);
          child_id.append(html_option);
        });
      })
      .fail(function(){
        alert('error');
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
        $('.grand_child').css('display', 'block');
        grand_child_id.empty();
        grand_child_id.append(buildPrompt);
        category.forEach(function(cat) {
          var html_option = buildHtmlOption(cat);
          grand_child_id.append(html_option);
        });
      })
      .fail(function() {
        alert('error');
      })
    });


    //編集
  }else{
    $(document).ready(function() {
      var parent_name = $('#parent').attr('name').replace(/[^0-9]/g, '');
      var child_name = $('#child').attr('name').replace(/[^0-9]/g, '');
      var grandchild_name = $('.grand_child_select').attr('name').replace(/[^0-9]/g, '');
      $('#parent').val(`${parent_name}`);
      $.ajax({
        type: 'GET',
        url: '/api/child',
        data: {id: $('#parent').val()},
        dataType: 'json'
      })
      .done(function(category) {
        $('.child').css('display', 'block');
        child_id.empty();
        child_id.append(buildPrompt);
        category.forEach(function(cat) {
          var html_option = buildHtmlOption(cat);
          child_id.append(html_option);
        });
        $('#child').val(`${child_name}`);
        //孫フォーム
        $.ajax({
          type: 'GET',
          url: '/api/grand_child',
          data: {id: $("#child").val()},
          dataType: 'json'
        })
        .done(function(category) {
          $('.grand_child').css('display', 'block');
          grand_child_id.empty();
          grand_child_id.append(buildPrompt);
          category.forEach(function(cat) {
            var html_option = buildHtmlOption(cat);
            grand_child_id.append(html_option);
          });
          $('#grand_child').val(grandchild_name);
        })  
      })
    });


    //カテゴリ記入
    $('#parent').change(function() {
      var parent_id = $(this).val();
      $.ajax({
        type: 'GET',
        url: '/api/child',
        data: {id: parent_id},
        dataType: 'json'
      })
      .done(function(category) {
        $('.child').css('display', 'block');
        child_id.empty();
        $('.grand_child').css('display', 'none');
        child_id.append(buildPrompt);
        category.forEach(function(cat) {
          var html_option = buildHtmlOption(cat);
          child_id.append(html_option);
        });
      })
      .fail(function(){
        alert('error');
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
        $('.grand_child').css('display', 'block');
        grand_child_id.empty();
        grand_child_id.append(buildPrompt);
        category.forEach(function(cat) {
          var html_option = buildHtmlOption(cat);
          grand_child_id.append(html_option);
        });
      })
      .fail(function() {
        alert('error');
      })
    });
  }
});