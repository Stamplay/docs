# Roles

Stamplay supports role based access control for a fine grained authorization layer if needed.

Roles provide a logical way of grouping users with common access privileges to your data and how a user is able to perform CRUD operations on a resource.

Roles can be created and deleted only inside Stamplay but you can assign them to your users via APIs.

## How Roles Work

To Do

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

## Assign Role

```shell
	curl -X "PATCH" "https://APPID.stamplayapp.com/api/user/v1/users/" \
	-H "Content-Type: application/json" \
	-d "{\"givenRole\":\"role_id\"}"

```

```javascript
	Stamplay.User.patch("user_id", { givenRole : "role_id" })
		.then(function(res) {
			// success
		}, function(err) {
			// error
		})
```

```nodejs
	Stamplay.User.patch("user_id", { givenRole : "role_id" }, function(err, res) {
		// success
	})
```


To assign a new role to a user, send a `PATCH` request with the `givenRole` property as the unique `_id` of the role to assign in the request body, to the User API resource with the user's `_id` as part of the URI.