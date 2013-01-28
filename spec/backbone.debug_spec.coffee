class CoffeeModel extends Backbone.Model
class CoffeeCollection extends Backbone.Collection
class CoffeeView extends Backbone.View
class CoffeeRouter extends Backbone.Router

ExtendedModel = Backbone.Model.extend()
ExtendedCollection = Backbone.Collection.extend()
ExtendedView = Backbone.View.extend()
ExtendedRouter = Backbone.Router.extend()

describe 'Backbone.debug', ->
  describe 'Hook Events', ->
    beforeEach ->
      Backbone.debug.off().on('log:events')
      spyOn(console, 'log')
    
    it 'can hook collections events', ->
      collection = new Backbone.Collection()
      collection.trigger('reset')
      expect(console.log).toHaveBeenCalled()
    
    it 'can hook model events', ->
      model = new Backbone.Model()
      model.trigger('change')
      expect(console.log).toHaveBeenCalled()
    
    it 'can hook view events', ->
      view = new Backbone.View
      view.trigger('test')
      expect(console.log).toHaveBeenCalled()
    
    it 'can hook router events', ->
      router = new Backbone.Router()
      router.trigger('test')
      expect(console.log).toHaveBeenCalled()
  
  describe 'Hook Syncing', ->
    beforeEach ->
      Backbone.debug.off().on('log:sync')
      spyOn(console, 'log')
      @collection_mock = {url: 'example', trigger: ->}
    
    it 'can hook Backbone.sync', ->
      # TODO mock AJAX request with sinonjs
      Backbone.sync('read', @collection_mock)
      expect(console.log).toHaveBeenCalled()
  
  describe 'Track Objects', ->
    beforeEach ->
      Backbone.debug.off().on('log:instances')
      @console = spyOn(console, 'log')

    it 'can save model instances to _objects', ->
      models = _.size(Backbone.debug._objects.Model)
      new CoffeeModel()
      new ExtendedModel()
      expect(_.size(Backbone.debug._objects.Model)).toEqual(models + 2)

    it 'can save collection instances to _objects', ->
      collections = _.size(Backbone.debug._objects.Collection)
      new CoffeeCollection()
      new ExtendedCollection()
      expect(_.size(Backbone.debug._objects.Collection)).toEqual(collections + 2)

    it 'can save view instances to _objects', ->
      views = _.size(Backbone.debug._objects.View)
      new CoffeeView()
      new ExtendedView()
      expect(_.size(Backbone.debug._objects.View)).toEqual(views + 2)

    it 'can save router instances to _objects', ->
      routers = _.size(Backbone.debug._objects.Router)
      new CoffeeRouter()
      new ExtendedRouter()
      expect(_.size(Backbone.debug._objects.Router)).toEqual(routers + 2)
    
    it 'can track a new collection', ->
      new CoffeeCollection()
      new ExtendedCollection()
      expect(@console.callCount).toEqual(2)
    
    it 'can track a new model', ->
      new CoffeeModel()
      new ExtendedModel()
      expect(@console.callCount).toEqual(2)
    
    it 'can track a new view', ->
      new CoffeeView()
      new ExtendedView()
      expect(@console.callCount).toEqual(2)
    
    it 'can track a new router', ->
      new CoffeeRouter()
      new ExtendedRouter()
      expect(@console.callCount).toEqual(2)

  describe 'Query Objects', ->
    beforeEach ->
      spyOn(console, 'log')
    
    it 'can return all collections', ->
    
    it 'can return all models', ->
    
    it 'can return all views', ->
    
    it 'can return all routers', ->
  
  describe 'Hooking Functionality', ->
    it 'can hook a top level Backbone function', ->
    
    it 'can hook a prototype Backbone function', ->
  
  describe 'console.log Functionality', ->
    beforeEach ->
      spyOn(console, 'log')
    
    it 'can log an event', ->
    
    it 'can log a sync', ->
  
  describe 'Toggle Logging', ->
    beforeEach ->
      spyOn(console, 'log')
    
    it 'can turn off logging', ->
    
    it 'can turn on logging', ->
    
    it 'can turn off logging for a single option', ->
    
    it 'can turn on logging for a single option', ->
