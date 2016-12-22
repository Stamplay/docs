# Web Hosting

Stamplay Hosting provides you with the tools to host static or dynamic websites that are hooked up to our backend.

You can upload arbitrary static web content or create dynamic web apps, using the JavaScript SDK on the client side.

This guide shows you how to easily deploy and host your app’s static assets (HTML, CSS, JavaScript, etc.) with our production-grade hosting service.


## Stamplay Command Line Tool

The [Stamplay Command Line (CLI) Tool](https://github.com/Stamplay/stamplay-cli) can be used to:

- - Administer your Stamplay account
- - Interact with Stamplay Platform, our product to host your static HTML, JS, CSS, images, etc.
- - Test you application locally.

The Stamplay CLI requires Node.js and NPM, which can both be installed by following the instructions at [https://nodejs.org/](https://nodejs.org/). Installing Node.js also installs NPM by default.

Once you have Node.js and NPM installed, you can install the Stamplay command line tools via NPM.

~~~ shell-always
  npm install -g stamplay-cli
  // sudo may be required depending on your system permissions
  // sudo npm install -g stamplay-cli
~~~


This installs `stamplay` as a globally available command interface.

### stamplay.json

~~~ shell
  stamplay init
~~~

The `stamplay.json` file, when create is typically in the root of your project's directory.

~~~ json
  {
    "appId": "yourAppId",
    "apiKey": "yourAppApiKey",
    "public": "./",
    "ignore": [
      "stamplay.json",
      "**/.*",
      "**/node_modules/**"
    ]
  }
~~~

This required file is used to configure which files are published upon deployment, set customer headers, etc.

To generate a `stamplay.json` file, run the `init` CLI command.

After running the command, you will be prompted to enter the `APP ID` and `API Key` of the application.

The default `stamplay.json` file will look like the example:

An optional `headers` property is available to define browser side caching of static resources such as libraries or images.

Caching removes the need to load static libraries every time. This is helpful in a production enviornment to help speed up load times, and even reduce server load. See below for more details.

#### appId and apiKey
~~~ json
  "appId": "yourAppId",
  "apiKey": "yourAppApiKey"
~~~

The `appId` and `apiKey` are used by the command line tool as authentication parameters.

#### public

~~~ json
  "public" : "./"
~~~

The `public` property tells the command line which directory to upload to Stamplay. This directory must be inside the project directory and must exist.

The default value is the root directory or your project. This directory is also the one used by the command line tool when running the local server.

#### ignore

~~~ json
  "ignore" : [
    "stamplay.json",
        "**/.*",
        "**/node_modules/**"
  ]
~~~
The `ignore` specifies which files to ignore on deploy. It can take glob definitions in the same way git handles `.gitignore`.

#### headers

~~~ json
  "headers": [
    {
      "source" : "**/*.@(jpg|jpeg|gif|png)",
      "headers" : [
        {
          "key" : "Cache-Control",
          "value" : "max-age=7200"
        }
      ]
    },
    {
      "source" : "404.html",
      "headers" : [
        {
          "key" : "Expires",
          "value" : "1y"
        }
      ]
    }
  ]
~~~

The `headers` is an optional parameter in the `stamplay.json` file.

It is only available to be used only if your `stamplay-cli` version is `1.3.9` or greater.

This property is an array of header objects. Each object specifies:

---

**source**

A file glob pattern to be matched.

---

**headers**

A headers property of its own, as an array of header objects for the glob pattern source.

---

Each specifies a key and value property.

The key designates the header type, and value is the value of the header type itself.

Each definition must have a `source` key that is matched against the original request path using glob notation; and must also have the array of headers applied, each with a valid key and a value.

The following header types are supported:

---        

**Expires**

The time in the `Expires` header is computed as a sum of the current time and time specified in the directive.

Allowed values for the `Expires` header are **minutes** : `m`, **hours** : `h`, **days** : `d`, **weeks** : `w`, **years** :  `y`.

For example, `5d` is **5 days**, or `120m` is **120 minutes**.

---

**Cache-Control**

The time in the `Cache-Control` header is represented in seconds.

For example, `3600` is **3600 seconds**.

---

### App Deploy

~~~ shell-always
  stamplay deploy
~~~

To deploy a new release, run the `deploy` with the CLI.

This pushes the `public` directory as defined with the `stamplay.json` to Stamplay, which the deploys your static app to your [stamplayapp.com](stamplayapp.com) domain.

### Rollback

To rollback to a previous deploy, run the `rollback` CLI command.

~~~ shell-always
  stamplay rollback
~~~

You'll be prompted to pick one of your previous deploys from a list and your app will be restored.

### App Development

~~~ shell-always
  stamplay start
~~~

You can run the Stamplay command line tool to build your app in development mode on your local environment. This will make the tool initialize a local server that will serve your app on [http://localhost:8080](http://localhost:8080).

To run your application locally, run the `start` CLI command.

Applications built with Stamplay must have an `index.html` file at root level of the `public` property defined in the `stamplay.json`.

By default the root level defined in `stamplay.json` public setting is `"./"`.

The `index.html` will be served when serving the application locally on [localhost](http://localhost:8080), or at [https://APPID.stamplayapp.com](https://APPID.stamplayapp.com) after deployment.

### Open In Browser

To launch the live version of your application, run the `open` CLI command.

~~~ shell-always
  stamplay open
~~~

### CLI Updates

You can update the Stamplay CLI by running `npm install` for the `stamplay-cli` npm package with the `-g` global option.

~~~ shell-always
  npm install -g stamplay-cli
~~~

Thi will update your Stamplay command line tool to the latest version.

## Custom Domains and SSL

Users on a paid plan can also host content at a custom domain name.

### Setup

To setup a custom domain, open the Stamplay Editor.

In the Stamplay Editor, in the **Dashboard** section. Select **Hosting** section, then **Use A Custom Domain** and add the value [www.mybeautifulwebsite.com](www.mybeautifulwebsite.com) to the **App Domain** field.

<aside class="notice">
  Application must be on a paid plan to use a custom domain.
</aside>

[![Pretty URL Configuration](/images/prettyurls_config.png)](/images/prettyurls_config.png)

On your DNS provider, add a **CNAME** record from [www.mybeautifulwebsite.com](www.mybeautifulwebsite.com) to [mydemoapp.stamplayapp.com]() to begin sending traffic to your hosted app.

After completing these steps, [www.mybeautifulwebsite.com](www.mybeautifulwebsite.com) will serve the same content as [mydemoapp.stamplayapp.com]().

If you want to serve content at an apex domain such as [example.com](example.com), you might have trouble with the steps above because root domains generally don't support **CNAME** records. To support this situation, you must configure **ALIAS**, **ANAME** or **A** records with your DNS provider.

If your DNS provider supports **ALIAS** records (such as with DNSimple) or **ANAME** records (such as with DNS Made Easy), you may choose to create an **ALIAS** or **ANAME** record to [mydemoapp.stamplayapp.com](mydemoapp.stamplayapp.com) instead (Note: some DNS providers allow an apex domain configured with an **ALIAS** record to point to some other domain name).

Subdomains of up to one level of depth are supported.

Deeper subdomains, such as [my.beautiful.website.com](my.beautiful.website.com), are not allowed.

### Pretty URLs

To enable the url rewrite on the server side for single page applications, all you need to do is navigate to the **Dashboard** section then to **Hosting** section inside the Stamplay Editor, and check the box in the middle of the configuration under the **URL Rewriting** heading to enable all entry points to your domain, to point to the `index.html` page.

[![Pretty URL Configuration](/images/prettyurls_config.png)](/images/prettyurls_config.png)

Other steps still need to be taken to setup Pretty Urls, and differ among frameworks and libraries.

For the best support on this issue, search for solution specific to the framework or library you are using for routing.

### CORS Enabled Domains

To enabled a domain for Cross Origin Requests, add the domain to the list inside the **Dashboard** section of the Stamplay Editor.

The field is under the **CORS enabled domains** heading. You can add the wildcard `*` to allow all origins. This is however not recommended.

[![Pretty URL Configuration](/images/cors_config.png)](/images/cors_config.png)

### Domain Ownership & SSL

Stamplay will handle provisioning an SSL certificate for your domain and serving your content over a CDN. However, before setting up your SSL certificate, you will need to update the DNS entries for your domain by a **CNAME** entry.

The entries will be available via email once you begin the process of adding a custom domain. Depending on your domain name server host, this verification step may be instant or it may take an hour or more.

Once domain ownership is verified, we will provision an SSL certficate for your domain and deploy it across our global CDN. This process can take up to 48 hours, and you will receive an email when it is complete.
