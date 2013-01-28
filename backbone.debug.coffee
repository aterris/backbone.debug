Backbone = window.Backbone

class Backbone.Debug
  constructor: () ->
    @_options =
      'log:events': true
      'log:sync': true
    
    @_objects =
      Collection: {}
      Model: {}
      View: {}
      Router: {}
      
    @_trackObjects()
    @_hookEvents()
    @_hookSync()

  ##### Object Accessors
  collections: =>
    @_objects.Collection
  
  models: =>
    @_objects.Model
  
  views: =>
    @_objects.View
  
  routers: =>
    @_objects.Router
  
  ##### Toggle Logging
  on: (option) =>
    if option?
      @_options[option] = true
    else
      @_options['log:events'] = true
      @_options['log:sync'] = true
  
  off: (option) =>
    if option?
      @_options[option] = false
    else
      @_options['log:events'] = false
      @_options['log:sync'] = false
  
  ##### Hook Object Creation
  _trackObjects: =>
    @_hookPrototype('Collection', 'constructor', @_saveObjects)
    @_hookPrototype('Model', 'constructor', @_saveObjects)
    @_hookPrototype('View', 'constructor', @_saveObjects)
    @_hookPrototype('Router', 'constructor', @_saveObjects)
  
  ##### Hook Events
  _hookEvents: =>
    @_hookPrototype('Collection', 'trigger', @_logEvent)
    @_hookPrototype('Model', 'trigger', @_logEvent)
    @_hookPrototype('View', 'trigger', @_logEvent)
    @_hookPrototype('Router', 'trigger', @_logEvent)

  ##### Hook Sync
  _hookSync: =>
    @_hookMethod('sync', @_logSync)
  
  _saveObjects: (type, method, object) =>
    @_objects[type][object.constructor.name + ':' + object.cid] = object
  
   ##### Console Log Wrappers
  _logEvent: (parent_object, method, object, args) =>
    console.log "#{args[0]} - ", object if @_options['log:events']
  
  _logSync: (method, object, args) =>
    console.log "sync - #{args[0]}", args[1] unless @_options['log:sync'] != true
  
  ##### Hook Backbone Method
  _hookMethod: (method, action) =>
    original = Backbone[method]

    Backbone[method] = ->
      ret = original.apply(this, arguments)
      action(method, this, arguments)
      ret

  ##### Hook Backbone Prototype Method
  _hookPrototype: (object, method, action) =>
    original = Backbone[object].prototype[method]

    Backbone[object].prototype[method] = ->
      ret = original.apply(this, arguments)
      action(object, method, this, arguments)
      ret

##### Initialize
Backbone.debug = new Backbone.Debug()
