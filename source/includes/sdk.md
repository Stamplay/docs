# SDK and Client Libraries

## Javascript SDK

~~~ shell-always
  bower install stamplay-js-sdk
~~~ 

~~~ javascript-always
  Stamplay.init("APP ID");
~~~ 

The JavaScript SDK is a client side library to help simplify interacting with the Stamplay API.

To install the JavasScript SDK, run `bower install` for the `stamplay-js-sdk`.

To initialize the SDK within your client side enviornment, run the `init` method on the `Stamplay` global object. Ensure the module has been included before running the method, and pass in your `APP ID` as the sole method argument.

An additional options object can be passed in as the second argument, but is primarily meant for use within a mobile application.

Our [JavaScript SDK is open source on Github](https://github.com/Stamplay/stamplay-js-sdk)!

### JavaScript API Reference

The JavaScript SDK exposes the following components and methods:

#### Users

| [User](#users) | `Stamplay.User` |
|---------------|----------|
| save | **save(data, [callback])** |
| get   | **get(data, [callback])** |
| getById | **getById(id, data, [callback])** |
| remove | **remove(id, [callback])** |
| update | **update(id, data, [callback] )** |
| currentUser| **currentUser([callback])** |
| login | **login(data, [callback])** |
| socialLogin | **socialLogin(provider)** |
| signup | **signup(data, [callback])** |
| logout | **logout()** |
| resetPassword | **resetPassword(data, [callback])** |
| getRoles | **getRoles([callback])** |
| getRole | **getRole(id, [callback])** |
| setRole | **setRole(id, roleId, [callback])** |
| follow | **follow(id, [callback])** |
| unfollow | **unfollow(id, [callback])** |
| followedBy | **followedBy(id, [callback])** |
| following | **following(id, [callback])** |
| activities | **activities(id, [callback])**

#### Objects

|[Object](#objects) | `Stamplay.Object("cobject")` |
|-------------------------|----------|
| save | **save(data, [callback])** |
| get | **get(data, [callback])** |
| getById | **getById(id, data, [callback])** |
| remove | **remove(id, [callback])** |
| update | **update(id, data, [callback])** |
| patch | **patch(id, data, [callback])** |
| findByCurrentUser | **findByCurrentUser([attr], [callback])** |
| upVote | **upVote(id, [callback])** |
| downVote | **downVote(id, [callback])** |
| rate | **rate(id, rate, [callback])** |
| comment | **comment(id, text, [callback])** |
| push | **push(id, attribute, data, [callback])** |

#### Code Blocks

| [Code Block](#code-blocks) | `Stamplay.Codeblock("codeblock")` |
|--------------------------|------|
| run | **run(data, queryParams, [callback])** |

#### Webhooks

| [Webhook](#webhooks) | `Stamplay.Webhook("webhook")` |
|---------------------|----|
| post | **post(data, [callback])** |

#### Stripe

| [Stripe](#stripe) | `Stamplay.Stripe` |
|-------------------|------|
| charge | **charge(userId, token, amount, currency, [callback])** | 
| createCreditCard | **createCreditCard(userId, token, [callback])** | 
| createCustomer | **createCustomer(userId, [callback])** | 
| createSubscriptionuserId | **createSubscriptionuserId, planId, [callback])** | 
| deleteSubscription | **deleteSubscription(userId, subscriptionId, options, [callback])** | 
| getCreditCard | **getCreditCard(userId, [callback])** | 
| getSubscription | **getSubscription(userId, subscriptionId, [callback])** | 
| getSubscriptions | **getSubscriptions(userId, options, [callback])** | 
| updateCreditCard | **updateCreditCard(userId, token, [callback])** | 
| updateSubscription | **updateSubscription(userId, subscriptionId, options, [callback])** |

#### Queries

| [Query](#query) | `Stamplay.Query("type", "resource")` |
|-----------------|------|
| greaterThan | **greaterThan(attr, value)** | 
| greaterThanOrEqual | **greaterThanOrEqual(attr, value)** | 
| lessThan | **lessThan(attr, value)** | 
| lessThanOrEqual | **lessThanOrEqual(attr, value)** | 
| pagination | **pagination(page, per_page)** |
| between | **between(attr, value1, value2)** |
| equalTo | **equalTo(attr, value)** | 
| exists | **exists(attr)** | 
| notExists | **notExists(attr)** | 
| sortAscending | **sortAscending(attr)** | 
| sortDescending | **sortDescending(attr)** |
| populate | **populate()** |
| populateOwner | **populateOwner()** |
| select | **select(attr,...)** |
| regex | **regex(attr, regex, options)** |
| near | **near(type, coordinates, maxDistance, minDistance)** |
| nearSphere | **nearSphere(type, coordinates, maxDistance, minDistance)** |
| geoIntersects | **geoIntersects(type, coordinates)** |
| geoWithinGeometry | **geoWithinGeometry(type, coordinates)** |
| geoWithinCenterSphere | **geoWithinCenterSphere(coordinates, radius)** |
| or | **or(query,..)** | 
| exec | **exec([callback])** | 

## NodeJS SDK

~~~ shell-always
  npm install stamplay
~~~ 

~~~ javascript-always
  var stamplay = require("stamplay"),
  Stamplay = new stamplay("APP ID", "API KEY")

~~~ 

The Node.js SDK is a server side library to help simplify admin interaction with the Stamplay API.

To install the Node.js SDK, run `npm install` for the `stamplay`.

To initialize the SDK within your server side enviornment, first `require` the module, then create a new instance of the module require and pass in your `APP ID` and `API KEY` credentials as seperate arguments.

Our [Node.js SDK is open source on Github](https://github.com/Stamplay/stamplay-nodejs-sdk)!

### Node.js API Reference

The JavaScript SDK exposes the following components and methods:

#### Users

| [User](#users) | `Stamplay.User` |
|----------|-------------|
| save | **save(data, [callback])** |
| get | **get(data, [callback])** | 
| remove | **remove(id, [callback])** |
| update | **update(id, data, [callback] )** | 

#### Objects

| [Object](#objects) | `Stamplay.Object("cobject")` |
|----------|-------------|
| save | **save(data, [callback])** |
| get | **get(data, [callback])** | 
| remove | **remove(id, [callback])** |
| update | **update(id, data, [callback])** |
| patch | **patch(id, data, [callback])** | 
| upVote | **upVote(id, [callback])** |
| downVote | **downVote(id, [callback])** |
| rate | **rate(id, rate, [callback])** |
| comment | **comment(id, text, [callback])** | 
| push | **push(id, attribute, data, [callback])** | 

#### Code Blocks

| [Code Block](#code-blocks) | `Stamplay.Codeblock("codeblock")` |
|----------|-------------|
| run | **run(data, queryParams, [callback])** |  

#### Webhooks

| [Webhook](#webhooks) | `Stamplay.Webhook("webhook")` |
|----------|-------------|
| post | **post(data, [callback])** |  

#### Stripe

| [Stripe](#stripe) | `Stamplay.Stripe` |
|----------|-------------|
| createSubscriptionuserId | **createSubscriptionuserId, planId, [callback])** | 
| deleteSubscription | **deleteSubscription(userId, subscriptionId, options, [callback])** | 
| getSubscription | **getSubscription(userId, subscriptionId, [callback])** | 
| getSubscriptions | **getSubscriptions(userId, options, [callback])** | 
| updateSubscription | **updateSubscription(userId, subscriptionId, options, [callback])** | 

#### Queries

|[Query](#advanced-queries)| `Stamplay.Query("type", "resource")` |
|--|--------------------------|
| greaterThan | **greaterThan(attr, value)** |  
| greaterThanOrEqual | **greaterThanOrEqual(attr, value)** | 
| lessThan | **lessThan(attr, value)** | 
| lessThanOrEqual | **lessThanOrEqual(attr, value)** |
| pagination | **pagination(page, per_page)** |
| between | **between(attr, value1, value2)** | 
| equalTo | **equalTo(attr, value)** |  
| exists | **exists(attr)** |  
| notExists | **notExists(attr)** | 
| sortAscending | **sortAscending(attr)** | 
| sortDescending | **sortDescending(attr)** |
| populate | **populate()** |
| populateOwner | **populateOwner()** | 
| select | **select(attr,...)** |
| regex | **regex(attr, regex, options)** | 
| near | **near(type, coordinates, maxDistance, minDistance)** | 
| nearSphere | **nearSphere(type, coordinates, maxDistance, minDistance)** | 
| geoIntersects | **geoIntersects(type, coordinates)** |
| geoWithinGeometry | **geoWithinGeometry(type, coordinates)** |
| geoWithinCenterSphere | **geoWithinCenterSphere(coordinates, radius)** |  
| or | **or(query,..)** |  
| exec | **exec([callback])** |  

