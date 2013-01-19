describe 'js for close button in forms', ->
  beforeEach ->
    loadFixtures 'form'

  describe "removeParentForm", ->
    it "removes parent on click", ->
      $('button.close').closeFormAndReactivateActions()
      spyEvent = spyOnEvent('button', 'click')
      $('button').click()
      expect('click').toHaveBeenTriggeredOn('button')
      expect(spyEvent).toHaveBeenTriggered()
      expect($('form')).not.toExist()

  describe 'removeParentForm', ->
    it 'removes the parent form of clicked close button', ->
      node = $('button.close')
      removeParentForm(node)
      expect($('form')).not.toExist()

describe 'js for userstories#show', ->
  beforeEach ->
    loadFixtures 'userstories_show'

  describe 'showAllActionsSections', ->
    it 'shows all action sections', ->
      $('section.actions').hide()
      expect($('section.actions')).toBeHidden()
      showAllActionsSections()

  describe 'removeAjaxForms', ->
    it 'removes all open ajax forms in actions sections', ->
      $('section#tasks section.actions a').after('<form id="new_userstory1"></form>')
      $('section#tasks section.actions').after('<form id="new_userstory2"></form>')
      $('section#tasks').after('<form id="new_userstory3"></form>')
      removeAjaxForms()
      expect($('form#new_userstory1')).not.toExist()
      expect($('form#new_userstory2')).toExist()
      expect($('form#new_userstory3')).toExist()

  describe 'hideActionLink(node)', ->
    it 'hides any node (used in js templates for action links)', ->
      loadFixtures 'userstories_show'
      hideActionLink($('a#new_acceptance_test_link'))
      expect($('a#new_acceptance_test_link')).toBeHidden()

  describe 'showActionLinksExcept(node)', ->
    it 'makes all links on page visible except node', ->
      $('a').hide()
      expect($('a')).toBeHidden()
      showActionLinksExcept($('a#new_task_link'))
      expect($('a#new_acceptance_test_link')).toHaveCss({display: "inline"})

describe 'renderAjaxForm(type, form)', ->
  it 'puts a form String into section#actions', ->
    loadFixtures 'userstories_index'
    expect($('form#new_userstory')).not.toExist()
    form = '<form id="new_userstory"></form>'
    type = 'userstories'
    renderAjaxForm(type, form)
    expect($('form#new_userstory')).toExist()

describe 'replace status section', ->
  xit 'replaces the status and the action link via AJAX', ->
    loadFixtures 'userstories_show'
    replaceStatusSection()
    expect($())
