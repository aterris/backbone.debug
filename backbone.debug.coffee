class window.Backbone.Debug
  constructor: (options={}) ->
    @options = options
    @_objects ||= {Collection: {}, Model: {}, View: {}, Router: {}}
    @_trackObjects()
    @_hookEvents()
    @_hookSync()

  ##### Object Accessors
  collections: =>
    @_objects.Collections
  
  models: =>
    @_objects.Model
  
  views: =>
    @_objects.View
  
  routers: =>
    @_objects.Router
  
  ##### Toggle Logging
  on: (option) =>
    true
  
  off: (option)=>
    true
  
  ##### Relevant Version Info
  info:
    'Backbone.debug': '0.1.0'
    'Backbone': window.Backbone.VERSION
    'Underscore': window._.VERSION
  
  ##### Console Log Wrappers
  _logObj: (obj) =>
    console.log obj, _.keys(obj._callbacks)
  
  _logEvent: (obj, event) =>
    console.log @last_obj, obj, 'obj', @last_obj == obj
     
  _logSync: (obj, method, model, options) =>
    console.log "Sync - #{method}", obj
  
  ##### Hook Backbone.sync
  _hookSync: =>
    @_hookMethod('sync', @_logSync)
  
  ##### Hook Backbone Events
  _hookEvents: =>
    @_hookPrototype('Collection', 'trigger', @_logEvent)
    @_hookPrototype('Model', 'trigger', @_logEvent)
    @_hookPrototype('View', 'trigger', @_logEvent)
    @_hookPrototype('Router', 'trigger', @_logEvent)

  _saveObjects: (type, method, object) =>
    @_objects[type][object.constructor.name + ':' + object.cid] = object
  
  ##### Track Object Creation
  _trackObjects: =>
    @_hookPrototype('Model', 'constructor', @_saveObjects)
  
  # Hook Backbone Method
  _hookMethod: (method, action) =>
    original = window.Backbone[method]

    window.Backbone[method] = ->
      original.apply(this, arguments)
      action(method, this, arguments)

  # Hook Backbone Prototye Method
  _hookPrototype: (object, method, action) =>
    original = window.Backbone[object].prototype[method]

    window.Backbone[object].prototype[method] = ->
      original.apply(this, arguments)
      action(object, method, this, arguments)

# Initialize Backbone.debug
window.Backbone.debug = new Backbone.Debug()
