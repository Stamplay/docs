# Users

The base user data structure:

| Property | Summary   |
|----------|-----------|
| _id |user unique id |
| displayName | the user's displayName |
| name | the user's name |
| email | the user's email |
| identities | an object that contains social informations provided by the third party authentication services
| dt_create | a date that represent the user's signup date |
| dt_update | a date that represent the last time the user has been updated |
| givenRole | the role'sunique id |

The User data collection is schemaless, meaning that properties can be added on the go without adding them to a defined schema with specific property data types.

## Local Authentication

A local authentication flow for login and signups is baked in to every Stamplay application.

### Signup

```shell
	curl -X "POST" "https://APP-ID.stamplayapp.com/api/user/v1/users" \
		-H "Content-Type: application/json" \
		-d "{\"email\":\"user@stamplay.com\",\"password\":\"my_password\"}"
```

```javascript
	var credentials = {
		email : "user@stamplay.com",
		password : "my_password"
	}

	Stamplay.User.signup(credentials)
		.then(function(res) {
			// success
		}, function(err) {
			// error	
		})
```

```nodejs
	var credentials = {
		email : "user@stamplay.com",
		password : "my_password"
	}

	Stamplay.User.save(credentials, function(err, res) {
		// response
	})
```

To signup or add a user for a local account, send an `email` and` password` as object in the body of the request to Stamplay, with any additional data to save to the new user record.

### Login

```shell
	curl -X "POST" "https://APP-ID.stamplayapp.com/auth/v1/local/login" \
		-H "Content-Type: application/json" \
		-d "{\"email\":\"user@stamplay.com\",\"password\":\"my_password\"}"
```

```javascript
	var credentials = {
		email : "user@stamplay.com",
		password : "my_password"
	}

	Stamplay.User.login(credentials)
		.then(function(res) {
			// success
		}, function(err) {
			// error	
		})
```

```nodejs
	// no method
```

To authenticate a user's credentials for a local account, send an `email` and `password` as an object in the body of the request to Stamplay.

## Social Authentication


```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/{provider}/connect"
```

```javascript
	Stamplay.User.login("provider")
```

```nodejs
	// no method
```

Authentication via an array of different social provider is possibled by some minor configuration with the Stamplay editor, and a simple request to the Stamplay API.

###Ionic Integration

To Do

### Facebook

```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/facebook/connect"
```

```javascript
	Stamplay.User.login("facebook")
```

```nodejs
	// no method
```

---

**Create a Facebook App**

1.1. Go to Facebook developers.

	**1.2.** In the upper right corner, click on **Add a New App**.

	**1.3.** Choose the type of app you want to create.

	**1.4.** Name your Facebook App and select **Create Facebook App Id**.

	**1.5.** Skip the Quick Start by clicking on the button in the upper right corner.

---

