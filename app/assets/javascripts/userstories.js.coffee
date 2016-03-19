## Place all the behaviors and hooks related to the matching controller here.
## All this logic will automatically be available in application.js.
## You can use CoffeeScript in this file: http:#jashkenas.github.com/coffee-script/

$.fn.closeFormAndReactivateActions = ->
  this.on 'click', ->
    removeParentForm($(this))
    showActionLinksExcept()
    showItems()
  this

@hideActionLink = (node) ->
  node.hide()

@showActionLinksExcept = (node) ->
  $('section.actions a').not(node).show()

@removeAjaxForms = ->
  $('section.actions form').remove()

@renderAjaxForm = (type, form_from_server) ->
  $("section##{type} section.actions").append(form_from_server)

@removeParentForm = (node) ->
  node.parent('form').remove()

@replaceStatusSection = (partial) ->
  $('section#status').replaceWith(partial)

@showItems = ->
  $('.acceptance_test, .task').show()
