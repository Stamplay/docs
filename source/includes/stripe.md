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
    },
       function(err) {
      // error
    })
~~~

~~~ nodejs
  // no method
~~~

> The JSON response looks like this.

~~~ json

{
  "__v":0,
  "livemode" : false,
  "customer_id" : "cus_8GrAxVnGSGHKxv",
  "userId" : "571021095743954537b8c0cd",
  "appId" : "APP-ID",
  "_id" : "57102131da5d4db251c71c76",
  "dt_create" : "2016-04-14T23:01:05.995Z",
  "subscriptions" : [],
  "billingHistory" : [],
  "id" : "57102131da5d4db251c71c76"
}

~~~

Add a new customer on Stripe.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of the  user to add as a Stripe Customer | <i class="unchecked"></i> |




## Subscriptions

Subscriptions allow you to charge a customer's card on a recurring basis. A subscription ties a customer to a particular plan you've created.

### Fetch User Subscription

~~~ shell
  curl -X "GET" "https://stripe-docs.stamplayapp.com/api/stripe/v1/customers/:userId/subscriptions/:subscriptionId"
~~~

~~~ javascript
  Stamplay.Stripe.getSubscription("userId",
     "subscriptionId")
      .then(function(res) {
        // success
      },
         function(err){
        // error
      })
~~~

~~~ nodejs
  // no method
~~~

> The JSON response looks like this.

~~~ json
{
  "id":"sub_8GrYtVQuzArBMy",
  "object":"subscription",
  "application_fee_percent":null,
  "cancel_at_period_end":false,
  "canceled_at":null,
  "current_period_end":1463268296,
  "current_period_start":1460676296,
  "customer":"cus_8GrAxVnGSGHKxv",
  "discount":null,
  "ended_at":null,
  "metadata":{},
  "plan":{
    "id":"subscription_one",
    "object":"plan",
    "amount":999,
    "created":1460675091,
    "currency":"usd",
    "interval":"month",
    "interval_count":1,
    "livemode":false,
    "metadata":{},
    "name":"Subscription One",
    "statement_descriptor":"Sub One",
    "trial_period_days":null,
    "statement_description":"Sub One"
  },
  "quantity":1,
  "start":1460676296,
  "status":"active",
  "tax_percent":null,
  "trial_end":null,
  "trial_start":null
}
~~~
Retrieve a user subscription by a subscription ID.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of a user with a subscription | <i class="unchecked"></i> |
| `subscriptionId` | the Stripe identifier of the subscription to fetch | <i class="unchecked"></i> |

### Fetch User's Subscriptions

~~~ shell
  curl -X "GET" "https://APP-ID.stamplayapp.com/api/stripe/v1/customers/:userId/subscriptions"
~~~

~~~ javascript
  Stamplay.Stripe.getSubscriptions("userId",
     options)
      .then(function(res) {
        // success
      },
         function(err){
        // error
      })
~~~

~~~ nodejs
  // no method
~~~

> The JSON response looks like this.

~~~ json

{
  "object":"list",
  "data":[
    {
      "id":"sub_8GrYtVQuzArBMy",
      "object":"subscription",
      "application_fee_percent":null,
      "cancel_at_period_end":false,
      "canceled_at":null,
      "current_period_end":1463268296,
      "current_period_start":1460676296,
      "customer":"cus_8GrAxVnGSGHKxv",
      "discount":null,
      "ended_at":null,
      "metadata":{},
      "plan":{
        "id":"subscription_one",
        "object":"plan",
        "amount":999,
        "created":1460675091,
        "currency":"usd",
        "interval":"month",
        "interval_count":1,
        "livemode":false,
        "metadata":{},
        "name":"Subscription One",
        "statement_descriptor":"Sub One",
        "trial_period_days":null,
        "statement_description":"Sub One"
      },
      "quantity":1,
      "start":1460676296,
      "status":"active",
      "tax_percent":null,
      "trial_end":null,
      "trial_start":null
    }
  ],
  "has_more":false,
  "url":"/v1/customers/cus_8GrAxVnGSGHKxv/subscriptions"
}

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
  Stamplay.Stripe.createSubscription("userId",
     "planId")
      .then(function(res) {
        // success
      },
         function(err){
        // error
      })
~~~

~~~ nodejs
  // no method
~~~

> The JSON response looks like this.

