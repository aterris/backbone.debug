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
      it('can hook view events', function() {});
      return it('can hook router events', function() {
        var router;
        return router = new Backbone.Router();
      });
    });
    describe('Hook Syncing', function() {
      beforeEach(function() {
        return console.log = jasmine.createSpy();
      });
      return it('can hook Backbone.sync', function() {});
    });
    describe('Track Objects', function() {
      it('can save an object to _objects', function() {});
      it('can track a new collection', function() {});
      it('can track a new model', function() {});
      it('can track a new view', function() {});
      return it('can track a new router', function() {});
    });
    describe('Query Objects', function() {
      beforeEach(function() {
        return console.log = jasmine.createSpy();
      });
      it('can return all collections', function() {});
      it('can return all models', function() {});
      it('can return all views', function() {});
      return it('can return all routers', function() {});
    });
    describe('Hooking Functionality', function() {
      it('can hook a top level Backbone function', function() {});
      return it('can hook a prototype Backbone function', function() {});
    });
    describe('console.log Functionality', function() {
      beforeEach(function() {
        return console.log = jasmine.createSpy();
      });
      it('can log an event', function() {});
      return it('can log a sync', function() {});
    });
    return describe('Toggle Logging', function() {
      beforeEach(function() {
        return console.log = jasmine.createSpy();
      });
      it('can turn off logging', function() {});
      it('can turn on logging', function() {});
      it('can turn off logging for a single option', function() {});
      return it('can turn on logging for a single option', function() {});
    });
  });
}).call(this);
