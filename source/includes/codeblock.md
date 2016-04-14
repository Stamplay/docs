# Code Blocks
Our vision is to empower developers to build applications without having to deal with server side development.

For more complex applications, Tasks are not always enough, and the need for a bit of custom logic becomes greater. 

Code Blocks make this possible. With Code Blocks, you can add custom server side logic when neccessary, and let us do the heavily lifting when it's not.

## Setup

To create a Code Block:

* Open the **Code Blocks** section and click on **+Add**;
* Insert a name for your code and press **Enter**.

[![New Code Block](/images/codeblock_new.png)](/images/codeblock_new.png)

Stamplay generates a RESTful endpoint, whenever you create a Code Block.

[![New Code Block](/images/codeblock_landing.png)](/images/codeblock_landing.png)

## Programming Models

There are three ways of writing custom server side code based on your needs:

* [Simple](#simple-model) : when you do not need any external parameters, or the use of the incoming request body..

* [Contextual](#contextual-model): when you need to access request body, query parameters and/or secrets.

* [Full Control](#full-control-model): when you need access to the raw request and response.

<aside class="warning">
  All your code <strong>MUST</strong> be inside the main function, everything written outside will break your Code Block.
</aside>

### Simple Model

~~~ nodejs-always
  module.exports = function(cb) {
    cb(null, { i_am: 'done'});
  }
~~~    

Within the **Simple** programming model, you must provide JavaScript code that returns a function which accepts a single argument: a callback.

To indicate completion, the function must call the callback with two arguments: an error, and the result.

The result, or the second argument in the callback, will be the response to the originating request, or the destination *(i.e. Execution of a Task after a Code Block executes.)* request body.

When the callback is invoked, the result value or an error will be serialized as JSON and sent back to the caller as `application/json` content type.

### Contextual Model

~~~ nodejs-always
  module.exports = function(context, cb) {
    cb(null, { hello: context.data.name });
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
    res.end(JSON.stringify(result));
  };
~~~ 

The most flexible programming model allows you to take full control over the HTTP `request` and `response`.

The `context` argument behaves the same way as in the two simpler programming models.

Note that this programming model does not have a concept of a callback. [Ending the HTTP response](https://nodejs.org/api/http.html) indicates completion.

## Running Code Blocks

To execute a Code Block send a `POST` request to the Code Block API resource with the identifier of the Code block to run in the URI.

Include any data to pass into the Code block within the body of the request, and any query params within the URI itself.

~~~ shell
  curl -X "POST" "https://APPID.stamplayapp.com/api/codeblock/v1/run/{codeblock_name}?page=2&per_page=30" \
  -H "Content-Type: application/json" \
  -d "{\"message\":\"Hello\"}"
~~~ 

~~~ javascript
  var data = {
    message : "Hello"
  }

  var params = {
    page : 2,
    per_page : 30
  }

  Stamplay.Codeblock("codeblock_name").run(data, params)
    .then(function(err) {
      // success
    }, function(err) {
      // error
    })
~~~ 

~~~ nodejs
  // no method
~~~ 

## App Secrets

In order to develop a full-featured application you'll need to communicate with external services using secret credentials. Stamplay allows you to securely store these parameters within the Secrets area.

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


### User Context Data

When executing a Code Block, you are able to pass in data, which is set to the `context.data` property. If an active user session is in place from the origininating request, the user of the current session will be placed inside `context` on `context.data.user`.


### Accessing Secrets

~~~ nodejs-always
  module.exports = function(context, cb) {
    cb(null, { pass_this_secret : context.secrets.name });
  }
~~~ 

In order to access secrets you need to use the [Contextual](#contextual-model) or the [Full Control](#full-control-model) programming model.

You'll find your secrets in the `context.secrets`, or the `context.data` object in the key that you specified from the Stamplay Editor.

Example shown uses the **Contextual** programming model.

## NPM Modules

~~~ nodejs-always
module.exports = function(context, cb) {

  var stamplay = require("stamplay");
  var Stamplay = new Stamplay("APPID", "APIKEY");
  var request = require("request");
  var  _ = require("underscore");

  request("req_url", function(req, res, body) {

    var result = JSON.parse(body);

    var movieFound = _.where(result, { director : "John Doe" })

    Stamplay.Object("movie").save(movieFound, function(err, res) {
      cb(null, JSON.parse(res).data);
    })

  })

}
~~~ 

When using Code Blocks you can rely on over 800 of the most popular Node.js modules available on NPM. You can use any of them in your Code Block code by simply requiring them.

You can browse available modules at [https://canirequire.stamplayapp.com](https://canirequire.stamplayapp.com).

If there is a module that is not list on the directory that you need, let us know at [support@stamplay.com](mailto:support@stamplay.com) and we can have the requested module live within 24hrs or less typically.

To use the `require` method, simply pass the name of the desired NPM module to `require` to include inside your Code Block as you normally may in a Node.js enviornment.

The example `require`s the [underscore](http://underscorejs.org/), [request](https://github.com/request/request), and [Stamplay Node.js SDK](https://github.com/Stamplay/stamplay-nodejs-sdk).

## Common Errors

These are some of the most common errors that you may encounter when writing Code Blocks:


#### Writing code outside the method signature.

No code outside the main `module.export`, please. It's a tradeoff for using Code Blocks .

#### Async code not handled properly.

If you're writing code in Node.js, async code is the way to go. If you're having problems syncronizing your code please consider the use of libraries such as q or async which are available in our modules.

#### I’ve configured a Task that says “On Code Block run then ...” but it’s not working.

There are several reason why the Task may not be triggered:

Tasks work only if the output has as **Content-Type** `application/json`: if you’re using the **Simple** or **Context** way to write a Code Block you can just pass null as the first argument (which is the error) and an object to the final callback, and Tasks will be triggered in the right way.

If you’re using the **Full Control** programming model, make sure to return `application/json` as Content-Type.

A task is triggered only if the Code Block returns a `200` status code.

A Code Block is currently only executed only using `POST` request, ensure that you're using the right HTTP verb.

## Logs

If you need to debug your Code Block to see how it behaves, check the **Logs** tab and you'll be able to see the `console.log` output, and the output of your Code Block from the callback, or the stack trace.

## Lost Logs

Logs are automatically deleted after two weeks. If you have different needs, please [let us know](mailto:support@stamplay.com?subject=Logs+Expiration).