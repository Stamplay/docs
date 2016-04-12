# Objects

## Schemas

Schemas are defined data structures that enfore type validation.

They can be created throught Stamplay Editor, inside the **Object** section.

Below is an example schema of a **Restaurant** with every possible data type available as a field type.

There are 3 properties that are included by default:

| Attribute   |         |
|-------------|---------|
| `dt_create` | The date the record was created |
| `dt_update` | The date the record was last updated |
| `owner`     | The `_id` of the user who created this object. |

<aside class="notice">
  The **owner** field is only set automatically when using the **JavaScript SDK**. For all other requests, you must set this field manually.
</aside>

## Data Types

The types and formats of each field type is listed below:

> In the example schema object below, each key-value pair is a possible schema property type, and a valid value for that property type.

~~~ json

{
  "boolean" : true,
  "string" : "Hello World",
  "number" : 45,
  "float" : 3.14,
  "plain_object" : {
    "prop_one" : "GoodBye World",
    "prop_two" : 1200
  },
  "array_number" : [23, 76, 345],
  "array_string" : ["Hello", "World"],
  "date" : "2016-03-10T14:51:28.625Z",
  "file" : "https://file-upload.stamplayapp.com/upload/cobject/image/1458238116389_file-upload.png",
  "_geolocation" : {
    "type" : "Point",
    "coordinates ": [
      12.4608,
      41.9015
    ]
  },
  "object_relation_array" : [ "562c45af4c0f20367d7ca4be", "562ec06e77589e2e0f86c207"],
  "user_relation_string" : "562bb24e007983c67c8ee9df"
}  
~~~ 

