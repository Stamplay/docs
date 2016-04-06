# Users
## Local Auth

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

To signup or add a user for a local account, send an email and password as the body of the request to Stamplay, with any additional data to save to the new user record.

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

To authenticate a user's credentials for a local account, send an email and password as the body of the request to Stamplay.

## Social Auth

Authentication via an array of different social provider is possibled by some minor configuration with the Stamplay editor, and a simple request to the Stamplay API.

### Facebook
	
	Follow the instructions below to add the Facebook provider to your Stamplay application.

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

	**2.3.** Fill the **Site Url** field with your Stamplay domain: `https://[appId].stamplayapp.com` (and/or your custom domain if you have a paid plan).

	**2.4.** From the **Settings** view click on the **Advanced** tab and type in the **OAuth Redirect URIs** the following: `https://[appId].stamplayapp.com/auth/v1/facebook/callback` and `https://localhost:8080/auth/v1/facebook/callback` so that you can also test the signup flow locally when using Stamplay Command Line.
 
 ---

**Add The Facebook App Credentials To Stamplay**

	**3.1.** Copy the `App Id` and `App Secret` from the Facebook App and add the values to the corresponding field inside the Stamplay editor in the **Users** - **Authentication** section.
	
	**3.2.** To test the social login integration, copy and paste this link with your `APP ID` into a browser: `https://[appId].stamplayapp.com/auth/v1/facebook/connect`. After connecting your account, check the **DATA** section to inspect the new User record created.
	
	**3.3.** The steps covered in this guide are not enough to have a Facebook app approved for production. You need to provide other information and submit the app for review; the process can take many days to complete. Refer to Facebook documentation for more information.

```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/facebook/connect"
```

```javascript
	Stamplay.User.login("facebook")
```

```nodejs
	// no method
```

Stamplay asks for the following permissions:

* `public_profile`
* `email`
* `user_friends`

We store data from `public_profile` and `email`. Refer to the Facebook documentation for more information.


### Google+

**Create a Google Client Id**

	**1.1.** Go to [https://code.google.com/apis/console](https://code.google.com/apis/console) and create an APIs project.
	
	**1.2.** Click on **Credentials** from the **API & Auth** section of the left menu.
	
	**1.3.** Click on **Create new Client Id** button.

---

**Configure the Client ID**

	**2.1.** Choose the type **Web application** and click on **Configure Consent Screen** button.

	**2.2.** Add the required information to the consent screen and save.

	**2.3.** Fill in the **Authorized Javascripts Origins** field with your Stamplay 
	domain: https://[appId].stamplayapp.com (and/or your custom domain if you have a paid plan).

	**2.4.** Fill in the **Authorized Redirect URIs** field with the following value: https://[appId].stamplayapp.com/auth/v1/google/callback.

	**2.5.** Click on **Create client ID**

---

**Add the Google+ Integration To Stamplay**

	**3.1.** Copy the **Client Id** and **Client Secret** from the Google App and add the values to the Stamplay app.

	**3.2.** To quickly test the integration, copy and paste this link into your browser: `https://[appId].stamplayapp.com/auth/v1/google/connect`.

	**3.3.** Then click on **Users** in the left menu of the Editor to browse the data fetched.

Stamplay asks for the following permissions:

Stamplay asks for the following permissions:

* `userinfo.profile`
* `userinfo.email`

Refer to the Google documentation for more information.

### Twitter
### Dropbox
### Linkedin
### Instagram
### Github
### Angellist
## Sessions
## Logout
## Permissions
## Updating an Object
## Partially Updating an User
## Retrieving an User by Id
## Delete an User
