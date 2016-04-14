## Stamplay Documentation

This is the repository for Stamplay's open source documentation, where the community can help improve and extend existing documentation to better the community.

Contributing
------------------------------

If you'd like to contribute to our documentation follow the steps below to setup the repo locally. Then checkout or [guidelines for contributing](https://github.com/Stamplay/docs/blob/master/CONTRIBUTING.md).

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 1.9.3 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

1. Fork this repository on Github.
2. Clone *your forked repository* (not ours) to your hard drive with `git clone https://github.com/YOURUSERNAME/docs.git`
3. `cd docs`
4. Initialize and start. You can either do this locally, or with Vagrant:

```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
```

You can now see the docs at http://localhost:4567. Whoa! That was fast!

Now that the documentation is all set up your machine, you'll want to take a look at our [contribution guidelines](https://github.com/Stamplay/docs/blob/master/CONTRIBUTING.md) for Stamplay's documentation.

Stamplay's documentation is built on [Slate](https://github.com/tripit/slate), and API Doc Generator.

