(function() {
  describe('Backbone.debug', function() {
    describe('Hook Events', function() {
      beforeEach(function() {
        return console.log = jasmine.createSpy();
      });
      it('can hook collections events', function() {
        var collection;
        collection = new Backbone.Collection();
        collection.trigger('reset');
        return expect(console.log).toHaveBeenCalled();
      });
      it('can hook model events', function() {
        var model;
        model = new Backbone.Model();
        model.trigger('change');
        return expect(console.log).toHaveBeenCalled();
      });
      it('can hook view events', function() {
        var view;
        view = new Backbone.View();
        view.trigger('test');
        return expect(console.log).toHaveBeenCalled();
      });
      return it('can hook router events', function() {
        var router;
        router = new Backbone.Router();
        router.navigate('test');
        return expect(console.log).toHaveBeenCalled();
      });
    });
    describe('Hook Syncing', function() {
      beforeEach(function() {
        return console.log = jasmine.createSpy();
      });
      return it('can hook Backbone.sync', function() {
        return expect(1).toEqual(2);
      });
    });
    describe('Track Objects', function() {
      it('can save an object to _objects', function() {
        return expect(1).toEqual(2);
      });
      it('can track a new collection', function() {
        return expect(1).toEqual(2);
      });
      it('can track a new model', function() {
        return expect(1).toEqual(2);
      });
      it('can track a new view', function() {
        return expect(1).toEqual(2);
      });
      return it('can track a new router', function() {
        return expect(1).toEqual(2);
      });
    });
    describe('Query Objects', function() {
      beforeEach(function() {
        return console.log = jasmine.createSpy();
      });
      it('can return all collections', function() {
        return expect(1).toEqual(2);
      });
      it('can return all models', function() {
        return expect(1).toEqual(2);
      });
      it('can return all views', function() {
        return expect(1).toEqual(2);
      });
      return it('can return all routers', function() {
        return expect(1).toEqual(2);
      });
    });
    describe('Hooking Functionality', function() {
      it('can hook a top level Backbone function', function() {
        return expect(1).toEqual(2);
      });
      return it('can hook a prototype Backbone function', function() {
        return expect(1).toEqual(2);
      });
    });
    describe('console.log Functionality', function() {
      beforeEach(function() {
        return console.log = jasmine.createSpy();
      });
      it('can log an event', function() {
        return expect(1).toEqual(2);
      });
      return it('can log a sync', function() {
        return expect(1).toEqual(2);
      });
    });
    return describe('Toggle Logging', function() {
      beforeEach(function() {
        return console.log = jasmine.createSpy();
      });
      it('can turn off logging', function() {
        return expect(1).toEqual(2);
      });
      it('can turn on logging', function() {
        return expect(1).toEqual(2);
      });
      it('can turn off logging for a single option', function() {
        return expect(1).toEqual(2);
      });
      return it('can turn on logging for a single option', function() {
        return expect(1).toEqual(2);
      });
    });
  });
}).call(this);