| Type                    | Summary                                                 |
|-------------------------|---------------------------------------------------------|
| [Boolean](#boolean) | A boolean value type |
| [String](#string) | String value type. Strings are stored as UTF-8. |
| [Number](#number) | An integer value type. |
| [Float](#float) | A float value type. |
| [Plain Object](#plain-object) | A Javascript object. |
| [Array - Number](#array-number) | An array of integer value types. |
| [Array - String](#array-string) | An array of string value types. |
| [Date](#date) | Date value type. Dates are stored in ISODateTimeFormat. |
| [File](#file) | Any kind of file. Location of the resource uploaded.    |
| [Geolocation](#geolocation) | GeoJSON object. |
| [Object Relation - Array](#object-relation) | An arrays of pointers to an specific object type. |
| [User Relation - String](#user-relation)| A pointer to a user object. |

### Boolean

~~~ javascript-always
  {
    _id: "56cf08e362641ca813b1ae6c",
    verified : true
  }
~~~ 

A **Boolean** type is a `true` or `false` value.

### String

~~~ javascript-always
  {
    _id: "56cf08e362641ca813b1ae6c",
    name : "John"
  }
~~~ 

A **String** type is a series of characters enclosed by single, or double quotes.

### Number

~~~ javascript-always
  {
    _id: "56cf08e362641ca813b1ae6c",
    age : 29
  }
~~~ 

A **Number** type is an integer value type without a period or exponent notation.

### Float

~~~ javascript-always
  {
    _id: "56cf08e362641ca813b1ae6c",
    pie : 3.14
  }
~~~ 

A **Float** type is an integer value type with a period or exponent notation.

### Plain Object

~~~ javascript-always
  {
    _id: "56cf08e362641ca813b1ae6c",
    car : {
      color : "blue",
      year : 2014,
      automatic : false
    }
  }
~~~ 

A **Plain Object** type is a plain javascript object. The property `car` is a plain object type in the example.

### Array - Number

~~~ javascript-always
  {
    _id: "56cf08e362641ca813b1ae6c",
    colors : [12, 43, 235, 66]
  }
~~~ 

An **Array** of **Number** value types:

### Array - String

~~~ javascript-always
  {
    _id: "56cf08e362641ca813b1ae6c",
    colors : ["yellow", "green", "blue", "red"]
  }
~~~ 

An **Array** of **String** value types:

### Date

~~~ javascript-always
    {
      _id : "56cf08e362641ca813b1ae6c",
      start_date : "2016-03-10T14:51:28.625Z"
    }
~~~ 
        

~~~ javascript-always
  {
      _id : "56cf08e362641ca813b1ae6c",
      end_date : "Thu, 10 Mar 2016 14:51:43 GMT"
    }
~~~  

A **Date** type is a date string in either the [ISO 8601](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toISOString) format, or [RFC-1123](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toUTCString) format.

The property `start_date` is a Date type in **ISO 8601** format in the first example.     

The property `end_date` is a Date type in **RFC-1123** format in the last example.


### File

~~~ javascript-always
  {
    _id : "56cf08e362641ca813b1ae6c",
    profile_image : "https://[APPID].stamplayapp.com/upload/cobject/[cobject-name]/1457032441927_stamplay.png"
  }
~~~ 

A **File** type is a file upload. Any kind of file is accepted. When a file is uploaded, and saved, the property will be a link to the file upload location.

To save a file type, the request must be sent as `multipart/form-data`.

The `profile_image` is an example of a **File** type in the example.

### Geolocation

~~~ javascript-always
  {
    _id: "56cf08e362641ca813b1ae6c",
    _geolocation : {
      type: "Point",
      coordinates: [
        12.4608,
        41.9015
      ]
    }
  }
~~~ 

A **Geolocation** type is stored as **GeoJSON** object with this coordinate-axis order: `longitude`, `latitude`.

A Point stored on Stamplay will look like the example:
            
Currently supported data types are:

* - [Point](https://docs.mongodb.org/manual/reference/geojson/#point)
* - [LineString](https://docs.mongodb.org/manual/reference/geojson/#linestring)
* - [Polygon](https://docs.mongodb.org/manual/reference/geojson/#polygon)
* - [MultiPoint](https://docs.mongodb.org/manual/reference/geojson/#multipoint)
* - [MultiLineString](https://docs.mongodb.org/manual/reference/geojson/#multilinestring)
* - [MultiPolygon](https://docs.mongodb.org/manual/reference/geojson/#multipolygon)

In order to save any instance of geolocation data you need to send the complete **GeoJSON** representation.

To make this easier if you want to create a Point you're allowed to send an array of coordinates in `longitude, latitude` format and Stamplay will create the **GeoJSON** for you.

### Object Relation

~~~ javascript-always
  {
    _id : "56cf08e362641ca813b1ae6c",
    solutions : ["6c641c8a81e3625f03b1ae6c", "3b1ae6c8a81e3625f06c641c", "825f06c641c3ba81e361ae6c", "f06c641c3b8a81e3625ae6c"]
  }
~~~ 

A **Object Relation** is set of pointers to another object.

Select the **Object Relation - [Object Name]** from the dropdown to the object type to point to. The pointers are each a `_id` of another object. This field can be populated.

The `solutions` property is an example of a **Object Relation** type in the example.

### User Relation

~~~ javascript-always
  {
    _id : "56cf08e362641ca813b1ae6c",
    author : "8a81e3625f06c641c3b1ae6c"
  }
~~~ 

A **User Relation** is a pointer to a user object represented by an `_id` of a user. This field can be populated. The `author` property is an example of a `User Relation` in the example.

## Permissions

With permissions at an Object level, you define who can perform operations on your data. You can do that by choosing a preset or creating your own permission model.

![Permissions Overview](/images/object-permissions-overview.png)

We’ve identified some commonly used permission patterns (we refer to them as "policies"). Stamplay provides an easy way to use these patterns on the data your app manages. These policies offer a convenient mechanism for supporting very common security scenarios without having to manage complex settings:

- **Private**: Use this preset if you want to make users’ data inaccessible to other users. Any user will be able to read and write only his or her own information.

- **Public**: When this policy is applied to user profiles, any user can read and write any other user's information. Proceed with caution.

- **Read-only**: Use this preset if you want users to read all profiles, but you don’t want to give them permission to write any profile information.

- **Shared**: This preset is suitable for social apps; any user can modify his or her own profile and can read all other user profiles.

If the predefined security policies are not flexible enough for your app and you have created your own user roles, you can choose to use role-based security. The settings specify whether a role is allowed to create, read, update or delete items.

## Create
~~~ shell
  curl -X "POST" "https://APPID.stamplayapp.com/api/cobject/v1/object" \
    -H "Content-Type: application/json" \
    -d "{\"title\":\"\\\"Hello World\\\"\",\"year\":\"2016\"}"
~~~ 

~~~ javascript
  var data = {
    title : "Hello World",
    year : 2016
  }

  Stamplay.Object("movie").save(data)
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })

~~~ 

~~~ nodejs
  var data = {
    title : "Hello World",
    year : 2016
  }

  Stamplay.Object("movie").save(data, function(err, res) {
      // response
  })
~~~ 

To create new object data for a particular model, send the data in the body of a`POST` request to the Object resource, specifying the object type in the URI.

<aside class="notice">
  The data sent in the request body must validate against the schema defined for the particular object resource being saved.
</aside>

## Fetch Objects

Retrieve an individual object, all objects, or any matching specific criteria of a particular model type.

### Fetch Object By Id

~~~ shell
  curl -X "GET" "https://APPID.stamplayapp.com/api/cobject/v1/movie/:object_id"
~~~ 

~~~ javascript
  Stamplay.Object("movie").get({ _id : "object_id"})
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~ 

~~~ nodejs
  Stamplay.Object("movie").get({ _id : "object_id"}, function(err, res) {
      // response
  })
~~~ 

To fetch a single object, send a `GET` request to the Object resource with the object's `_id` in the URI.

The object type for the example is `movie`.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `object_id` | the Stamplay `_id` of the object to retrieve | <i class="unchecked"></i> |


### All Objects

~~~ shell
  curl -X "GET" "https://APPID.stamplayapp.com/api/cobject/v1/movie"
~~~ 

~~~ javascript
  Stamplay.Object("movie").get({})
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~ 

~~~ nodejs
  Stamplay.Object("movie").get({}, function(err, res) {
      // response
  })
~~~ 

To fetch all objects, send a `GET` request to the Object resource.

The object type for the example is `movie`.

### Query Objects

~~~ shell
  curl -X "GET" "https://APPID.stamplayapp.com/api/cobject/v1/movie?title=Hello%20World&year=1998"
~~~ 

~~~ javascript
  var query = {
    title : "Hello World",
    year : 1998
  }

  Stamplay.Object("movie").get(query)
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~ 

~~~ nodejs
  var query = {
    title : "Hello World",
    year : 1998
  }

  Stamplay.Object("movie").get(query, function(err, res) {
      // response
  })
~~~ 

To fetch all objects that match a certain parameters, send a `GET` request to the Object resource with any parameters to match in the request body.

The object type for the example is `movie`.

### Find By Current User

~~~ shell
  curl -X "GET" "https://APPID.stamplayapp.com/api/cobject/v1/movie/find/:attributes"
~~~ 

~~~ javascript
  var attrs = ["owner", "contributor"];

  // default attribute is owner is no arguments are passed to method

  Stamplay.Object("movie").findByCurrentUser(attrs)
    .then(function(res) {
      // Success
    }, function(err) {
      // Error
    }))
~~~ 

~~~ nodejs
  // no method
~~~ 

To find all objects with attributes that match the current user's `_id`. Specify the attributes to match against with a comma delimited list.

Make a `GET` request to the Object resource for the object model. Specifying the attributes in the resource URI.

The object type for the example is `movie`.

## Update Objects

To update an object record partially, or completely overwrite the existing record.

### Partial Update

~~~ shell
  curl -X "PATCH" "https://APPID.stamplayapp.com/api/cobject/v1/movie/:object_id" \
    -H "Content-Type: application/json" \
    -d "{\"title\":\"Goodbye World\"}"
~~~ 

~~~ javascript
  var data = {
    "title" : "Goodbye World"
  }

  Stamplay.Object("movie").patch("object_id", data)
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~ 

~~~ nodejs
  var data = {
    "title" : "Goodbye World"
  }

  Stamplay.Object("movie").patch("object_id", data, function(err, res) {
    // response
  })
~~~ 

To make a partial update to an object record, perform a `PATCH` request to the Object API resource with any fields to update on the stored record in the request body.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `object_id` | the Stamplay `_id` of the object to update | <i class="unchecked"></i> |


The object type for the example is `movie`.

### Complete Update

~~~ shell
  curl -X "PUT" "https://APPID.stamplayapp.com/api/cobject/v1/movie/:object_id" \
    -H "Content-Type: application/json" \
    -d "{\"title\":\"Goodbye World\",\"year\":\"2001\"}"
~~~ 

~~~ javascript
  var data = {
    "title" : "Goodbye World"
  }

  Stamplay.Object("movie").update("object_id", data)
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~ 

~~~ nodejs
  var data = {
    "title" : "Goodbye World"
  }

  Stamplay.Object("movie").update("object_id", data, function(err, res) {
    // response
  })
~~~ 

To overwrite an object record, perform a `PUT` request to the Object API resource with a complete represenation to write over the stored record in the request body.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `object_id` | the Stamplay `_id` of the object to update | <i class="unchecked"></i> |

## Remove Objects

To remove an object record, send a `DELETE` request with the `_id` of the record to remove in the Object API resource URI.

~~~ shell
  curl -X "DELETE" "https://APPID.stamplayapp.com/api/cobject/v1/movie/:object_id"
~~~ 

~~~ javascript
  Stamplay.Object("movie").remove("object_id")
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~ 

~~~ nodejs
  Stamplay.Object("movie").remove("object_id", function(err, res) {
    // response
  })
~~~ 

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `object_id` | the Stamplay `_id` of the object to remove | <i class="unchecked"></i> |

## Relationships

Data relationships are pointers from one record to another.

### User Relationship

~~~ shell
  curl -X "PATCH" "https://APPID.stamplayapp.com/api/cobject/v1/movie/:object_id" \
    -H "Content-Type: application/json" \
    -d "{\"director\":\"56cf08e362641ca813b1ae6c\"}"
~~~ 

~~~ javascript
  Stamplay.Object("movie").patch("object_id", { director: "56cf08e362641ca813b1ae6c" })
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~ 

~~~ nodejs
  Stamplay.Object("movie").patch("object_id", { director: "56cf08e362641ca813b1ae6c" }, function(err, res) {
    // response
  })
~~~ 

A **User** relationship is a pointer to a user record. This field type is to be set only as an `_id` of a user record.

This is so it may be populated with the parent object, eliminating the need for a subsequent request to fetch the relationship data. To populate the `owner` field, include the query parameter `populate_owner` as `true` in your request.

The `owner` property is a default User relationship, but others can be added through the Stamplay editor.

To manage these relationships, just update this field to the "_id" of the User to reference in the relationship.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `object_id` | the Stamplay `_id` of the object to update | <i class="unchecked"></i> |

In this example, `movie` is the object type, and the `director` field is a User Relationship field.

### Object Relationships

~~~ shell
  curl -X "PATCH" "https://APPID.stamplayapp.com/api/cobject/v1/movie/:object_id" \
    -H "Content-Type: application/json" \
    -d "{\"characters\":[\"57cf08e362641ca813b1ae6c\",\"56cf09e362641sa813b1ae6d\",\"54cfdae662641ca813b1ae6c\"]}"
~~~ 

~~~ javascript
  Stamplay.Object("movie").push("object_id", "characters", "57cf08e362641ca813b1ae6c")
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~ 

~~~ nodejs
  var movieChars = ["57cf08e362641ca813b1ae6c", "56cf09e362641sa813b1ae6d", "54cfdae662641ca813b1ae6c"]
  Stamplay.Object("movie").patch("object_id", movieChars, function(err, res) {
    // response
  })
~~~ 
An **Object** relationship is a pointer to another record; specifically a certain type of record as specified when defining the schema.

This field type is to contain only an array of the property `_id` of a each related record of the relationship type.

This is so it may be populated with the parent object, eliminating the need for a subsequent request to fetch the relationship data. To populate these fields, add the query parameter `populate` as `true` to your request.

To manage this relationship field, update the field to represent the collection of object references to store.

The **JavaScript SDK** has a `push` method to allow an easier method for pushing new relationships onto the array field. See the example in the `JavaScript` tab, otherwise you will need to manage this manually by sending a complete copy of the field in the request.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `object_id` | the Stamplay `_id` of the object to add a relationship to | <i class="unchecked"></i> |

In this example, `movie` is the object type, and the `characters` field is a **Object Relationship** field.

## Voting

The Stamplay API provides a voting mechansim for managing a vote system, tracking users who have voted, how they have voted, and the total vote count.

Each Stamplay Object is able to be voted upon, out of the box without any additional setup.

The data for voting is stored on a `actions` object on each Object.
The following data is stored :

~~~ json
{
  "actions" : {
    "votes" : {
      "users_downvote" : ["user_id"],
      "users_upvote" : ["another_user_id"],
      "users" : ["user_id", "another_user_id"],
      "total" : 2
    }
  }
}
~~~ 


### Downvoting

~~~ shell
  curl -X "PUT" "https://APPID.stamplayapp.com/api/cobject/v1/movie/:object_id/vote" \
    -H "Content-Type: application/json" \
    -d "{\"type\":\"downvote\"}"
~~~ 

~~~ javascript
  Stamplay.Object("movie").downVote("object_id")
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~ 

~~~ nodejs
  // no method
~~~ 

To downvote an object send a `PUT` request to the Object resource with the object `_id` in the URI, and a `type` property in the body specifying `downvote`.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `object_id` | the Stamplay `_id` of the object to downvote | <i class="unchecked"></i> |
| `type` | `"upvote"` or `"downvote"` | <i class="unchecked"></i> |

### Upvoting

~~~ shell
  curl -X "PUT" "https://APPID.stamplayapp.com/api/cobject/v1/movie/:object_id/vote" \
    -H "Content-Type: application/json" \
    -d "{\"type\":\"upvote\"}"
~~~ 

~~~ javascript
  Stamplay.Object("movie").upVote("object_id")
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~ 

~~~ nodejs
  // no method
~~~ 

To upvote an object send a `PUT` request to the Object resource with the object `_id` in the URI, and a `type` property in the body specifying `upvote`.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `object_id` | the Stamplay `_id` of the object to downvote | <i class="unchecked"></i> |
| `type` | `"upvote"` or `"downvote"` | <i class="unchecked"></i> |


## Commenting

~~~ shell
  curl -X "PUT" "https://APPID.stamplayapp.com/api/cobject/v1/movie/:object_id/comment" \
    -H "Content-Type: application/json" \
    -d "{\"text\":\"comment text goes here\"}"
~~~ 

~~~ javascript
  var txt = "comment text goes here";

  Stamplay.Object("movie").comment("object_id", txt)
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~ 

~~~ nodejs
  // no method
~~~ 

The Stamplay API provides a comment mechansim for managing a comment system.

Each Stamplay Object is able to be commented upon, out of the box without any additional setup.

To comment on an object send a `PUT` request to the Object resource with the object `_id` in the URI, and a `text` property in the body specifying the comment text.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `object_id` | the Stamplay `_id` of the object to add a comment to | <i class="unchecked"></i> |
| `texd` | the content of the comment | <i class="unchecked"></i> |


The data for comments is stored on a `actions` object on each Object.

For each comment, a comment object is stored in the `comments` array.

~~~ json
{
  "actions" : {
    "comments" : [
      {
        "picture": "user_image_url",
        "displayName": "user_displayName",
        "userId": "user_id",
        "text": "comment text",
        "_id": "comment_id",
        "dt_create": "date commented"
      }
    ]
  }
}
~~~ 

## Rating

~~~ shell
  curl -X "PUT" "https://APPID.stamplayapp.com/api/cobject/v1/movie/:object_id/rate" \
    -H "Content-Type: application/json" \
    -d "{\"rate\": 5}"
~~~ 

~~~ javascript

  Stamplay.Object("movie").rate("object_id", 5)
    .then(function(res) {
      // success
    }, function(err) {
      // error
    })
~~~ 

~~~ nodejs
  // no method
~~~ 

The Stamplay API provides a rate mechansim for managing a rating system.

Each Stamplay Object is able to be be rated, out of the box without any additional setup.

To rate an object send a `PUT` request to the Object resource with the object `_id` in the URI, and a `rate` property in the body specifying the rating as an integer.

| Attribute   |         | Optional                  |
|-------------|---------|:-------------------------:|
| `object_id` | the Stamplay `_id` of the object to rate | <i class="unchecked"></i> |
| `rate` | an integer rating | <i class="unchecked"></i> |


The data for `ratings` is stored on a `actions` object on each Object.


~~~ json
{
  "actions" : {
    "ratings" : {
      "users": ["user_id", "another_user_id", "third_user"],
      "avg": 4,
      "total": 3
    }
  }
}

