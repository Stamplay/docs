# Roles

Stamplay supports role based access control for a fine grained authorization layer if needed.

Roles provide a logical way of grouping users with common access privileges to your data and how a user is able to perform CRUD operations on a resource.

Roles can be created and deleted only inside Stamplay but you can assign them to your users via APIs.

## Fetch All Roles

To retrieve all roles within your application, send a `GET` request to the Roles API resource.

```shell
	curl -X "GET" "https://APPID.stamplayapp.com/api/user/v1/roles"
````

```javascript
	Stamplay.User.getRoles()
		.then(function(res) {
			// success
		}, function(err) {
			// error
		})
````

```nodejs
	// no method
````

## Fetch Individual Role

To fetch a single role, send a `GET` request to the Roles API resource, with the `_id` as part of the request URI.

```shell
	curl -X "GET" "https://APPID.stamplayapp.com/api/user/v1/roles/{role_id}"
````

```javascript
	Stamplay.User.getRole("role_Id")
		.then(function(res) {
			// success
		}, function(err) {
			// error
		})
````

```nodejs
	// no method
````