describe 'Backbone.debug', ->
  describe 'Hook Events', ->
    beforeEach ->
      console.log = jasmine.createSpy()
    
    it 'can hook collections events', ->
      collection = new Backbone.Collection()
      collection.trigger('reset')
      expect(console.log).toHaveBeenCalled()
    
    it 'can hook model events', ->
      model = new Backbone.Model()
      model.trigger('change')
      expect(console.log).toHaveBeenCalled()
    
    it 'can hook view events', ->
      #view = new Backbone.View
      #view.trigger('test')
      #expect(console.log).toHaveBeenCalled()
    
    it 'can hook router events', ->
      router = new Backbone.Router()
      #router.navigate('test')
      #expect(console.log).toHaveBeenCalled()
  
  describe 'Hook Syncing', ->
    beforeEach ->
      console.log = jasmine.createSpy()
    
    it 'can hook Backbone.sync', ->
  
  describe 'Track Objects', ->
    it 'can save an object to _objects', ->
    
    it 'can track a new collection', ->
    
    it 'can track a new model', ->
    
    it 'can track a new view', ->
    
    it 'can track a new router', ->

  describe 'Query Objects', ->
    beforeEach ->
      console.log = jasmine.createSpy()
    
    it 'can return all collections', ->
    
    it 'can return all models', ->
    
    it 'can return all views', ->
    
    it 'can return all routers', ->
  
  describe 'Hooking Functionality', ->
    it 'can hook a top level Backbone function', ->
    
    it 'can hook a prototype Backbone function', ->
  
  describe 'console.log Functionality', ->
    beforeEach ->
      console.log = jasmine.createSpy()
    
    it 'can log an event', ->
    
    it 'can log a sync', ->
  
  describe 'Toggle Logging', ->
    beforeEach ->
      console.log = jasmine.createSpy()
    
    it 'can turn off logging', ->
    
    it 'can turn on logging', ->
    
    it 'can turn off logging for a single option', ->
    
    it 'can turn on logging for a single option', ->
