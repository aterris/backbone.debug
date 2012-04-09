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
      view = new Backbone.View()
      view.trigger('test')
      expect(console.log).toHaveBeenCalled()
    
    it 'can hook router events', ->
      router = new Backbone.Router()
      router.navigate('test')
      #collection.trigger('reset')
      expect(console.log).toHaveBeenCalled()
  
  describe 'Hook Syncing', ->
    beforeEach ->
      console.log = jasmine.createSpy()
    
    it 'can hook Backbone.sync', ->
      expect(1).toEqual(2)
  
  describe 'Track Objects', ->
    it 'can save an object to _objects', ->
      expect(1).toEqual(2)
    
    it 'can track a new collection', ->
      expect(1).toEqual(2)
    
    it 'can track a new model', ->
      expect(1).toEqual(2)
    
    it 'can track a new view', ->
      expect(1).toEqual(2)
    
    it 'can track a new router', ->
      expect(1).toEqual(2)

  describe 'Query Objects', ->
    beforeEach ->
      console.log = jasmine.createSpy()
    
    it 'can return all collections', ->
      expect(1).toEqual(2)
    
    it 'can return all models', ->
      expect(1).toEqual(2)
    
    it 'can return all views', ->
      expect(1).toEqual(2)
    
    it 'can return all routers', ->
      expect(1).toEqual(2)
  
  describe 'Hooking Functionality', ->
    it 'can hook a top level Backbone function', ->
      expect(1).toEqual(2)
    
    it 'can hook a prototype Backbone function', ->
      expect(1).toEqual(2)
  
  describe 'console.log Functionality', ->
    beforeEach ->
      console.log = jasmine.createSpy()
    
    it 'can log an event', ->
      expect(1).toEqual(2)
    
    it 'can log a sync', ->
      expect(1).toEqual(2)
  
  describe 'Toggle Logging', ->
    beforeEach ->
      console.log = jasmine.createSpy()
    
    it 'can turn off logging', ->
      expect(1).toEqual(2)
    
    it 'can turn on logging', ->
      expect(1).toEqual(2)
    
    it 'can turn off logging for a single option', ->
      expect(1).toEqual(2)
    
    it 'can turn on logging for a single option', ->
      expect(1).toEqual(2)
