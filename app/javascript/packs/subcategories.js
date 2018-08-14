import $ from 'jquery'

$(function() {
  var subcategories;

  $('#sell_advert_subcategory_id').hide();
  subcategories = $('#sell_advert_subcategory_id').html();
  console.log($('#sell_advert_category_id'));
  $('#sell_advert_category_id').on('change', function() {
    console.log('hello');
    var category, escaped_category, options;
    category = $('#sell_advert_category_id :selected').text();
    escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(subcategories).filter("optgroup[label=" + escaped_category + "]").html();
    console.log(options);
    if (options) {
      $('#sell_advert_subcategory_id').html(options);
      return $('#sell_advert_subcategory_id').show();
    } else {
      $('#sell_advert_subcategory_id').empty();
      return $('#sell_advert_subcategory_id').hide();
    }
  });
});