~~~ json
{
  "id":"sub_8GrYtVQuzArBMy",
  "object":"subscription",
  "application_fee_percent":null,
  "cancel_at_period_end":false,
  "canceled_at":null,
  "current_period_end":1463268296,
  "current_period_start":1460676296,
  "customer":"cus_8GrAxVnGSGHKxv",
  "discount":null,
  "ended_at":null,
  "metadata":{},
  "plan":{
    "id":"subscription_one",
    "object":"plan",
    "amount":999,
    "created":1460675091,
    "currency":"usd",
    "interval":"month",
    "interval_count":1,
    "livemode":false,
    "metadata":{},
    "name":"Subscription One",
    "statement_descriptor":"Sub One",
    "trial_period_days":null,
    "statement_description":"Sub One"
  },
  "quantity":1,
  "start":1460676296,
  "status":"active",
  "tax_percent":null,
  "trial_end":null,
  "trial_start":null
}
~~~

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of the user to add a subscriptions for | <i class="unchecked"></i> |
| `planId` | the Stripe identifier of the subscription to add | <i class="unchecked"></i> |

### Update Subscription

Update a subscription for a Stripe customer.

~~~ shell
  curl -X "PUT" "https://APP-ID.stamplayapp.com/api/stripe/v1/customers/:userId/subscriptions/:subscriptionId" \
    -H "Content-Type: application/json" \
    -d "{\"options\":\"{ \"plan\" : \"subscription_one\"}\"}"
~~~

~~~ javascript
  Stamplay.Stripe.updateSubscription("userId", "planId",
     { "plan : subscription_one" })
      .then(function(res) {
        // success
      },
         function(err){
        // error
      })
~~~

~~~ nodejs
  // no method
~~~

> The JSON response looks like this.

~~~ json
{
  "id":"sub_8GrYtVQuzArBMy",
  "object":"subscription",
  "application_fee_percent":null,
  "cancel_at_period_end":false,
  "canceled_at":null,
  "current_period_end":1463268296,
  "current_period_start":1460676296,
  "customer":"cus_8GrAxVnGSGHKxv",
  "discount":null,
  "ended_at":null,
  "metadata":{},
  "plan":{
    "id":"subscription_two",
    "object":"plan",
    "amount":1999,
    "created":1460676804,
    "currency":"usd",
    "interval":"month",
    "interval_count":1,
    "livemode":false,
    "metadata":{},
    "name":"Subscription Two",
    "statement_descriptor":"Sub Two",
    "trial_period_days":null,
    "statement_description":"Sub Two"
  },
  "quantity":1,
  "start":1460695662,
  "status":"active",
  "tax_percent":null,
  "trial_end":null,
  "trial_start":null
}

