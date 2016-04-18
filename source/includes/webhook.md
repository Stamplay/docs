# Webhooks
Webhooks are "user defined HTTP callbacks".

With Stamplay, Webhooks can be used as custom event triggers for 3rd-Party Integrations, Code Blocks, or Core Services.

## Creating Webhooks

To create a webhook, visit the Stamplay Editor for the application you would like to add a webhook for.

Navigate to the **Webhooks** section, enter a name for your Webhook and **Create**.

!(Web Hook Create)[images/webhook.create.png]

Any Webhook created is is available at:

* [https://APP-ID.stamplayapp.com/api/webhook/v1/:webhookId/catch](https://APP-ID.stamplayapp.com/api/webhook/v1/:webhookId/catch)

## Using Webhooks

Webhooks can be used to capture events and used to pass data along to that event.

<div class="lang-content shell">
  To post data to a Webhook, make a `POST` request to a webhook url you have made in the Stamplay editor, including any data to pass into the Webhook as the request body.
</div>

<div class="lang-content javascript">
  To post data to a Webhook, use the `post` method on `Stamplay.Webhook("webhook_id")`, include any data to pass into the Webhook as the first method argument.
</div>

~~~ shell
  curl -X "POST" "https://APP-ID.stamplayapp.com/api/webhook/v1/:webhook_id/catch" \
    -H "Content-Type: application/json" \
    -d "{\"name\":\"John\"}"
~~~

~~~ javascript
  Stamplay.Webhook("webhook_id")
    .post({ name : "Johne" })
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })

~~~

~~~ nodejs
  // no method
~~~