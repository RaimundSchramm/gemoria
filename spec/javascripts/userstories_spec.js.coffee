describe 'js for userstories#show', ->
  beforeEach ->
    loadFixtures 'userstories_show.html'

  describe 'hideActionLink(node)', ->
    it 'hides any node (used in js templates for action links)', ->
      hideActionLink($('a#new_acceptance_test_link'))
      expect($('a#new_acceptance_test_link')).toBeHidden()

  describe 'showActionLinksExcept(node)', ->
    it 'makes all links on page visible except node', ->
      $('a').hide()
      expect($('a')).toBeHidden()
      showActionLinksExcept($('a#new_task_link'))
      expect($('a#new_acceptance_test_link')).toHaveCss({display: "block"})
      expect($('a#new_task_link')).toBeHidden()

  describe 'removeAjaxForms', ->
    it 'removes all open ajax forms in actions sections', ->
      $('section#tasks section.actions a').after('<form id="new_userstory1"></form>')
      $('section#tasks section.actions').after('<form id="new_userstory2"></form>')
      $('section#tasks').after('<form id="new_userstory3"></form>')
      removeAjaxForms()
      expect($('form#new_userstory1')).not.toExist()
      expect($('form#new_userstory2')).toExist()
      expect($('form#new_userstory3')).toExist()

  describe 'replace status section', ->
    it 'replaces the status and the action link via AJAX', ->
      status = '<section id="status" class="started"><a>Complete</a><hr/>started</section>'
      replaceStatusSection(status)
      expect($('section#status')).toHaveClass 'started'
      expect($('section#status a')).toHaveText 'Complete'
      expect($('section#status')).toHaveText /started/

  describe 'showItems', ->
    it 'displays any previously hidden item', ->
      $('div#acceptance_test_1').hide()
      expect($('section')).toExist()
      expect($('div#acceptance_test_1')).toBeHidden()
      showItems()
      expect($('div#acceptance_test_1')).toBeVisible()

describe 'renderAjaxForm(type, form)', ->
  it 'puts a form String into section#actions', ->
    loadFixtures 'userstories_index.html'
    expect($('form#new_userstory')).not.toExist()
    form = '<form id="new_userstory"></form>'
    type = 'userstories'
    renderAjaxForm(type, form)
    expect($('section#userstories section.actions form#new_userstory')).toExist()
