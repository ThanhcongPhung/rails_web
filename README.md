## Group 03 - HEDSPI - HUST

This project for IT3402

## Getting started

Install redis to run server:
```
$ sudo apt update
$ sudo apt install redis-server
```
Run redis when rails server run:
```
$ redis-cli
```
Then install the needed gems:

```
$ bundle install 
```

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
