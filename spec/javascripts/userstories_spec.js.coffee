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

  describe 'showAllOtherActionLinks', ->
    it 'makes all links on page visible', ->
      $('a').hide()
      expect($('a')).toBeHidden()
      showAllOtherActionLinks($('a#new_task_link'))
      expect($('a#new_acceptance_test_link')).toHaveCss({display: "inline"})

  describe 'showAllActionsSections', ->
    it 'shows all action sections', ->
      $('section.actions').hide()
      expect($('section.actions')).toBeHidden()
      showAllActionsSections()

  describe 'removeAjaxForms', ->
    it 'removes all open ajax forms in actions sections', ->
      $('section#tasks section.actions a').after('<form id="new_userstory"></form>')
      removeAjaxForms()
      expect($('form')).not.toExist()

  describe 'hideLinkWithId(id)', ->
    it 'hides the new link with the passed id', ->
      loadFixtures 'userstories_show'
      hideLinkWithId('new_acceptance_test_link')
      expect($('a#new_acceptance_test_link')).toBeHidden()

describe 'rendersAjaxFormInActionsSection', ->
  it 'puts a form String into section#actions', ->
    loadFixtures 'userstories_index'
    expect($('form#new_userstory')).not.toExist()
    form = '<form id="new_userstory"></form>'
    node = $('section section.actions')
    renderAjaxFormInActionsSection(node, form)
    expect($('form#new_userstory')).toExist()

describe 'replace status section', ->
  xit 'replaces the status and the action link via AJAX', ->
    loadFixtures 'userstories_show'
    replaceStatusSection()
    expect($())
