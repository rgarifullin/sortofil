# Sortofil

[![Build Status](https://travis-ci.org/rgarifullin/sortofil.svg?branch=master)](https://travis-ci.org/rgarifullin/sortofil)
[![Code Climate](https://codeclimate.com/github/rgarifullin/sortofil/badges/gpa.svg)](https://codeclimate.com/github/rgarifullin/sortofil)

Sortofil - sort and filter helper for Rails app

Features:
* sortable table headers
* restore url query params during session

## Usage

### Sort/filter
Add this to controller:
```ruby
include Sortofilterable

before_action :permit_params
before_action :set_default_sort_opts
```
Customize options (override methods inside controller):
* Simple case:

```ruby
def set_default_sort_field
  @default_sort_field = { nil => :created_at }
end

def set_default_sort_direction
  @default_sort_direction = { nil => :desc }
end

def permit_params
  @permitted_params = params.permit(sort_params, filter_params,
                                    pagination_params, :your_additional_param)
end
```

* Multiple models per page case:

```ruby
def set_default_sort_field
  @default_sort_field = { artists: :first_name, authors: :last_name }
end

def set_default_sort_direction
  @default_sort_direction = { artists: :asc, authors: :desc }
end

def permit_params
  @permitted_params = params.permit({ artists: sort_params + filter_params,
                                      authors: sort_params + filter_params },
                                    pagination_params)
end
```

View

* Simple case:

```html
<table>
  <thead>
    <th>
      <%= render 'layouts/sortable_theader', model: 'artists' %>
    </th>
  </thead>
  <tbody>
    ...
  </tbody>
</table>
```

* Multiple models per page case:

```html
<table>
  <thead>
    <th>
      <%= render 'layouts/sortable_theader', model: 'artists', scoped: true,
                                             url: 'root' %>
    </th>
  </thead>
  <tbody>
    ...
  </tbody>
</table>

<table>
  <thead>
    <th>
      <%= render 'layouts/sortable_theader', model: 'authors', scoped: true,
                                             url: 'root' %>
    </th>
  </thead>
  <tbody>
    ...
  </tbody>
</table>
```

### Url restore

Add this to controller:
```ruby
include UrlRestorable

before_action do
  restore_url_params(:your_key)
end
```

View

```html
<%= render 'layouts/restorable_url_params', key: :your_key %>
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'sortofil'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install sortofil
```


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
