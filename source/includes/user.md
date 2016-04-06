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

### Facebook
	
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

	**2.3.** Fill the **Site Url** field with your Stamplay domain: `https://[appId].stamplayapp.com` (and/or your custom domain if you have a paid plan).

	**2.4.** From the **Settings** view click on the **Advanced** tab and type in the **OAuth Redirect URIs** the following: `https://[appId].stamplayapp.com/auth/v1/facebook/callback` and `https://localhost:8080/auth/v1/facebook/callback` so that you can also test the signup flow locally when using Stamplay Command Line.
 
 ---

**Add The Facebook App Credentials To Stamplay**

	**3.1.** Copy the `App Id` and `App Secret` from the Facebook App and add the values to the corresponding field inside the Stamplay editor in the **Users** - **Authentication** section.
	
	**3.2.** To test the social login integration, copy and paste this link with your `APP ID` into a browser: `https://[appId].stamplayapp.com/auth/v1/facebook/connect`. After connecting your account, check the **DATA** section to inspect the new User record created.
	
	**3.3.** The steps covered in this guide are not enough to have a Facebook app approved for production. You need to provide other information and submit the app for review; the process can take many days to complete. Refer to Facebook documentation for more information.

Stamplay asks for the following permissions:

* `public_profile`
* `email`
* `user_friends`

We store data from `public_profile` and `email`. Refer to the Facebook documentation for more information.


```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/facebook/connect"
```

```javascript
	Stamplay.User.login("facebook")
```

```nodejs
	// no method
```

### Google+

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
	domain: https://[appId].stamplayapp.com (and/or your custom domain if you have a paid plan).

	**2.4.** Fill in the **Authorized Redirect URIs** field with the following value: https://[appId].stamplayapp.com/auth/v1/google/callback.

	**2.5.** Click on **Create client ID**

---

**Add the Google+ Integration To Stamplay**

	**3.1.** Copy the **Client Id** and **Client Secret** from the Google App and add the values to the Stamplay app.

	**3.2.** To quickly test the integration, copy and paste this link into your browser: `https://[appId].stamplayapp.com/auth/v1/google/connect`.

	**3.3.** Then click on **Users** in the left menu of the Editor to browse the data fetched.

Stamplay asks for the following permissions:

* `userinfo.profile`
* `userinfo.email`

Refer to the Google documentation for more information.

```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/google/connect"
```

```javascript
	Stamplay.User.login("google")
```

```nodejs
	// no method
```

### Twitter

---

**Create a Twitter app**
	
	**1.1.** Go to [https://apps.twitter.com/app/new](https://apps.twitter.com/app/new) to create a new Twitter app.

---

**Configure the app**

	**2.1.** Fill in name and description.
	
	**2.2.** Fill in the Website field with your Stamplay domain: https://[appId].stamplayapp.com (and/or your custom domain if you have a paid plan).
	
	**2.3.** Fill in the Authorized Redirect URIs field with the following value: https://[appId].stamplayapp.com/auth/v1/twitter/callback. Create the Twitter application.

---

**Add the Twitter Integration to Stamplay**

	**3.1.** Click on the **Keys and Access Tokens** tab.

	**3.2.** Copy the **Consumer Key** (API Key) and **Consumer Secret** (API Secret) from the Twitter app and add the values to the Stamplay app.

	**3.3.** To quickly test the integration, copy and paste this link into your browser: https://[appId].stamplayapp.com/auth/v1/twitter/connect. Then click on **Users** in the left menu of the editor to browse the data fetched.

Stamplay collects all profile data provided.

Twitter does not have scopes, and the user `email` is not provided. You must request access from Twitter, and be whitelisted to receive user emails.

Please refer to the Twitter documentation for more information.

```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/twitter/connect"
```

```javascript
	Stamplay.User.login("twitter")
```

```nodejs
	// no method
```

### Dropbox

---

**Create a Drop API App**

	**1.1.** Go to https://www.dropbox.com/developers/apps/create.

	**1.2.** Create a Dropbox API app.
	
	**1.3.** Choose the values you prefer for the data type and file the app can access (these options are not relevant for login). Name your app.

---

**Configure The Dropbox App**

	**2.1.** Fill in the **Redirect URIs** field in the **Oauth2** section with the following value: https://[appId].stamplayapp.com (and/or your custom domain if you have a paid plan).

---

**Add the Dropbox Integration To Stamplay**

	**3.1.** Copy the **App Key** and **App Secret** from the Dropbox app and add the values to the Stamplay app.

	**3.2.** To quickly test the integration, copy and paste this link into your browser: https://[appId].stamplayapp.com/auth/v1/dropbox/connect. Then click on “Users” in the left menu of the Editor to browse the data fetched.

	**3.3.** You have added Dropbox login to your Stamplay app, but be aware that you must provide Dropbox with a lot of other information to get their approval. Refer to the Dropbox documentation to learn how to have your Dropbox app approved for production. In the mean time, you can continue to develop and test the integration.

Stamplay collects the following data from Dropbox:

* `userinfo.profile`

Refer to the Dropbox documentation for more information.

```shell
	curl -X "GET" "https://APP-ID.stamplayapp.com/auth/v1/dropbox/connect"
```

```javascript
	Stamplay.User.login("dropbox")
```

```nodejs
	// no method
```

### Linkedin

---

**Create a LinkedIn app**

	**1.1.** Go to https://www.linkedin.com/secure/developer and click on “Add a new application”.

---

**Configure the app**

	**2.1.** Fill in all the required data.

	**2.2.** Fill in the OAuth redirect_uri field with the following value: https://[appId].stamplayapp.com/auth/v1/linkedin/callback.

	**2.3.** Click the “Add application” button.

---

**Add the LinkedIn Integration to Stamplay**

	**3.1.** Copy the API Key and Secret Key from the LinkedIn app and add the values to the Stamplay app.

	**3.2.** Click on the “End” button.

	**3.3.** To quickly test the integration, copy and paste this link into your browser: https://[appId].stamplayapp.com/auth/v1/linkedin/connect. Then click on “Users” in the left menu of the Editor to browse the data fetched.

Stamplay asks for the following permissions:

* r_basicprofile
* r_emailaddress
* r_fullprofile

We store only data from `r_basicprofile and r_emailaddress`.

Refer to the Linkedin documentation for more information.

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
