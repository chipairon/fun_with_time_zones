Fun with time zones
===================

Having fun with ruby time_zones on database save / retrieval

This project has a unique model: Fun

This illustrates a problem I am facing with a form that has a datetime field.
Putting this field in a form as a textfield (so you can easily use a javascript datepicker), does not work as expected.

**The textfield shows the value without offset -> When you submit the form and save, a new offset is applied to the wrong value of the textfield.**

## How to reproduce the problem
1- Go to http://localhost:3000

2- Click create

3- Enter a date, for instance "19-03-2013" (dd-mm-yy)

4- Save -> crazy_time value in db: is 2013-03-19 00:00:00.000000 +0100

5- Edit -> The date in the view appears as 2013-03-18 23:00:00.000000

6- Update -> Offset is reapplied to date from step 5, loosing an hour. crazy_time is now 2013-03-18 23:00:00 +0100

7- Edit -> Same as 5 but applied to wrong offsetted date from 6. The date in the text_field is 2013-03-18 22:00:00.000000

8- Update -> Offset is reapplied to date from 7, loosing an hour. crazy_time is now 2013-03-18 22:00:00 +0100

...

## The workaround ##
If you apply a format to the datetime before passing it to the text_field, it behaves as expected.

In application_helper create a helper to format the date:

```ruby
module ApplicationHelper
  def format_date_for_text_field(the_date)
     return the_date.strftime('%d-%m-%Y')
  end
end
```

Then in the form use the helper:

```ruby
    <% if @fun.crazy_time and not @fun.crazy_time.blank? %>
        <%= f.text_field :crazy_time, :value => format_date_for_text_field(@fun.crazy_time) %>
    <% else %>
        <%= f.text_field :crazy_time %>
    <% end %>
```


In the branch solution is the same app with this workarount applied.

This solution is based on this SO answer: http://stackoverflow.com/a/5094402/676002

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

# Related discussion:

https://github.com/rails/rails/issues/6816

https://gist.github.com/wdiechmann/4065991
