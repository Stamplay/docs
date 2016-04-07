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

```nodejs-always
	module.exports = function(cb) {
		cb(null, { i_am: 'done'});
    }
```   

Within the **Simple** programming model, you must provide JavaScript code that returns a function which accepts a single argument: a callback.

To indicate completion, the function must call the callback with two arguments: an error, and the result.

The result, or the second argument in the callback, will be the response to the originating request, or the destination *(i.e. Execution of a Task after a Code Block executes.)* request body.

When the callback is invoked, the result value or an error will be serialized as JSON and sent back to the caller as `application/json` content type.

### Contextual Model

```nodejs-always
    module.exports = function(context, cb) {
	    cb(null, { hello: context.data.name });
    }
```
A more advanced version of the programming model allows you to return a function that accepts two arguments: a `context` and a `callback`.
      
The `context` parameter is a JavaScript object with data and optionally body properties.
The `context.data` is a JavaScript object that combines parameters passed to the code using one of several mechanisms:

* The [secrets](#app-secrets) that you've defined in the Stamplay Editor.
* The URL query parameters of the request.
* The key value pairs passed in the request body.

The request can be parsed correctly only if `application/json` or `application/x-www-form-urlencoded` is used as `content-type`.

### Full Control Model

```nodejs-always
	module.exports = function(context, req, res) {
		res.writeHead(200, { 'Content-Type': 'application/json'});
		var result = { "hello" : context.body };
		res.end(JSON.stringify(result));
	};
```

The most flexible programming model allows you to take full control over the HTTP `request` and `response`.

The `context` argument behaves the same way as in the two simpler programming models.

Note that this programming model does not have a concept of a callback. [Ending the HTTP response](https://nodejs.org/api/http.html) indicates completion.

## Running Code Blocks

To execute a Code Block send a `POST` request to the Code Block API resource with the identifier of the Code block to run in the URI.

Include any data to pass into the Code block within the body of the request, and any query params within the URI itself.

```shell
	curl -X "POST" "https://APPID.stamplayapp.com/api/codeblock/v1/run/{codeblock_name}"
```

```javascript
	Stamplay.Codeblock("codeblock_name").run()
		.then(function(err) {
			// success
		}, function(err) {
			// error
		})
```

```nodejs
	// no method
```

## App Secrets
## NPM Modules
## Common Errors
## Logs
(https://stamplay.com/docs/platform/codeblocks/manage#logs)
## Lost Logs