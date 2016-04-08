# Quickstart
## Create An Account

The first thing needed to get started with Stamplay is to [signup for a free account](https://editor.stamplay.com).

After signing up, create your first Stamplay application in the dashboard by entering a name for your application in the input and selecing **CREATE**.

## Install CLI

```shell-always
	npm install -g stamplay-cli
```

<div class="lang-content" data-language-name="javascript">
	<h4>Does this show up</h4>
</div>

The Stamplay CLI will allow you to run your application locally, manage application versioning, deploy to the cloud, etc.

Ensure you have Node.js & NPM installed, then `npm install` the `stamplay-cli` package globally.

After installing the CLI, initialize a project locally inside a project folder by running an `init` command from the `stamplay` CLI.

```shell-always
	stamplay init
```

You will be prompted to enter an `APP ID` and `API KEY` for a Stamplay application. These can be found in the **Dashboard** of the application created in the previous step.

```shell-always
	stamplay start
```

To run our application locally, run the `start` command from the `stamplay` CLI.

## JavaScript SDK Setup
The [Stamplay JavaScript SDK](https://github.com/Stamplay/stamplay-js-sdk) is a client-side library for interacting with Stamplay.

```shell-always
	bower install stamplay-js-sdk
```

Run `bower install` for the `stamplay-js-sdk` package to download from `bower` into your local project directory.

```javascript-always
	Stamplay.init("APP ID")
```

To initialize the library, run the `init` method from the `Stamplay` SDK.

## Define Schema

Create a new Object schema by visiting the **Object** section within the editor for your application through the sidebar. 

Inside the **Object** section, add a name and data type for each property on the schema desired and **Save**.

## Write Data

To write data to Stamplay, model an object after the schema just created.

Pass the object into the `save` method on the `Stamplay.Object` class.

```javascript-always
	var car = {
		make : "Volkswagen",
		model : "Jetta",
		year : 2013,
		color : "silver",
		top_speed : 140
	}

	Stamplay.Object("car").save(car)
		.then(function(res) {
			// success
		}, function(err) {
			// error
		})
```

Most every SDK method returns a promise, or you can pass a callback in as the last method argument.

## Read Data

To fetch **Object** data from  Stamplay, use the `get` method on the `Stamplay.Object` class.

The `get` method takes an options object. The object is matched against all records, and returns only those that match.

```javascript-always
    Stamplay.Object("car")
      .get({})
        .then(function(res) {
          // success
        }, function(err) {
          // error
        })
```

## Register Users

To register a user with a local account, no additional setup within the Stamplay editor is required.

Use the `signup` method on the the `Stamplay.User` class, and pass in an object with at least an `email` and `password` property.

```javascript-always
	var credentials = {
	    email : "user@provider.com",
	    password : "123123"
	}

  Stamplay.User.signup(credentials)
	.then(function(res) {
		// success
	}, function(err) {
		// error
	})
```

## Login Users

To login a user to a local account, use the `login` method on the `Stamplay.User` class.

```javascript-always
	var credentials = {
	    email : "user@provider.com",
	    password : "123123"
	}

  Stamplay.User.login(credentials)
	.then(function(res) {
		// success
	}, function(err) {
		// error
	})
```
## Deploy

To deploy your application, run the `deploy` command from the `stamplay` CLI.

```shell-always
	stamplay deploy
```

After deployment is finished, your application will be live at [[YOUR APP ID].stamplayapp.com]([YOUR APP ID].stamplayapp.com).
