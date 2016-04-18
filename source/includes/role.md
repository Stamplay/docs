# Roles

Stamplay supports role based access control for a fine grained authorization layer.

## How Roles Work

Roles provide a logical way of grouping users with common access privileges.

Any permission granted to a role is implicitly granted to its users and to the users in any roles it contains.

By default, any Stamplay app has two pre-defined roles: `guest` and `registered`.

You can add as many roles as you need and define hierarchies to grant a user with role `X` the permission to change the role of another user with role `Y`.

Roles and permissions each has are defined within the Stamplay editor entirely, the API resource if for reading and assiging the roles you define only.

## Fetch All Roles


~~~shell
curl -X "GET" "https://APP-ID.stamplayapp.com/api/user/v1/roles"
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

> The JSON response looks like this.

~~~ json
{
  "data": [
    {
      "_id": "561c001ce57bdca90ee4482a",
      "name": "guest"
    },
     {
      "_id": "561c001ce57bdca90ee4482b",
      "name": "registered"
    },
    {
      "_id": "56f8d353e252697a51cce376",
      "name": "admin"
    }
  ],
  "pagination": {
    "page": 1,
    "per_page": 20,
    "total_elements": 3,
    "total_pages": 1
  }
}
~~~

To retrieve all roles within your application, send a `GET` request to the Roles API resource.

## Fetch Individual Role

~~~shell
curl -X "GET" "https://APP-ID.stamplayapp.com/api/user/v1/roles/:role_id"
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

> The JSON response looks like this.

~~~ json

{
  "_id" : "56f8d353e252697a51cce376",
  "name" : "admin"
}

~~~

To fetch a single role, send a `GET` request to the Roles API resource, with the `_id` as part of the request URI.


| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `role_id`       | the Stamplay `_id` of the role to fetch | <i class="unchecked"></i> |

## Assign Role

~~~shell
curl -X "PATCH" "https://APP-ID.stamplayapp.com/api/user/v1/users/:user_id" \
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

> 

~~~ json

{  
  "_id":"570eb000c0d4b16b26a4bbdd",
  "email":"user@stamplay.com",
  "password":"$2a$12$lv9lbkAiwyvfT13oosMefuWHCp87NC/azMlwYwxsSUVVpw.YI0ZfO",
  "givenRole":"570ec91fb7581ccd707c4d48",
  "appId":"stamplaykb",
  "__v":0,
  "username":"",
  "displayName":"",
  "dt_update":"2016-04-13T22:33:54.595Z",
  "dt_create":"2016-04-13T20:45:52.498Z",
  "emailVerified":true,
  "verificationCode":"65d1b991bd0010536416",
  "profileImg":"",
  "id":"570eb000c0d4b16b26a4bbdd"
}

~~~


To assign a new role to a user, send a `PATCH` request with the `givenRole` property as the unique `_id` of the role to assign in the request body, to the User API resource with the user's `_id` as part of the URI.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `user_id` | the Stamplay `_id` of the user to assign a role | <i class="unchecked"></i> |
| `role_id` | the Stamplay `_id` of the role to assign to the user | <i class="unchecked"></i> |

