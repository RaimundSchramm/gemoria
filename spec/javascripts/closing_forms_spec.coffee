describe 'js for close button in forms', ->

  beforeEach ->
    loadFixtures 'form.html'

  describe "a form", ->
    it "should exist", ->
      a = true
      expect($('form')).toExist()
      expect($('form')).toBeInDom
      expect($('form button')).toHaveClass('close')
      expect($('form button')).toHaveId('close-button')

  describe 'removeParentForm', ->
    it 'removes the parent form of clicked close button', ->
      expect($('form')).toExist()
      removeParentForm($('button.close'))
      expect($('form')).not.toExist()
