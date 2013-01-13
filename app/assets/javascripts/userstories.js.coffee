## Place all the behaviors and hooks related to the matching controller here.
## All this logic will automatically be available in application.js.
## You can use CoffeeScript in this file: http:#jashkenas.github.com/coffee-script/

# activateCloseButton()
# $('button.close').closeAForm()
$.fn.closeFormAndReactivateActions = ->
  this.click ->
    removeParentForm($(this))
    showAllOtherActionLinks()

# $('section.actions a').show();
@showAllOtherActionLinks = (node) ->
  $('section.actions a').not(node).show()

@showAllActionsSections = ->
  $('section.actions').show()

@removeParentForm = (node) ->
  node.parent().remove()

# $('section.actions form').remove();
@removeAjaxForms = ->
  $('section.actions form').remove()

@renderAjaxFormInActionsSection = (node, form) ->
  node.after(form)

@hideLinkWithId = (id) ->
  $("a##{id}").hide()
