# MVC in Action
------

## Setup instructions:
* Ruby version: `3.2.2`
* Rails version: `7.1.2`

- Clone this repo (no need to fork)
- `cd <repo_name>`
- `bundle install`
- `rails db:{create,migrate,seed}`

# Overview

This repository is a tool to use in conjunction with the [MVC in Action](https://backend.turing.edu/module2/lessons/mvc_in_action) lesson. There are no feature tests in this repository, only model tests, but you can use `rails s` and navigate to `localhost:3000` to see what is happening. The models, controllers and views have been set up already. We will be focusing on identifying where we are breaking MVC logic conventions and refactoring to follow MVC logic conventions.

Everything in this repository is set up following the below code snippets. Looking at each of these, identify where MVC logic is being broken and work to correct it.

### Models

```ruby
class Comedian < ApplicationRecord
  has_many :specials

  def self.average_age
    "#{average(:age).round(2)} Years"
  end

  def average_special_runtime
    specials.average(:runtime)
  end
end
```

### Views
```erb
<% @comedians.each do |comic| %>
<h4><%= comic.name %>: <%= comic.specials.count %> Specials</h4>
<% end %>
```

```erb
<h1><%= @comedian.name %></h1>
<% if @comedian.specials.count > 2 && @longest_special > 20 %>
  <p>Average runtime of all this comedian's specials: <%= @average_special_runtime %></p>
<% end %>
```

### Controllers
```ruby
class ComediansController < ApplicationController
  def index
    @comedians = Comedian.all
    @average_age = Comedian.average(:age)
  end
end
```

```ruby
class ComediansController < ApplicationController
  def show
    @comedian = Comedian.find(params[:id])
    @average_special_runtime = @comedian.average_special_runtime.round(2)
    @longest_special = @comedian.specials.order(runtime: :desc).first
  end
end
```

For additional guidance, consider the following rules:

* No query logic in your Controllers or Views; this should live in your Models.
* No data formatting in your Models or Controllers; this should live in your Views.


## Review
Completed code for this lesson can be found in the `refactor` branch [here](https://github.com/turingschool-examples/mvc-in-action-7/tree/refactor)
