// Since we are basically scanning the DOM and attaching events I don't want to mix this in with
// the asset pipeline so it runs on *every* page. Open to debate, but feeling that this is the safest place.

$(document).ready(function(){
  // Using jQuery delegated events here
  $('.pagination').on('click', '.page-number', function() {
    $('#page').val(this.innerText);
    $('#filter-controls').submit();
  });
  // Only stars, forks, and updated are sortable
  $('.stars-heading').on('click', function(){
    $('#sort_by').val('stars');
    $('#filter-controls').submit();
  });
  $('.forks-heading').on('click', function(){
    $('#sort_by').val('forks');
    $('#filter-controls').submit();
  });
  $('.updated-at').on('click', function(){
    $('#sort_by').val('updated');
    $('#filter-controls').submit();
  });
});