**Configure the Facebook App Settings**

	**2.1.** Click on **Settings** in the left menu.

	**2.2.** Click on **+ Add Platform**.

	**2.3.** Fill the **Site Url** field with your Stamplay domain: [https://[APP-ID].stamplayapp.com](https://[APP-ID].stamplayapp.com) (and/or your custom domain if you have a paid plan).

	**2.4.** From the **Settings** view click on the **Advanced** tab and type in the **OAuth Redirect URIs** the following: [https://[APP-ID].stamplayapp.com/auth/v1/facebook/callback](https://[APP-ID].stamplayapp.com/auth/v1/facebook/callback) and [https://localhost:8080/auth/v1/facebook/callback](https://localhost:8080/auth/v1/facebook/callback) so that you can also test the signup flow locally when using Stamplay Command Line.
 
 ---

**Add the Facebook Integration to Stamplay**

	**3.1.** Copy the `App Id` and `App Secret` from the Facebook App and add the values to the corresponding field inside the Stamplay editor in the **Users** - **Authentication** section.
	
	**3.2.** To test the social login integration, copy and paste this link with your `APP ID` into a browser: [https://[APP-ID].stamplayapp.com/auth/v1/facebook/connect](https://[APP-ID].stamplayapp.com/auth/v1/facebook/connect). After connecting your account, check the **DATA** section to inspect the new User record created.
	
	**3.3.** The steps covered in this guide are not enough to have a Facebook app approved for production. You need to provide other information and submit the app for review; the process can take many days to complete. Refer to Facebook documentation for more information.

Stamplay asks for the following permissions:

* `public_profile`
* `email`
* `user_friends`

We store data from `public_profile` and `email`. Refer to the Facebook documentation for more information.

### Google+

```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/google/connect"
```

```javascript
	Stamplay.User.login("google")
```

```nodejs
	// no method
```

---

**Create a Google Client Id**

	**1.1.** Go to [https://code.google.com/apis/console](https://code.google.com/apis/console) and create an APIs project.
	
	**1.2.** Click on **Credentials** from the **API & Auth** section of the left menu.
	
	**1.3.** Click on **Create new Client Id** button.

---

**Configure the Client ID**

	**2.1.** Choose the type **Web application** and click on **Configure Consent Screen** button.

	**2.2.** Add the required information to the consent screen and save.

	**2.3.** Fill in the **Authorized Javascripts Origins** field with your Stamplay 
	domain: [https://[APP-ID].stamplayapp.com](https://[APP-ID].stamplayapp.com) (and/or your custom domain if you have a paid plan).

	**2.4.** Fill in the **Authorized Redirect URIs** field with the following value: [https://[APP-ID].stamplayapp.com/auth/v1/google/callback](https://[APP-ID].stamplayapp.com/auth/v1/google/callback).

	**2.5.** Click on **Create client ID**

---

**Add the Google+ Integration To Stamplay**

	**3.1.** Copy the **Client Id** and **Client Secret** from the Google App and add the values to the Stamplay app.

	**3.2.** To quickly test the integration, copy and paste this link into your browser: [https://[APP-ID].stamplayapp.com/auth/v1/google/connect](https://[APP-ID].stamplayapp.com/auth/v1/google/connect).

	**3.3.** Then click on **Users** in the left menu of the Editor to browse the data fetched.

Stamplay asks for the following permissions:

* `userinfo.profile`
* `userinfo.email`

Refer to the Google documentation for more information.

### Twitter

```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/twitter/connect"
```

```javascript
	Stamplay.User.login("twitter")
```

```nodejs
	// no method
```

---

**Create a Twitter app**
	
	**1.1.** Go to [https://apps.twitter.com/app/new](https://apps.twitter.com/app/new) to create a new Twitter app.

---

**Configure the app**

	**2.1.** Fill in name and description.
	
	**2.2.** Fill in the Website field with your Stamplay domain: [https://[APP-ID].stamplayapp.com](https://[APP-ID].stamplayapp.com) (and/or your custom domain if you have a paid plan).
	
	**2.3.** Fill in the Authorized Redirect URIs field with the following value: [https://[APP-ID].stamplayapp.com/auth/v1/twitter/callback](https://[APP-ID].stamplayapp.com/auth/v1/twitter/callback). Create the Twitter application.

---

**Add the Twitter Integration to Stamplay**

	**3.1.** Click on the **Keys and Access Tokens** tab.

	**3.2.** Copy the **Consumer Key** (API Key) and **Consumer Secret** (API Secret) from the Twitter app and add the values to the Stamplay app.

	**3.3.** To quickly test the integration, copy and paste this link into your browser: [https://[APP-ID].stamplayapp.com/auth/v1/twitter/connect](https://[APP-ID].stamplayapp.com/auth/v1/twitter/connect). Then click on **Users** in the left menu of the editor to browse the data fetched.

Stamplay collects all profile data provided.

Twitter does not have scopes, and the user `email` is not provided. You must request access from Twitter, and be whitelisted to receive user emails.

Please refer to the Twitter documentation for more information.

### Dropbox

```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/dropbox/connect"
```

```javascript
	Stamplay.User.login("dropbox")
```

```nodejs
	// no method
```

---

**Create a Drop API App**

	**1.1.** Go to [https://www.dropbox.com/developers/apps/create](https://www.dropbox.com/developers/apps/create).

	**1.2.** Create a Dropbox API app.
	
	**1.3.** Choose the values you prefer for the data type and file the app can access (these options are not relevant for login). Name your app.

---

**Configure The Dropbox App**

	**2.1.** Fill in the **Redirect URIs** field in the **Oauth2** section with the following value: [https://[APP-ID].stamplayapp.com](https://[APP-ID].stamplayapp.com) (and/or your custom domain if you have a paid plan).

---

**Add the Dropbox Integration To Stamplay**

	**3.1.** Copy the **App Key** and **App Secret** from the Dropbox app and add the values to the Stamplay app.

	**3.2.** To quickly test the integration, copy and paste this link into your browser: [https://[APP-ID].stamplayapp.com/auth/v1/dropbox/connect](https://[APP-ID].stamplayapp.com/auth/v1/dropbox/connect). Then click on “Users” in the left menu of the Editor to browse the data fetched.

	**3.3.** You have added Dropbox login to your Stamplay app, but be aware that you must provide Dropbox with a lot of other information to get their approval. Refer to the Dropbox documentation to learn how to have your Dropbox app approved for production. In the mean time, you can continue to develop and test the integration.

Stamplay collects the following data from Dropbox:

* `userinfo.profile`

Refer to the Dropbox documentation for more information.

### Linkedin

```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/linkedin/connect"
```

```javascript
	Stamplay.User.login("linkedin")
```

```nodejs
	// no method
```

---

**Create a LinkedIn app**

	**1.1.** Go to [https://www.linkedin.com/secure/developer](https://www.linkedin.com/secure/developer) and click on “Add a new application”.

---

**Configure the app**

	**2.1.** Fill in all the required data.

	**2.2.** Fill in the OAuth **redirect_uri** field with the following value: [https://[APP-ID].stamplayapp.com/auth/v1/linkedin/callback](https://[APP-ID].stamplayapp.com/auth/v1/linkedin/callback).

	**2.3.** Click the “Add application” button.

---

**Add the LinkedIn Integration to Stamplay**

	**3.1.** Copy the **API Key** and **Secret Key** from the LinkedIn app and add the values to the Stamplay app.

	**3.2.** Click on the “End” button.

	**3.3.** To quickly test the integration, copy and paste this link into your browser: [https://[APP-ID].stamplayapp.com/auth/v1/linkedin/connect](https://[APP-ID].stamplayapp.com/auth/v1/linkedin/connect). Then click on **Users** in the left menu of the Editor to browse the data fetched.

Stamplay asks for the following permissions:

* `r_basicprofile`
* `r_emailaddress`
* `r_fullprofile`

We store only data from `r_basicprofile and r_emailaddress`.

Refer to the Linkedin documentation for more information.

### Instagram

```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/instagram/connect"
```

```javascript
	Stamplay.User.login("instagram")
```

```nodejs
	// no method
```

---

**Create an Instagram App**

	**1.1.** Go to [https://instagram.com/developer/clients/manage](https://instagram.com/developer/clients/manage).

	**1.2.** Click on **Manage Client** in the menu bar.
	
	**1.3.** Click on **Register a new Client ID**.

---

**Configure the App**

	**2.1.** Fill in the required fields.

	**2.2.** Fill in the **Website** field with your Stamplay domain: [https://[APP-ID].stamplayapp.com](https://[APP-ID].stamplayapp.com) (and/or your custom domain if you have a paid plan).
	
	**2.3.** Fill in the OAuth **redirect_uri** field with the following value: [https://[APP-ID].stamplayapp.com/auth/v1/instagram/callback](https://[APP-ID].stamplayapp.com/auth/v1/instagram/callback).

---

**Add the Instagram Integration to Stamplay**

	**3.1.** Copy the **Client Id** and **Client Secret** from the Instagram client and add the values to the Stamplay app.

	**3.2.** To quickly test the integration, copy and paste this link into your browser: [https://[APP-ID].stamplayapp.com/auth/v1/instagram/connect](https://[APP-ID].stamplayapp.com/auth/v1/instagram/connect). Then click on **Users** in the left menu of the Editor to browse the data fetched.

Stamplay asks for the following permissions:

* `basic`

We store only data from `basic`.

Refer to the Instagram documentation for more information.

### Github

```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/github/connect"
```

```javascript
	Stamplay.User.login("github")
```

```nodejs
	// no method
```

---

**Create a Github App**

	**1.1.** Go to [https://github.com/settings/profile](https://github.com/settings/profile).

	**1.2** Click on **Applications** in the left menu.

	**1.3.** Click on **Register new application** button.

---

**Configure the app**

	**2.1.** Fill in all the required fields.

	**2.2.** Fill in the **Homepage URL** field with your Stamplay domain: [https://[APP-ID].stamplayapp.com](https://[APP-ID].stamplayapp.com) (and/or your custom domain if you have a paid plan).

	**2.3.** Fill the **Authorization Callback URL** field with the following value: [https://[APP-ID].stamplayapp.com/auth/v1/github/callback](https://[APP-ID].stamplayapp.com/auth/v1/github/callback).

---

**Add the Github Integration to Stamplay**

	**3.1.** Copy the **Client ID** and **Client Secret** from the Github app and add the values to the Stamplay app.

	**3.2.** To quickly test the integration, copy and paste this link into your browser: [https://[APP-ID].stamplayapp.com/auth/v1/github/connect](https://[APP-ID].stamplayapp.com/auth/v1/github/connect). Then click on **Users** in the left menu of the Editor to browse the data fetched.

Stamplay requests access to public information. We store all public data.

Refer to the Github documentation for more information.

### Angellist

```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/angellist/connect"
```

```javascript
	Stamplay.User.login("angellist")
```

```nodejs
	// no method
```

---

**Create an Angel List App**

	**1.1.** Go to [https://angel.co/api/oauth/clients](https://angel.co/api/oauth/clients).

---

**Configure the App**

	**2.1.** Name your app.

	**2.2.** Fill in the **Main URL** field with your Stamplay domain: [https://[APP-ID].stamplayapp.com](https://[APP-ID].stamplayapp.com) (and/or your custom domain if you have a paid plan).

	**2.3.** Fill in the field Callback URL with the following value: [https://[APP-ID].stamplayapp.com/auth/v1/angellist/callback](https://[APP-ID].stamplayapp.com/auth/v1/angellist/callback).

---

**Add the Angellist Integration to Stamplay**

	**3.1.** Angel List will send you an email with the **Client ID** and **Client Secret**. Add these values to the Stamplay app.

	**3.2.** To quickly test the integration, copy and paste this link into your browser: [https://[APP-ID].stamplayapp.com/auth/v1/angellist/connect](https://[APP-ID].stamplayapp.com/auth/v1/angellist/connect). Then click on **Users** in the left menu of the Editor to browse the data fetched.

Stamplay requests permission to access the following:

* `default information`
* `email`

We store the default information data and email.

Refer to the Angel List documentation for more information.

## Sessions

```shell-always
	
	"Authorization" : "Basic c3RhbXBsYXlrYjo5MTRhMmUzMaMwZWRlMDdmZThhNjYzMzkxMWQyYWQyOTNkNjJkNTQ3OGFiYmViNjEyNzhhYjFjYzE2MDhiZaRi"
```

```shell-always
	"x-stamplay-jwt" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0eXBlIjoidXNlciIsImFwcERvbWFpbiI6InN0YW1wbGF5a2Iuc3RhbXBsYXlscHAuY29tIiwiYXBwSWQiOiJzdGFtcGxheWtiIiwidXNlciI6IjU2ZjAyZDY0NjFkNWI0MTA1ZDFhMjY4NCIsImlhdCI6MTQ1ODU4MTQwNiwiZXhwIjoxNDU5MTg2Mjc4fQ.UDFUe0Zb2ZHx3HXdiUXWnHSyKghVI_harpkkyC3BU8A"
```

A session represents an instance of a user logged into a device within a Stamplay application. A session is automatically created when users log in or sign up.

By default user sessions last 7 days.

Stamplay manages session leveraging a [Token-Based Authentication](https://jwt.io/) approach. This relies on a signed token that is sent to the server on each request. The implementation is done by generating a token when the user is authenticated and then setting that token in the `x-stamplay-jwt` header of each subsequent request to our back-end, or as part of the `Authorization` header from server to server requests.

If you use the **Stamplay Javascript SDK** you do not need to worry about this; but in the case you send request to our APIs without the SDK, this is something you need to be aware of.

If users log in or sign up using an external provider (e.g. [Facebook](#facebook), [Linkedin](#linkedin), [Google](#google+), etc.) the token issued by Stamplay will be available as a query param `?jwt`. Again, if you are using the SDK, you will not need to manage the token yourself.

If your app let users log in or sign up with the traditional email+password API, tokens will be in the `x-stamplay-jwt` header of the response.

To check whether or not the token is expired you can do the following:

1. Split the token in three parts using the `.` (dot) as the divider.
2. Base64 decode of the second chunk.
3. Check if the current date (in UNIX timestamp format) is between the "issued at time" date and "expiration" date to check that the token is still valid.

## User to User Permissions

Stamplay supports Role-Based Authorization schemes, on a per object level, and user to user level.

The Roles scheme can be configured with the **Users** section **Roles** section for the **Role -> Role** permissions, and inside each **Object** model's view under the **Permissions** tab for each object individual schema.

For further detail, view the [Roles documetation](#roles).

## Logging Out

```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/logout" \
	-H "x-stamplay-jwt: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0eXBlIjoidXNlciIsImFwcERvbWFpbiI6InN0YW1wbGF5a2Iuc3RhbXBsYXlscHAuY29tIiwiYXBwSWQiOiJzdGFtcGxheWtiIiwidXNlciI6IjU2ZjAyZDY0NjFkNWI0MTA1ZDFhMjY4NCIsImlhdCI6MTQ1ODU4MTQwNiwiZXhwIjoxNDU5MTg2Mjc4fQ.UDFUe0Zb2ZHx3HXdiUXWnHSyKghVI_harpkkyC3BU8A"

```

```javascript
	Stamplay.User.logout();
```

```nodejs
	// no method
```

To logout, and end a user session, send a request to the logout endpoint. The `x-stamplay-jwt` header must be included otherwise the session will not be ended.

The request response will redirect the application by default to the root of your application. This can be managed within the Stamplay editor in the **User** -> **Authentication** section by select the settings icon.

## Fetch Users

Retrieve an individual user, all users, or the current session user, or any users matching specific criteria.

### Current User

```shell
	curl -X "GET" "https://APPID.stamplayapp.com/api/user/v1/getstatus" \
	-H "x-stamplay-jwt: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0eXBlIjoidXNlciIsImFwcERvbWFpbiI6InN0YW1wbGF5a2Iuc3RhbXBsYXlscHAuY29tIiwiYXBwSWQiOiJzdGFtcGxheWtiIiwidXNlciI6IjU2ZjAyZDY0NjFkNWI0MTA1ZDFhMjY4NCIsImlhdCI6MTQ1ODU4MTQwNiwiZXhwIjoxNDU5MTg2Mjc4fQ.UDFUe0Zb2ZHx3HXdiUXWnHSyKghVI_harpkkyC3BU8A"
```

```javascript
	Stamplay.User.current()
		.then(function(res) {
			// success
		}, function(err) {
			// error
		})
```

```nodejs
	// no method
```

To fetch the user that is currently logged in, send a request to the `getStatus` endpoint, on the user API resource.

### Individual User

```shell
	curl -X "GET" "https://APPID.stamplayapp.com/api/user/v1/users/{user_id}"
```

```javascript
	Stamplay.User.get({ _id : "user_id" })
		.then(function(res) {
			// success
		}, function(err) {
			// error
		})
```

```nodejs
	Stamplay.User.get({ _id : "user_id" }, function(err, res) {
		// success
	})
```

To fetch an single user, send the `_id` of the user to fetch in the request body to the user API resource.

### All Users

```shell
	curl -X "GET" "https://APPID.stamplayapp.com/api/user/v1/users"
```

```javascript
	Stamplay.User.get({})
		.then(function(res) {
			// success
		}, function(err) {
			// error
		})
```

```nodejs
	Stamplay.User.get({}, function(err, res) {
		// success
	})
```

To retrieve all users, send a request without any parameters to match in the body, to the user API resource.

### Query Users

```shell
	curl -X "GET" "https://APPID.stamplayapp.com/api/user/v1/users" \
	-H "Content-Type: application/json" \
	-d "{\"name\":\"John\",\"age\":\"30\"}"
```

```javascript
	var query = {
		name : "John",
		age : 30
	}

	Stamplay.User.get(query)
		.then(function(res) {
			// success
		}, function(err) {
			// error
		})
```

```nodejs
	var query = {
		name : "John",
		age : 30
	}

	Stamplay.User.get(query, function(err, res) {
		// success
	})
```

To retrieve all users that match a certain set of parameters, send a request with any parameters to match in the body, to the user API resource.

## Update User

To update a user record partially, or completely overwrite the existing record.

### Partial User Update

```shell
	curl -X "GET" "https://APPID.stamplayapp.com/api/user/v1/users/{user_id}" \
	-H "Content-Type: application/json" \
	-d "{\"name\":\"John\",\"age\":\"30\"}"
```

```javascript
	var updatedInfo = {
		name : "John",
		age : 30
	}

	Stamplay.User.get("user_id", updatedInfo)
		.then(function(res) {
			// success
		}, function(err) {
			// error
		})
```

```nodejs
	var updatedInfo = {
		name : "John",
		age : 30
	}

	Stamplay.User.get("user_id", updatedInfo, function(err, res) {
		// success
	})
```

To partially update a User record, send a `PATCH` request with an properties to update in the request body, to the User API resource with the `_id` of the user to update.

### Complete User Update

```shell
	curl -X "GET" "https://APPID.stamplayapp.com/api/user/v1/users" \
	-H "Content-Type: application/json" \
	-d "{\"name\":\"John\",\"address\":\"111 Market St. San Francisco, CA\",\"age\":\"30\",\"_id\":\"56fb116e5ab65a4446dd3b2d\"}"
```

```javascript
	var user = {
		_id : "56fb116e5ab65a4446dd3b2d",
		address : "111 Market St. San Francisco, CA"
		name : "John",
		age : 30
	}

	Stamplay.User.get(user._id, updatedInfo)
		.then(function(res) {
			// success
		}, function(err) {
			// error
		})
```

```nodejs
	var user = {
		_id : "56fb116e5ab65a4446dd3b2d",
		address : "111 Market St. San Francisco, CA"
		name : "John",
		age : 30
	}

	Stamplay.User.get(user._id, updatedInfo, function(err, res) {
		// success
	})
```
To completely update a user record, send a `PUT` request with a complete representation of the data to overwrite the existing record with.

Include this representation in the request body, in the request to the User API resource with the `_id` of the user to update.

## Remove User

```shell
	curl -X "DELETE" "https://APPID.stamplayapp.com/api/user/v1/users/{user_id}"
```

```javascript
	Stamplay.User.remove("user_id")
		.then(function(res) {
			// success
		}, function(err) {
			// error
		})
```

```nodejs
	Stamplay.User.remove("user_id", function(err, res) {
		// success
	})
```

To remove a user record from the database, send a `DELETE` request to the user resource with the user `_id` to the User API resource.

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


To assign a new role to a user, send a `PATCH` request with the `givenRole` property as the role to assign unique `_id`, in the request body to the User API resource.

To retrieve the roles available to assign, see the [Roles API](#roles).

<!-- ## Activity -->

<!-- 
	Return the activities that user with the specified userId has done. Each activity is composed by a triple:

	activity: the name of the activity
	actor: the entity that has done the activity
	target: the entity on which the activity is done
 -->

<!-- ## Follower System
### Follow User
### Unfollow User
### Get Followers
### Get Following -->
