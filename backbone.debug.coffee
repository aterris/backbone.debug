class window.Backbone.Debug
  constructor: (options={}) ->
    @options = options
    @hookEvents()
    @hookSync()
  
  #  router/page overview

  # track all objects

  # generic nicer inspect

  logObj: (obj) =>
    console.log obj, _.keys(obj._callbacks)
  
  logEvent: (obj, event) =>
    console.log @last_obj, obj, 'obj', @last_obj == obj
    if @last_obj == obj #&& @last_event == event
      clearTimeout(@at)
      
      @at = setTimeout( =>
        console.log "boom"
      , 10)
      console.log 'set my timeout'
    else
      console.log 'something'
    
    @last_obj = obj
    @last_event = event
    
  
  logSync: (obj, method, model, options) =>
    console.log "Sync - #{method}", obj
  
  hookSync: =>
    logSync = @logSync
    sync = window.Backbone.sync
    
    window.Backbone.sync = (method, model, options) ->
      logSync @, method, model, options
      sync.apply @, arguments
  
  hookEvents: =>
    @hookBaseEvents()
    @hookCollectionEvents()
    @hookModelEvents()
    @hookViewEvents()
    @hookRouterEvents()
  
  hookBaseEvents: =>
    logEvent = @logEvent
    trigger = window.Backbone.Events.trigger
    
    window.Backbone.Events.trigger = (events) ->
      logEvent(this, events)
      trigger.apply(this, arguments)
  
  hookCollectionEvents: =>
    logEvent = @logEvent
    trigger = window.Backbone.Collection.prototype.trigger
    
    window.Backbone.Collection.prototype.trigger = (events) ->
      logEvent(this, events)
      trigger.apply(this, arguments)
  
  hookModelEvents: =>
    logEvent = @logEvent
    trigger = window.Backbone.Model.prototype.trigger
    
    window.Backbone.Model.prototype.trigger = (events) ->
      logEvent(this, events)
      trigger.apply(this, arguments)
  
  hookViewEvents: =>
    logEvent = @logEvent
    trigger = window.Backbone.View.prototype.trigger
    
    window.Backbone.View.prototype.trigger = (events) ->
      logEvent(this, events)
      trigger.apply(this, arguments)
      
  hookRouterEvents: =>
    logEvent = @logEvent
    trigger = window.Backbone.Router.prototype.trigger

    window.Backbone.Router.prototype.trigger = (events) ->
      logEvent(this, events)
      trigger.apply(this, arguments)

window.Backbone.debug = new Backbone.Debug()
