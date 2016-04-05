# Quickstart
## Create An Account
```shell

```
## Install CLI
## Setup SDK
## Define Schema
## Write Data

```js

  var myDinner = {
    price: 10,
    city: 'New York',
    name: 'Volare',
    description: 'a beautiful italian dinner',
    meal: {
      course_1: 'pasta',
      course_2: 'pizza'
    }
  }



  // With Callback
  Stamplay.Object('dinner')
    .save(myDinner, function(err, res) {
      if(error) return console.log(err);
      console.log(res);
  })


  // With Promise
  Stamplay.Object('dinner')
    .save(myDinner)
      .then(function(res) {
        // Success
      }, function(err) {
        // Handle Error
      })
        
```

```nodejs

  var myDinner = {
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
      if(error) return console.log(err);
      console.log(res);
  })
        
```

## Read Data
## Register Users
## Login Users
## Deploy
## What's Next?
