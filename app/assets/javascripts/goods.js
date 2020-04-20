$(document).on('turbolinks:load', function(){
  $(function(){
    var label_box = $('.label-box')
    var label_content = $('.label-content')
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    if (window.location.href.match(/\/goods\/\d+\/edit/)){
      var prevContent = label_content.prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      label_content.css('width', labelWidth);
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
      if (count == 4) {
        label_content.hide();
      }
    }

    function setLabel() {
      var prevContent = label_content.prev();
      labelWidth = (520 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      label_content.css('width', labelWidth);
    }

    $(document).on('change', '.hidden-field', function() {
      setLabel();
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      label_box.attr({id: `label-box--${id}`,for: `good_images_attributes_${id}_image`});
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function() {
        var image = this.result;
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          var prevContent = label_content.prev();
          $(prevContent).append(html);
        }
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        if (count == 4) { 
          label_content.hide();
        }

        if ($(`#good_images_attributes_${id}__destroy`)){
          $(`#good_images_attributes_${id}__destroy`).prop('checked',false);
        } 

        setLabel();
        if(count < 4){
          label_box.attr({id: `label-box--${count}`,for: `good_images_attributes_${count}_image`});
        }
      }
    });
    
    $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      setLabel(count);
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();
      $('.hidden-checkbox').each(function(index, box){
        $(box).attr('id', `good_images_attributes_${index}__destroy`);
      })
      $('.hidden-field').each(function(index, box){
        $(box).attr('id', `good_images_attributes_${index}_image`);
      })
      //出品画面
      if ($(`#good_images_attributes_${id}__destroy`).length == 0) {
        $(`#good_images_attributes_${id}_image`).val("");
        var count = $('.preview-box').length;
        if (count == 4) {
          label_content.show();
        }
        setLabel(count);
        if(id < 4){
          label_box.attr({id: `label-box--${id}`,for: `good_images_attributes_${id}_image`});
        }

      //編集画面
      } else {
        $(`#good_images_attributes_${id}__destroy`).prop('checked',true);
        var checkbox = $("input[type=checkbox]:not(:checked)").size() == 0 ;
        if (count == 4) {
          label_content.show();
        }
        setLabel();
        if(id < 4){
          label_box.attr({id: `label-box--${id}`,for: `good_images_attributes_${id}_image`});
        }
      }    
    });
  });
});
