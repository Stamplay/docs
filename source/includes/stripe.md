# Stripe

A first class API layer for integrating Stripe into a Stamplay application.

## Customers

Stripe customers allow you to perform recurring charges and track multiple charges that are associated with the same customer.

### Add Customer

~~~ shell
  curl -X "POST" "https://APP-ID.stamplayapp.com/api/stripe/v1/customers" \
    -H "Content-Type: application/json" \
    -d "{\"userId\":\"546dc9f188104fee05000006\"}"
~~~

~~~ javascript
  Stamplay.Stripe.createCustomer("userId")
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~

~~~ nodejs
  // no method
~~~

Add a new customer on Stripe.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of the  user to add as a Stripe Customer | <i class="unchecked"></i> |




## Subscriptions

Subscriptions allow you to charge a customer's card on a recurring basis. A subscription ties a customer to a particular plan you've created.

### Fetch User Subscription

~~~ shell
  curl -X "GET" "https://APP-ID.stamplayapp.com/api/stripe/v1/:userId/subscriptions/:subscriptionId"
~~~

~~~ javascript
  Stamplay.Stripe.getSubscription("userId", "subscriptionId")
      .then(function(res) {
        // success
      }, function(err){
        // error
      })
~~~

~~~ nodejs
  // no method
~~~

Retrieve a user subscription by a subscription ID.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of a user with a subscription | <i class="unchecked"></i> |
| `subscriptionId` | the Stripe identifier of the subscription to fetch | <i class="unchecked"></i> |

### Fetch User's Subscriptions

~~~ shell
  curl -X "GET" "https://APP-ID.stamplayapp.com/api/stripe/v1/:userId/subscriptions"
~~~

~~~ javascript
  Stamplay.Stripe.getSubscriptions("userId", options)
      .then(function(res) {
        // success
      }, function(err){
        // error
      })
~~~

~~~ nodejs
  // no method
~~~

Retrieve a user's subscriptions.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of the user to fetch subscriptions for | <i class="unchecked"></i> |

### Add A Subscription

Add a new subscription to a Stripe customer.

~~~ shell
  curl -X "POST" "https://APP-ID.stamplayapp.com/api/stripe/v1/customers/:userId/subscriptions" \
    -H "Content-Type: application/json" \
    -d "{\"planId\":\"stripePlanId\"}"
~~~

~~~ javascript
  Stamplay.Stripe.createSubscription("userId", "planId")
      .then(function(res) {
        // success
      }, function(err){
        // error
      })
~~~

~~~ nodejs
  // no method
~~~

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of the user to add a subscriptions for | <i class="unchecked"></i> |
| `planId` | the Stripe identifier of the subscription to add | <i class="unchecked"></i> |

### Update Subscription

Update a subscription for a Stripe customer.

~~~ shell
  curl -X "PUT" "https://APP-ID.stamplayapp.com/api/stripe/v1/customers/:userId/subscriptions" \
    -H "Content-Type: application/json" \
    -d "{\"options\":\"{}\"}"
~~~

~~~ javascript
  Stamplay.Stripe.createSubscription("userId", "planId")
      .then(function(res) {
        // success
      }, function(err){
        // error
      })
~~~

~~~ nodejs
  // no method
~~~

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of the user to update a subscriptions for | <i class="unchecked"></i> |
| `options` | a set of options for updating a subscription, see [Stripe Documentation](https://stripe.com/docs/api/node#update_subscription) for details| <i class="unchecked"></i> |

### Remove Subscription

Remove a subscription from a Stripe customer.

~~~ shell
  curl -X "DELETE" "https://APP-ID.stamplayapp.com/api/stripe/v1/customers/:userId/subscriptions" \
    -H "Content-Type: application/json" \
    -d "{\"options\":\"{}\"}"
~~~

~~~ javascript
  Stamplay.Stripe.deleteSubscription("userId", "planId")
      .then(function(res) {
        // success
      }, function(err){
        // error
      })
~~~

~~~ nodejs
  // no method
~~~

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of the user to remove a subscriptions for | <i class="unchecked"></i> |

## Cards

You can store multiple cards on a customer in order to charge the customer later.

### Fetch User's Cards

Retrieve a Stripe customer's cards.

~~~ shell
  curl -X "GET" "https://APP-ID.stamplayapp.com/api/stripe/v1/customers/:userId/cards"
~~~

~~~ javascript
  Stamplay.Stripe.getCreditCard("userId")
    .then(function(res) {
      // success
    }, function(err){
      // error
    })
~~~

~~~ nodejs
  // no method
~~~

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of the user to fetch cards for | <i class="unchecked"></i> |

### Add A Card

Add a new card to a Stripe customer.

Obtain a token using [Stripe.js](https://stripe.com/docs/stripe.js?#card-createToken).

~~~ shell
  curl -X "POST" "https://APP-ID.stamplayapp.com/api/stripe/v1/customers/:userId/cards" \
    -H "Content-Type: application/json" \
    -d "{\"token\":\"card_token\"}"
~~~

~~~ javascript
  Stamplay.Stripe.createCreditCard("userId", "token")
    .then(function(res) {
      // success
    }, function(err){
      // error
    })
~~~

~~~ nodejs
  // no method
~~~

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of the user to add a new card for | <i class="unchecked"></i> |
| `token`  | a token obtained from [Stripe.js](https://stripe.com/docs/stripe.js?#card-createToken) | <i class="unchecked"></i> |

### Update A Card

Update a card for a Stripe customer.

Obtain a token using [Stripe.js](https://stripe.com/docs/stripe.js?#card-createToken).

~~~ shell
  curl -X "PUT" "https://APP-ID.stamplayapp.com/api/stripe/v1/customers/:userId/cards" \
    -H "Content-Type: application/json" \
    -d "{\"token\":\"card_token\"}"
~~~

~~~ javascript
  Stamplay.Stripe.updateCreditCard("userId", "token")
    .then(function(res) {
      // success
    }, function(err){
      // error
    })
~~~

~~~ nodejs
  // no method
~~~

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of the user to update a card for | <i class="unchecked"></i> |
| `token`  | a token obtained from [Stripe.js](https://stripe.com/docs/stripe.js?#card-createToken) | <i class="unchecked"></i> |

## Charges



### Create Charge

Charge a Stripe customer's card.

~~~ shell
  curl -X "POST" "https://APP-ID.stamplayapp.com/api/stripe/v1/charges" \
    -H "Content-Type: application/json" \
    -d "{\"userId\":\"51e554184d88a4452c002233\",\"token\":\"card_id\",\"amount\":500,\"currency\":\"USD\"}"
~~~

~~~ javascript
  Stamplay.Stripe.charge("userId", "token", "amount", "currency")
    .then(function(res) {
      // Success
    }, function(err){
      // Handle Error
    });
      
~~~

~~~ nodejs
  // no method
~~~

| Attribute  |         | Optional                  |
|------------|---------|:-------------------------:|
| `userId`   | the Stamplay `_id` of the user to charge | <i class="unchecked"></i> |
| `token`    | the Stripe identifier for the customer card to charge | <i class="unchecked"></i> |
| `amount`   | the amount in cents to charge | <i class="unchecked"></i> |
| `currency` | a 3-letter ISO code for currency, default `USD` | <i class="checked"></i> |
