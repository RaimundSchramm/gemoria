//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery.fn.closeAnyForm = function() {
  this.click(function() {
    $('#acceptance_tests form, section#tasks section.actions form').remove();
  });
}

$(function() {
  $('a').closeAnyForm();
});