~~~

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of the user to update a subscriptions for | <i class="unchecked"></i> |
| `subscriptionId` | the Stripe `_id` of the subscription to update| <i class="unchecked"></i> |
| `options` | a set of options for updating a subscription, see [Stripe Documentation](https://stripe.com/docs/api/node#update_subscription) for details| <i class="unchecked"></i> |

### Remove Subscription

Remove a subscription from a Stripe customer.

~~~ shell
  curl -X "DELETE" "https://APP-ID.stamplayapp.com/api/stripe/v1/customers/:userId/subscriptions" \
    -H "Content-Type: application/json" \
    -d "{\"options\":\"{}\"}"
~~~

~~~ javascript
  Stamplay.Stripe.deleteSubscription("userId",
     "planId")
      .then(function(res) {
        // success
      },
         function(err){
        // error
      })
~~~

~~~ nodejs
  // no method
~~~

> The JSON response looks like this.

~~~ json

{
  "id":"sub_8GrYtVQuzArBMy",
  "object":"subscription",
  "application_fee_percent":null,
  "cancel_at_period_end":false,
  "canceled_at":1460695945,
  "current_period_end":1463268296,
  "current_period_start":1460676296,
  "customer":"cus_8GrAxVnGSGHKxv",
  "discount":null,
  "ended_at":1460695945,
  "metadata":{},
  "plan":{
    "id":"subscription_two",
    "object":"plan",
    "amount":1999,
    "created":1460676804,
    "currency":"usd",
    "interval":"month",
    "interval_count":1,
    "livemode":false,
    "metadata":{},
    "name":"Subscription Two",
    "statement_descriptor":"Sub Two",
    "trial_period_days":null,
    "statement_description":"Sub Two"
  },
  "quantity":1,
  "start":1460695662,
  "status":"canceled",
  "tax_percent":null,
  "trial_end":null,
  "trial_start":null
}

~~~

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `userId` | the Stamplay `_id` of the user to remove a subscriptions for | <i class="unchecked"></i> |

## Cards

You can store multiple cards on a customer in order to charge the customer later.

### Fetch A User's Card

Retrieve a Stripe customer's card.

~~~ shell
  curl -X "GET" "https://APP-ID.stamplayapp.com/api/stripe/v1/customers/:userId/cards"
~~~

~~~ javascript
  Stamplay.Stripe.getCreditCard("userId")
    .then(function(res) {
      // success
    },
       function(err){
      // error
    })
~~~

~~~ nodejs
  // no method
~~~

> The JSON response looks like this.

~~~ json

{
  "last4":"4242",
  "fingerprint":"0YBm29b7kpk2tbQe",
  "exp_year":"2017",
  "exp_month":"12",
  "cvc_check":"pass",
  "country":"US",
  "card_id":"card_180Jb6JGp443qx8tOrIZ89PM",
  "brand":"Visa"
}

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
  Stamplay.Stripe.createCreditCard("userId",
     "token")
    .then(function(res) {
      // success
    },
       function(err){
      // error
    })
~~~

~~~ nodejs
  // no method
~~~

> The JSON response looks like this.

~~~ json

{
  "card_id":"card_180Jb6JGp443qx8tOrIZ89PM",
  "last4":"4242",
  "brand":"Visa",
  "exp_month":"12",
  "exp_year":"2017",
  "fingerprint":"0YBm29b7kpk2tbQe",
  "country":"US",
  "cvc_check":"pass"
}

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
  Stamplay.Stripe.updateCreditCard("userId",
     "token")
    .then(function(res) {
      // success
    },
       function(err){
      // error
    })
~~~

~~~ nodejs
  // no method
~~~

> The JSON response looks like this.

~~~ json

{
  "last4":"4242",
  "fingerprint":"0YBm29b7kpk2tbQe",
  "exp_year":"2017",
  "exp_month":"12",
  "cvc_check":"pass",
  "country":"US",
  "card_id":"card_180Jb6JGp443qx8tOrIZ89PM",
  "brand":"Visa"
}

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
    -d "{\"userId\":\"51e554184d88a4452c002233\",
      \"token\":\"card_id\",
      \"amount\":500,
      \"currency\":\"USD\"}"
~~~

~~~ javascript
  Stamplay.Stripe.charge("userId",
     "token",
     "amount",
     "currency")
    .then(function(res) {
      // Success
    },
       function(err){
      // Handle Error
    });
      
~~~

~~~ nodejs
  // no method
~~~

> The JSON response looks like this.

~~~ json
{
  "id":"ch_180P6uJGp443qx8tho9DlZ5c",
  "object":"charge",
  "amount":1699,
  "amount_refunded":0,
  "application_fee":null,
  "balance_transaction":"txn_180P6vJGp443qx8twAGVDTIl",
  "captured":true,
  "card":{
    "id":"card_180Jb6JGp443qx8tOrIZ89PM",
    "object":"card",
    "address_city":null,
    "address_country":null,
    "address_line1":null,
    "address_line1_check":null,
    "address_line2":null,
    "address_state":null,
    "address_zip":null,
    "address_zip_check":null,
    "brand":"Visa",
    "country":"US",
    "customer":"cus_8GrAxVnGSGHKxv",
    "cvc_check":null,
    "dynamic_last4":null,
    "exp_month":12,
    "exp_year":2017,
    "fingerprint":"0YBm29b7kpk2tbQe",
    "funding":"credit",
    "last4":"4242",
    "metadata":{},
    "name":null,
    "tokenization_method":null
  },
  "created":1460696596,
  "currency":"usd",
  "customer":"cus_8GrAxVnGSGHKxv",
  "description":null,
  "destination":null,
  "dispute":null,
  "failure_code":null,
  "failure_message":null,
  "fraud_details":{},
  "invoice":null,
  "livemode":false,
  "metadata":{},
  "order":null,
  "paid":true,
  "receipt_email":"isaiahgrey@gmail.com",
  "receipt_number":null,
  "refunded":false,
  "refunds":{
    "object":"list",
    "data":[],
    "has_more":false,
    "total_count":0,
    "url":"/v1/charges/ch_180P6uJGp443qx8tho9DlZ5c/refunds"
  },
  "shipping":null,
  "source":{
    "id":"card_180Jb6JGp443qx8tOrIZ89PM",
    "object":"card",
    "address_city":null,
    "address_country":null,
    "address_line1":null,
    "address_line1_check":null,
    "address_line2":null,
    "address_state":null,
    "address_zip":null,
    "address_zip_check":null,
    "brand":"Visa",
    "country":"US",
    "customer":"cus_8GrAxVnGSGHKxv",
    "cvc_check":null,
    "dynamic_last4":null,
    "exp_month":12,
    "exp_year":2017,
    "fingerprint":"0YBm29b7kpk2tbQe",
    "funding":"credit",
    "last4":"4242",
    "metadata":{},
    "name":null,
    "tokenization_method":null
  },
  "source_transfer":null,
  "statement_descriptor":null,
  "status":"paid",
  "statement_description":null
}
~~~

| Attribute  |         | Optional                  |
|------------|---------|:-------------------------:|
| `userId`   | the Stamplay `_id` of the user to charge | <i class="unchecked"></i> |
| `token`    | the Stripe identifier for the customer card to charge | <i class="unchecked"></i> |
| `amount`   | the amount in cents to charge | <i class="unchecked"></i> |
| `currency` | a 3-letter ISO code for currency, default `USD` | <i class="checked"></i> |
