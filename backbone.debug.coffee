class window.Backbone.Debug
  constructor: (options={}) ->
    @options = options
    @_objects ||= {Collection: {}, Model: {}, View: {}, Router: {}}
    @_trackObjects()
    @_hookEvents()
    @_hookSync()

  collections: =>
    @_objects.Collections
  
  models: =>
    @_objects.Model
  
  views: =>
    @_objects.View
  
  routers: =>
    @_objects.Router
  
  on: =>
    true
  
  off: =>
    true
  
  info:
    'Backbone.debug': '0.1.0'
    'Backbone': window.Backbone.VERSION
    'Underscore': window._.VERSION
  
  
  _logObj: (obj) =>
    console.log obj, _.keys(obj._callbacks)
  
  _logEvent: (obj, event) =>
    console.log @last_obj, obj, 'obj', @last_obj == obj
     
  _logSync: (obj, method, model, options) =>
    console.log "Sync - #{method}", obj
  
  _hookSync: =>
    @_hookMethod('sync', @_logSync)
  
  _hookEvents: =>
    @_hookPrototype('Collection', 'trigger', @_logEvent)
    @_hookPrototype('Model', 'trigger', @_logEvent)
    @_hookPrototype('View', 'trigger', @_logEvent)
    @_hookPrototype('Router', 'trigger', @_logEvent)

  _saveObjects: (type, method, object) =>
    @_objects[type][object.constructor.name + ':' + object.cid] = object
  
  _trackObjects: =>
    @_hookPrototype('Model', 'constructor', @_saveObjects)
  
  _hookMethod: (method, action) =>
    original = window.Backbone[method]

    window.Backbone[method] = ->
      original.apply(this, arguments)
      action(method, this, arguments)

  _hookPrototype: (object, method, action) =>
    original = window.Backbone[object].prototype[method]

    window.Backbone[object].prototype[method] = ->
      original.apply(this, arguments)
      action(object, method, this, arguments)

window.Backbone.debug = new Backbone.Debug()
