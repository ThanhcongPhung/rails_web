## Group 03 - IT3042 

# Project in Ruby on Rails App 

## Getting started

Need install NodeJS, yarn, ruby 2.6.3, rails 6.0.1

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```
```
$ yarn install
```
Create config/master.key and copy this code into it:

084fd46c026faf8fe9e6239e60fd9f0d

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

