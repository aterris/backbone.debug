class window.Backbone.Debug
  constructor: (options={}) ->
    @options = options
    @trackObjects()
    @hookEvents()
    @hookSync()
  
  #  router/page overview

  
  # generic nicer inspect

  logObj: (obj) =>
    console.log obj, _.keys(obj._callbacks)
  
  logEvent: (obj, event) =>
    console.log @last_obj, obj, 'obj', @last_obj == obj
    # if @last_obj == obj #&& @last_event == event
    #   clearTimeout(@at)
    #   
    #   @at = setTimeout( =>
    #     console.log "boom"
    #   , 10)
    #   console.log 'set my timeout'
    # else
    #   console.log 'something'
    # 
    # @last_obj = obj
    # @last_event = event
    
  
  logSync: (obj, method, model, options) =>
    console.log "Sync - #{method}", obj
  
  hookSync: =>
    @_hookMethod('sync', @logSync)
  
  hookEvents: =>
    @_hookPrototype('Collection', 'trigger', @logEvent)
    @_hookPrototype('Model', 'trigger', @logEvent)
    @_hookPrototype('View', 'trigger', @logEvent)
    @_hookPrototype('Router', 'trigger', @logEvent)

  trackObjects: =>
    @objects ||= {Collection: {}, Model: {}, View: {}, Router: {}}
    
    saveObjects = =>
      parent_object = arguments[0]
      method = arguments[1]
      object = arguments[2]
      args = arguments[3]
      
      @objects[parent_object][object.constructor.name + ':' + object.cid] = object
    
    @_hookPrototype('Model', 'constructor', saveObjects)
  
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
