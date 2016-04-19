# Quickstart

## Create An Account

The first thing needed to get started with Stamplay is to [signup for a free account](https://editor.stamplay.com).

After signing up, create your first Stamplay application in the dashboard by entering a name for your application in the input and selecing **CREATE**.

## Install CLI

~~~ shell-always
  npm install -g stamplay-cli
~~~

The Stamplay CLI will allow you to run your application locally, manage application versioning, deploy to the cloud, etc.

Ensure you have Node.js & NPM installed, then `npm install` the `stamplay-cli` package globally.

After installing the CLI, initialize a project locally inside a project folder by running an `init` command from the `stamplay` CLI.

~~~ shell-always
  stamplay init
~~~ 

You will be prompted to enter an `APP ID` and `API KEY` for a Stamplay application. These can be found in the **Dashboard** of the application created in the previous step.

~~~ shell-always
  stamplay start
~~~ 

To run our application locally, run the `start` command from the `stamplay` CLI.

## Setup

~~~ javascript
  bower install stamplay-js-sdk
~~~ 

~~~ javascript
  Stamplay.init("APP-ID")
~~~

<div class="lang-content javascript">

The [Stamplay JavaScript SDK](https://github.com/Stamplay/stamplay-js-sdk) is a client-side library for interacting with Stamplay.


Run `bower install` for the `stamplay-js-sdk` package to download from `bower` into your local project directory.

To initialize the library, run the `init` method from the `Stamplay` SDK.

</div>

<div class="lang-content shell">
  
For REST API Quickstart proceed to the next step, otherwise select the **JavaScript** tab for the SDK quickstart instructions for this step.

</div>







## Define Schema

Create a new Object schema by visiting the **Object** section within the editor for your application through the sidebar. 

Inside the **Object** section, add a name and data type for each property on the schema desired and **Save**.

## Write Data

~~~ shell
  curl -X "POST" "https://APP-ID.stamplayapp.com/api/cobject/v1/car" \
    -H "Content-Type: application/json" \
    -d "{\"make\":\"Volkswagen\",\"model\":\"Jetta\",\"year\":2013,\"color\":\"silver\",\"top_speed\":140}"
~~~

~~~ javascript
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
~~~

<div class="lang-content javascript">

To write data to Stamplay, model an object after the schema just created. 

Pass the object into the `save` method on the `Stamplay.Object` class.

Most every SDK method returns a promise, or you can pass a callback in as the last method argument.

</div>

<div class="lang-content shell">
  
To write data, send a JSON object modeled after the schema in a `POST` request body to the API [Object](#objects) resource.

</div>

## Read Data

~~~ javascript
  Stamplay.Object("car").get({})
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~

~~~ shell
  curl -X "GET" "https://APP-ID.stamplayapp.com/api/cobject/v1/car"
~~~

<div class="lang-content javascript">

To fetch **Object** data from  Stamplay, use the `get` method on the `Stamplay.Object` class.

The `get` method takes an options object. The object is matched against all records, and returns only those that match.

</div>

<div class="lang-content shell">

To read object data, send a `GET` request to the API Object resource.

</div>




## Register Users

~~~ javascript

var credentials = {
  email : "user@provider.com",
  password : "123123"
};

Stamplay.User.signup(credentials)
  .then(function(res) {
    // success
  }, function(err) {
    // error
  })

~~~

~~~ shell

 curl -X "POST" "https://APP-ID.stamplayapp.com/api/user/v1/users" \
    -H "Content-Type: application/json" \
    -d "{\"email\":\"user@stamplay.com\",\"password\":\"my_password\"}"

~~~

To register a user with a local account, no additional setup within the Stamplay editor is required.

<div class="lang-content javascript">

Use the `signup` method on the the `Stamplay.User` class, and pass in an object with at least an `email` and `password` property.

</div>

<div class="lang-content shell">

To register, send a `POST` request to the API [User](#users) resource, with a JSON object that has an `email` and `password` property, in the request body.

</div>


## Login Users

<div class="lang-content javascript">
  
To login a user to a local account, use the `login` method on the `Stamplay.User` class.

</div>

<div class="lang-content shell">
  
To login a user to a local account, send a `POST` request with JSON object in the body, that contains an `email` and `password` of a registered account.

</div>

~~~ javascript
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
~~~

~~~ shell

 curl -X "POST" "https://APP-ID.stamplayapp.com/auth/v1/local/login" \
    -H "Content-Type: application/json" \
    -d "{\"email\":\"user@stamplay.com\",\"password\":\"my_password\"}"

~~~

## Deploy

To deploy your application, run the `deploy` command from the `stamplay` CLI.

~~~ shell-always
  stamplay deploy
~~~ 

After deployment is finished, your application will be live at [[YOUR APP ID].stamplayapp.com]([YOUR APP ID].stamplayapp.com).
