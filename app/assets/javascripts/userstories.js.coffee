## Place all the behaviors and hooks related to the matching controller here.
## All this logic will automatically be available in application.js.
## You can use CoffeeScript in this file: http:#jashkenas.github.com/coffee-script/

# activateCloseButton()
# $('button.close').closeAForm()
$.fn.closeFormAndReactivateActions = ->
  this.click ->
    removeParentForm($(this))
    showActionLinksExcept()

# $('section.actions a').show();
@showActionLinksExcept = (node) ->
  $('section.actions a').not(node).show()

@showAllActionsSections = ->
  $('section.actions').show()

@removeParentForm = (node) ->
  node.parent().remove()

# $('section.actions form').remove();
@removeAjaxForms = ->
  $('section.actions form').remove()

@renderAjaxForm = (type, form_from_server) ->
  $("section##{type} section.actions a").after(form_from_server)

@hideActionLink = (node) ->
  node.hide()
