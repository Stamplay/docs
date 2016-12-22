# Code Blocks
When it comes to handle complex logic application, Flows may not be enough, and the need for a bit of custom logic becomes greater.

Code Blocks make this possible. With Code Blocks, you can add custom NodeJS server side logic when necessary, and let us do the heavily lifting when it's not.

## Setup

To create a Code Block:

* Open the **Code Blocks** section and click on **+Add**;
* Insert a name for your code and press **Enter**.

[![New Code Block](/images/codeblock_new.png)](/images/codeblock_new.png)

Stamplay generates a RESTful endpoint, whenever you create a Code Block.

[![New Code Block](/images/codeblock_landing.png)](/images/codeblock_landing.png)

## Programming Models

There are three ways of writing custom server side code based on your needs:

* [Simple](#simple-model) : when you do not need any external parameters, or the use of the incoming request body.

* [Contextual](#contextual-model): when you need to access request body, query parameters and/or secrets.

* [Full Control](#full-control-model): when you need access to the raw request and response.

### Simple Model

~~~ nodejs-always
  module.exports = function(cb) {
    return cb(null, { i_am: 'done'});
  }
~~~    

Within the **Simple** programming model, you must provide JavaScript code that returns a function which accepts a single argument: a callback.

To indicate completion, the function must call the callback with two arguments: an error, and the result.

The result, or the second argument in the callback, will be the response to the originating request, or the destination *(i.e. Execution of a Task after a Code Block executes.)* request body.

When the callback is invoked, the result value or an error will be serialized as JSON and sent back to the caller as `application/json` Content-type.

### Contextual Model

~~~ nodejs-always
  module.exports = function(context, cb) {
    return cb(null, { hello: context.data.name });
  }
~~~
A more advanced version of the programming model allows you to return a function that accepts two arguments: a `context` and a `callback`.

The `context` parameter is a JavaScript object with data and optionally body properties.
The `context.data` is a JavaScript object that combines parameters passed to the code using one of several mechanisms:

* The [secrets](#app-secrets) that you've defined in the Stamplay Editor.
* The URL query parameters of the request.
* The key value pairs passed in the request body.

The request can be parsed correctly only if `application/json` or `application/x-www-form-urlencoded` is used as `content-type`.

### Full Control Model

~~~ nodejs-always
  module.exports = function(context, req, res) {
    res.writeHead(200, { 'Content-Type': 'application/json'});
    var result = { "hello" : context.body };
    return res.end(JSON.stringify(result));
  };
~~~

The most flexible programming model allows you to take full control over the HTTP `request` and `response`.

The `context` argument behaves the same way as in the two simpler programming models.

Note that this programming model does not have a concept of a callback. [Ending the HTTP response](https://nodejs.org/api/http.html) indicates completion.

If the request doesn't have `content-type` `application-json` or `x-www-form-urlencoded` the `Parse body` option must be disabled in order to allow further Code Block side processing. 

If the `Parse body` option is disabled the value of `context.data` parameter won't contain the body value. 

### Express application

~~~ nodejs-always
const express    = require('express');
const Webtask    = require('webtask-tools');
const bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.json());

app.get('/', function (req, res) {
  console.log(req.webtaskContext);
  return res.sendStatus(200);
});

module.exports = Webtask.fromExpress(app);
~~~

You can write an Express application in a Code Block by mimicking this code.

Please note that : 

* you MUST uncheck the `Parse body` option in order let the `bodyParser.json()` middleware parse the request body that you'll then find in `req.body`
* you can access secrets from the `req.webtaskContext` parameter


## Executing Code Blocks

Code Blocks can be used to implement custom logic and have it available as an API endpoint, for this reason they support any HTTP method. In a nutshell you can execute custom Node.js code with a HTTP call.

To execute a Code Block all you need to do is to send a HTTP request to the Code Block API endpoint that you can see in the Snippets.

Depending from the HTTP method, you can pass data to the Code Block within the body of the request or via query parameters (see below). 

~~~ shell
  curl -X "POST" "https://APPID.stamplayapp.com/api/codeblock/v1/run/{codeblock_name}?name=Stamplay&bar=foo" \
  -H "Content-Type: application/json" \
  -d "{\"message\":\"Hello\"}"
~~~

~~~ javascript
  var data = { message : "Hello"}
  var params = { name : "Stamplay", bar : "foo"}

  //Stamplay.Codeblock("codeblock_name").run() sends a POST request by default

  Stamplay.Codeblock("codeblock_name").run(data, params)
  .then(function(err) {
    // success
  }, function(err) {
    // error
  })
~~~

~~~ nodejs
  var data = { message : "Hello"}
  var params = { name : "Stamplay"}

  //Stamplay.Codeblock("codeblock_name").run() sends a POST request by default

  Stamplay.Codeblock("codeblock_name").run(data, params, function(err, res) {
    // manage the response and the error
  })
~~~


### Query parameters

You can pass parameters to the Code Block using URL query string of the Code Block request. All URL query parameters except the reserved ones (e.g. `user`) will be propagated to the code when it runs. To take advantage of this feature, define your JavaScript function such that it accepts two arguments instead of one: the `context` and the callback `cb`.

All allowed URL query parameters of the Code Block request will be provided to the Code Block code in the form of `context.data` JavaScript object.

~~~ shell
Switch to Javascript or NodeJS view to see the Code Block sample
~~~

~~~ javascript
module.exports = function(context, cb) {
  return cb(null, "Hello, " + context.data.name);
}
~~~

~~~ nodejs
module.exports = function(context, cb) {
  return cb(null, "Hello, " + context.data.name);
}
~~~

#### Try it out

You can try it out with `curl` or with our SDKs. Usually query parameters are passed when using `GET` requests so the examples show how to execute a Code Block with a GET request:

~~~ shell
curl -X "GET" "https://APPID.stamplayapp.com/api/codeblock/v1/run/{codeblock_name}?name=Stamplay" \
  -H "Content-Type: application/json" \
~~~~

~~~ javascript
  var params = { name : "Stamplay"}
  //GET
  Stamplay.Codeblock("codeblock_name").get(params, function(err, res) {
    // manage the response and the error
  })
~~~

~~~ nodejs
  //GET
  var params = { name : "Stamplay"}
  Stamplay.Codeblock("codeblock_name").get(params, function(err, res) {
    // manage the response and the error
  })
~~~

### Body parameters

Parameters can be passed the Code Block also using `body` parameters of a `POST`, `PATCH` or `PUT` request. All the request`body` except the reserved ones (e.g. `user`) will be propagated to the code when it runs. To take advantage of this feature, define your JavaScript function such that it accepts two arguments instead of one: the `context` and the callback `cb`.

All allowed URL query parameters of the Code Block request will be provided to the Code Block code in the form of `context.data` JavaScript object.

~~~ shell
Switch to Javascript or NodeJS view to see the Code Block sample
~~~

~~~ javascript
module.exports = function(context, cb) {
  cb(null, "Just received this, " + context.data.bodyparam);
}
~~~

~~~ nodejs
module.exports = function(context, cb) {
  cb(null, "Just received this, " + context.data.bodyparam);
}
~~~

#### Try it out

You can try it out with `curl` or with our SDKs. Usually query parameters are passed when using `GET` requests so the examples show how to execute a Code Block with a `POST`, `PATCH` or `PUT` request:

~~~ shell
  curl -X "POST" "https://APPID.stamplayapp.com/api/codeblock/v1/run/{codeblock_name}" \
  -H "Content-Type: application/json" \
  -d "{\"bodyparam\":\"Stamplay\"}"

  curl -X "PATCH" "https://APPID.stamplayapp.com/api/codeblock/v1/run/{codeblock_name}" \
  -H "Content-Type: application/json" \
  -d "{\"bodyparam\":\"Stamplay\"}"

  curl -X "PUT" "https://APPID.stamplayapp.com/api/codeblock/v1/run/{codeblock_name}" \
  -H "Content-Type: application/json" \
  -d "{\"bodyparam\":\"Stamplay\"}"
~~~

~~~ javascript
  //POST
  var data = { bodyparam : "Stamplay"}

  Stamplay.Codeblock("codeblock_name").post(data)
  .then(function(err) {
    // success
  }, function(err) {
    // error
  })
  
  //PUT
  Stamplay.Codeblock("codeblock_name").put(data)
  .then(function(err) {
    // success
  }, function(err) {
    // error
  })

  //PATCH
  Stamplay.Codeblock("codeblock_name").patch(data)
  .then(function(err) {
    // success
  }, function(err) {
    // error
  })
~~~

~~~ nodejs
  var data = { bodyparam : "Stamplay"}
  
  //POST
  Stamplay.Codeblock("codeblock_name").post(data, null, function(err, res) {
    // manage the response and the error
  })

  //PUT
  Stamplay.Codeblock("codeblock_name").put(data, null, function(err, res) {
    // manage the response and the error
  })
  
  //PATCH
  Stamplay.Codeblock("codeblock_name").patch(data, null, function(err, res) {
    // manage the response and the error
  })
~~~



### User context data

When executing a Code Block, you are able to pass in data, which is set to the `context.data` property. If an active user session is in place from the originating request, the user of the current session will be placed inside `context` on `context.data.user`.

~~~ javascript
module.exports = function(context, cb) { 
  //context.data contain the request body parameters 
  var greet = "Hello, ";   
  //Show data about logged user 
  console.log("User with Id" + context.data.user._id + " is logged"); 
  //Return a JSON response that includes logged User attribute 
  return cb(null, { message : greet + " " + context.data.user.displayName + "!"  });
};
~~~
~~~ shell
// switch to javascript or nodejs to read Code Block sample
~~~
~~~ nodejs
module.exports = function(context, cb) { 
  //context.data contain the request body parameters 
  var greet = "Hello, ";   
  //Show data about logged user 
  console.log("User with Id" + context.data.user._id + " is logged"); 
  //Return a JSON response that includes logged User attribute 
  cb(null, { message : greet + " " + context.data.user.displayName + "!"  });
};
~~~


## Storage
Sometimes your code needs just a little bit of persistent storage, and using a full database feels like too much. Code Blocks code can durably store a single JSON document up to 500KB in size using built-in storage. With simple get/set APIs and basic conflict detection, this is frequently all you need.

### Reading data

~~~ nodejs-always
module.exports = function(context, cb) {
    context.storage.get(function (error, data) {
        if (error) return cb(error);
        // ...
    });
}
~~~

Use the `context.storage.get` API to retrieve a previously stored document.

In the absence of error, the data will contain your previously stored document, or null if no document was stored.

### Writing data

~~~ nodejs-always
module.exports = function(context, cb) {
    context.storage.get(function (error, data) {
        if (error) return cb(error);
        data = data || { counter: 1 };
        context.storage.set(data, function (error) {
            if (error) return cb(error);
            // ...
        });
    });
}
~~~

Use the `context.storage.set` API to save a document.

In the absence of error, the data has been successfuly persisted.

### Resolving conflicts

~~~ nodejs-always
module.exports = function(context, cb) {
    context.storage.get(function (error, data) {
      if (error) return cb(error);
      data = data || { counter: 1 };
      var attempts = 3;
      context.storage.set(data, function set_cb(error) {
          if (error) {
            if (error.code === 409 && attempts--) {
                // resolve conflict and re-attempt set
                data.counter = Math.max(data.counter, error.conflict.counter) + 1;
                return context.storage.set(data, set_cb);
            }
            return cb(error);
          }
          // ...
      });
    });
}
~~~

When many instances of your Code Block attempt to persist the document simultaneously, conflicts may arise. A conflict occurs when the code calls the `set` operation, and the value of the document in the database is different from the value that was read last by that instance of a webtask. Code Block runtime automatically detects conflicts and allows you to resolve them using an application-specific logic before re-attempting the `set` call.

The absence of error in the callback of `set` indicates there were no conflicts and the operation persisted the data successfully.

### Forcefully writing data

~~~ nodejs-always
module.exports = function(context, cb) {
  context.storage.set({ counter: 1 }, { force: 1 }, function (error) {
      if (error) return cb(error);
      //...
  });
}
~~~

Sometimes you want to disregard the possibility of a conflict and forcefully override whatever data may already be persisted. This can be done with the `force` option.

## Secret Parameters


You can create a Code Block that includes public or secret parameters. These parameters are made available to the Code Block code when it runs. This mechanism provides a convenient way to equip your Code Block with secret credentials necessary to communicate with external systems while preventing disclosure of these credentials to third parties.

For example, you could write a Code Block that sends an HTTP request to your private API and you need to use a secret token to authorize this request. The secret token to call your API can then be stored encrypted in the Code Block as a `secret`, only to be decrypted and provided to your Code Block code when it runs. 

Code Blocks allow you to securely store these parameters within the Secrets area.

### Adding Secrets

Four steps are required in order to save a secret value:



* 1. Navigate to the **Secrets** area, under the **Properties** tab.

[![Navigate To Secrets Area](/images/cb_sec_save_1.png)](/images/cb_sec_save_1.png)

* 2. Add a `name` key and a key `value`.

[![Enter A New Secret](/images/cb_sec_save_2.png)](/images/cb_sec_save_2.png)

* 3. Click the **Add** Button.

[![Enter A New Secret](/images/cb_sec_save_3.png)](/images/cb_sec_save_3.png)

Now your secret has been added and is ready for use with the Code Block.

[![Enter A New Secret](/images/cb_sec_save_4.png)](/images/cb_sec_save_4.png)

### Accessing Secrets

~~~ nodejs-always
  module.exports = function(context, cb) {
    return cb(null, { pass_this_secret : context.secrets.name });
  }
~~~

In order to access secrets you need to use the [Contextual](#contextual-model) or the [Full Control](#full-control-model) programming model.

You'll find your secrets in the `context.secrets`, or the `context.data` object in the key that you specified from the Stamplay Editor.

Example shown uses the **Contextual** programming model.

## NPM Modules

~~~ nodejs-always
const Stamplay = require('stamplay@1.0.6');
const _ = require('lodash@4.8.2');

module.exports = function (context, cb) {
  const stamplay = new Stamplay('appId', context.secrets.apiKey);
  const body = context.data;

  stamplay.Object('movie').save(body, (err, res) => {
    return cb(null, JSON.parse(res).data);
  });
};
~~~

When using Code Blocks you can rely on over 900 of the most popular Node.js modules available on NPM. You can use any of them in your Code Block code by simply requiring them.

You can browse available modules at [https://canirequire.stamplayapp.com](https://canirequire.stamplayapp.com).

If there is a module that is not list on the directory that you need, let us know at [support@stamplay.com](mailto:support@stamplay.com) and we can have the requested module live within 24hrs or less typically.

To use the `require` method, simply pass the name of the desired NPM module to `require` to include inside your Code Block as you normally may in a Node.js enviornment.

The example `require`s the [lodash](https://lodash.com) and [Stamplay Node.js SDK](https://github.com/Stamplay/stamplay-nodejs-sdk) node module with a specific version.

## Common Errors

These are some of the most common errors that you may encounter when writing Code Blocks:

#### Async code not handled properly.

If you're writing code in Node.js, async code is the way to go. If you're having problems syncronizing your code please consider the use of libraries such as q or async which are available in our modules.

#### I’ve configured a Flow that says “On Code Block run then ...” but it’s not working.

There are several reason why the Flow may not be triggered:

Flows work only if the output has as **Content-Type** `application/json`: if you’re using the **Simple** or **Context** way to write a Code Block you can just pass null as the first argument (which is the error) and an object to the final callback, and the Flow will be triggered in the right way.

If you’re using the **Full Control** programming model, make sure to return `application/json` as Content-Type.

A flow is triggered only if the Code Block returns a status code between 200 and 299.

A Code Block can currently be executed using `POST`, `GET`, `PUT`, `PATCH` or `DELETE` method, please ensure that you're using the right HTTP verb.

## Logs

If you need to debug your Code Block to see how it behaves, check the **Logs** tab and you'll be able to see the request and response body of each execution. 

Moreover you can check out the `console.log` output from the real time console that's available just below your source code.

### Retention

Logs are automatically deleted after two weeks. 

If you have different needs, please [let us know](mailto:support@stamplay.com?subject=Logs+Expiration).
