Backbone = window.Backbone
$ = Backbone.$ || window.$

$.fn.backbone = (option = 'this') ->
  switch option
    when 'this'
      @data('_backbone_view') || null
    when 'closest'
      elem = @
      while !elem.data('_backbone_view')
        elem = elem.parent()
        return null if elem.is('html')
      elem.data('_backbone_view')
    when 'parent'
      @parent().backbone('closest')

class ConsoleLogger
  log: (type, object, details) ->
    console.log("[#{type}]", details, ":", object)

class Backbone.Debug
  constructor: () ->
    @_options =
      'log:events': true
      'log:sync': true
      'log:instances': true
      'log:views': true
    
    @_objects =
      Collection: {}
      Model: {}
      View: {}
      Router: {}

    @logger = new ConsoleLogger()
      
    @_trackObjects()
    @_hookEvents()
    @_hookSync()
    @_trackViewBinding()

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
      @_options[option] = true for option of @_options
    @
  
  off: (option) =>
    if option?
      @_options[option] = false
    else
      @_options[option] = false for option of @_options
    @
  
  ##### Hook Object Creation
  _trackObjects: =>
    @_hookConstructor('Collection', @_onNewInstance)
    @_hookConstructor('Model', @_onNewInstance)
    @_hookConstructor('View', @_onNewInstance)
    @_hookConstructor('Router', @_onNewInstance)
  
  ##### Hook Events
  _hookEvents: =>
    @_hookPrototype('Collection', 'trigger', @_onEvent)
    @_hookPrototype('Model', 'trigger', @_onEvent)
    @_hookPrototype('View', 'trigger', @_onEvent)
    @_hookPrototype('Router', 'trigger', @_onEvent)

  ##### Hook Sync
  _hookSync: =>
    @_hookMethod('sync', @_onSync)

  ##### Hook View -> DOM Binding
  _trackViewBinding: =>
    @_hookPrototype('View', 'setElement', @_onViewBinding)

  ##### Handle Debug Data
  _onNewInstance: (type, method, object) =>
    name = @_prettyInstanceName(object, type)
    @_objects[type][name] = object
    @logger.log('instance', name, type) if @_options['log:instances']

  _onViewBinding: (type, method, object) =>
    object.$el.data('_backbone_view', object)
    name = @_prettyInstanceName(object, type)
    @logger.log('view', name, object.el) if @_options['log:views']

  _onEvent: (type, method, object, args) =>
    @logger.log('event', object, args[0]) if @_options['log:events']
  
  _onSync: (method, object, args) =>
    @logger.log('sync', args[1], args[0]) if @_options['log:sync']
  
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

  ##### Hook Constructor
  _hookConstructor: (object, action) =>

    @_hookPrototype(object, 'constructor', action)

    # this is enough for coffeescript generated classes
    # but not for classes which use Backbone's extend helper

    originalExtend = Backbone[object].extend

    Backbone[object].extend = (args...) ->
      args[0] ||= {}

      if hasOwnProperty.call(args[0], 'constructor')
        originalConstructor = args[0].constructor
      else
        originalConstructor = @

      # let's give the constructor a sane name
      args[0].constructor = eval(
        "(function #{object}() {
          var ret = originalConstructor.apply(this, arguments);
          action(object, 'extend', this, arguments);
          return ret;
        })")
      originalExtend.apply(@, args)

  ##### Helpers
  _prettyInstanceName: (object, type) =>
    name = object.constructor.name || type
    name = "#{name}:#{object.cid}" if object.cid
    name


##### Initialize
Backbone.debug = new Backbone.Debug()
