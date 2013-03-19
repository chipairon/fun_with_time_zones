Fun with time zones
===================

Having fun with ruby time_zones on database save / retrieval

This project has a unique model: Fun

This illustrates a problem I am facing with a form that has a datetime field.

## How to reproduce the problem
1- Go to http://localhost:3000

2- Click create

3- Enter a date, for instance "19-03-2013" (dd-mm-yy)

4- Save -> crazy_date value in db: is 2013-03-19 00:00:00.000000 +0100

5- Edit -> The date in the view appears as 2013-03-18 23:00:00.000000

6- Update -> Offset is reapplied to date from step 5, loosing an hour. crazy_date is now 2013-03-18 23:00:00 +0100

7- Edit -> Same as 5 but applied to wrong offsetted date from 6. The date in the text_field is 2013-03-18 22:00:00.000000

8- Update -> Offset is reapplied to date from 7, loosing an hour. crazy_date is now 2013-03-18 22:00:00 +0100

...

## How to create this project from scratch

```bash
rails new fun_with_time_zones
rails g scaffold Fun crazy_date:datetime
rake db:migrate
```

Now open config/application.rb and add the application time zone:

```ruby
  config.time_zone = 'Madrid'
```
