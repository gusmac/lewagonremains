import $ from 'jquery'

$(function() {
  var subcategories;

  $('#buy_advert_subcategory_id').hide();
  subcategories = $('#buy_advert_subcategory_id').html();
  console.log($('#buy_advert_category_id'));
  $('#buy_advert_category_id').on('change', function() {
    console.log('hello');
    var category, escaped_category, options;
    category = $('#buy_advert_category_id :selected').text();
    escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(subcategories).filter("optgroup[label=" + escaped_category + "]").html();
    console.log(options);
    if (options) {
      $('#buy_advert_subcategory_id').html(options);
      return $('#buy_advert_subcategory_id').show();
    } else {
      $('#buy_advert_subcategory_id').empty();
      return $('#buy_advert_subcategory_id').hide();
    }
  });
});
