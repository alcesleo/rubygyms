# RubyGyms

A gym membership database for 3 year olds.

## Running the tests

```bash
# it's the default rake task
rake
```

## Design decisions

### Database

SQLite; because it's portable and easy, no need for more at this point and it's
easy to change.

### User roles

It's a simple boolean field, this obviously won't scale if you have more
roles, but YAGNI.

### Testing

RSpec because it's well known and the industry standard.

I wrote tests where it made sense to test-drive the implementation, if you have
a bigger system or need more confidence you could spend more time on covering
everything, but in this small app I thought that would be a waste of time.
