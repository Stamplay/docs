# Quickstart
## Create An Account

## Install CLI
## Setup SDK
## Define Schema
## Write Data

```js

  var dinner = {
    price: 10,
    city: 'New York',
    name: 'Volare',
    description: 'a beautiful italian dinner',
    meal: {
      course_1: 'pasta',
      course_2: 'pizza'
    }
  }

  Stamplay.Object('dinner')
    .save(dinner)
      .then(function(res) {
        // success
      }, function(err) {
        // error
      })
        
```

```nodejs

  var dinner = {
    price: 10,
    city: 'New York',
    name: 'Volare',
    description: 'a beautiful italian dinner',
    meal: {
      course_1: 'pasta',
      course_2: 'pizza'
    }
  }

  Stamplay.Object('dinner')
    .save(myDinner, function(err, res) {
      // response
  })
        
```

## Read Data
## Register Users
## Login Users
## Deploy
## What's Next?
