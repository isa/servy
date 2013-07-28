# Servy

A registry/directory for servers in your organization, who owns it, which OS it is, what services are there etc.

### Developer Setup

You need to have `nodejs` & `coffee-script` installed. First install `nodejs` by typing:

    $ brew install node

or for Ubuntu:

    $ sudo apt-get update
    $ sudo apt-get install python-software-properties python g++ make
    $ sudo add-apt-repository ppa:chris-lea/node.js
    $ sudo apt-get update
    $ sudo apt-get install nodejs

Now you can install `coffee-script`, `supervisor` and `grunt-cli`:

    $ sudo npm install -g coffee-script supervisor grunt-cli

If you are working behind a proxy:

    $ npm config set registry "http://registry.npmjs.org/"
    $ npm config set strict-ssl false
    $ npm config set http.proxy http://myproxy
    $ sudo npm install -g coffee-script supervisor grunt-cli

Now you can export `NODE_PATH` environment variable. Just add:

    export NODE_PATH=/usr/lib/node_modules

to your `.profile` or `.bashrc` file or any other equivalent shell init file. To start development, last thing you need to do is using `npm` to install project dependencies:

    $ npm install

Now you can see the result of your live code changes if you use `grunt`:

    $ grunt

You can start the application as soon as you type:

    $ supervisor app.coffee

And now you can browse it from `http://localhost:3000`

