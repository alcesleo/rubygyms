# RubyGyms

A gym membership database for 3 year olds!

## Running the tests

```bash
# it's the default rake task
rake
```

## Design decisions

### User roles

The simplest solution was a boolean field, it won't scale to
more roles, but YAGNI.

### Email validation

It's almost impossible to do this completely right, it's usually
recommended to send a confirmation email because that will always
work, but I haven't had time to implement that.

### Testing

I've used plain RSpec because it was the simplest and fastest to set up,
and I'm quite familiar with it. I have written tests in a TDD-fashion,
but I haven't prioritized having 100% test coverage on this small example.

### Database

SQLite; because it's portable and easy, no need for more at this point and it's
easy to change. I used this diagram as a sketch, it's not strictly a database
diagram but I think it shows my intentions clearly.

![](diagram.jpg)

## TODO

Things I haven't had time for yet:

* Implement the Workouts use case
* Check so you can't kick members from other clubs
* Better safety boundaries between roles
* Pagination and query optimization
* Get better test coverage
* Unique emails for users
* Confirmation emails
* Update password
* General refactorings
