# Roles

Stamplay supports role based access control for a fine grained authorization layer.

## How Roles Work

Roles provide a logical way of grouping users with common access privileges.

Any permission granted to a role is implicitly granted to its users and to the users in any roles it contains.

By default, any Stamplay app has two pre-defined roles: `guest` and `registered`.

You can add as many roles as you need and define hierarchies to grant a user with role `X` the permission to change the role of another user with role `Y`.

Roles and permissions each has are defined within the Stamplay editor entirely, the API resource if for reading and assiging the roles you define only.

## Fetch All Roles

To retrieve all roles within your application, send a `GET` request to the Roles API resource.

~~~shell
curl -X "GET" "https://APPID.stamplayapp.com/api/user/v1/roles"
~~~

~~~javascript
Stamplay.User.getRoles()
  .then(function(res) {
    // success
  }, function(err) {
    // error
  })
~~~

~~~nodejs
// no method
~~~

## Fetch Individual Role

To fetch a single role, send a `GET` request to the Roles API resource, with the `_id` as part of the request URI.

~~~shell
curl -X "GET" "https://APPID.stamplayapp.com/api/user/v1/roles/:role_id"
~~~

~~~javascript
Stamplay.User.getRole("role_Id")
  .then(function(res) {
    // success
  }, function(err) {
    // error
  })
~~~

~~~nodejs
// no method
~~~

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `role_id`       | the Stamplay `_id` of the role to fetch | <i class="checked"></i> |

## Assign Role

~~~shell
curl -X "PATCH" "https://APPID.stamplayapp.com/api/user/v1/users/:user_id" \
-H "Content-Type: application/json" \
-d "{\"givenRole\":\"role_id\"}"

~~~

~~~javascript
Stamplay.User.setRole("userId", "role_id")
  .then(function(res) {
    // success
  }, function(err) {
    // error
  })
~~~

~~~nodejs
Stamplay.User.patch("user_id", { givenRole : "role_id" }, function(err, res) {
  // success
})
~~~


To assign a new role to a user, send a `PATCH` request with the `givenRole` property as the unique `_id` of the role to assign in the request body, to the User API resource with the user's `_id` as part of the URI.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `user_id` | the Stamplay `_id` of the user to assign a role | <i class="checked"></i> |
| `role_id` | the Stamplay `_id` of the role to assign to the user | <i class="checked"></i> |

