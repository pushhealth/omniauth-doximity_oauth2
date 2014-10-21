# OmniAuth Doximity OAuth2


Strategy to authenticate with Doximity via OAuth2 in OmniAuth.

  - http://developer.doximity.com/
  - http://developer.doximity.com/oauth.html

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-doximity_oauth2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-doximity_oauth2


## Usage

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
    :doximity, ENV['DOXIMITY_CLIENT_ID'], ENV['DOXIMITY_CLIENT_SECRET'], { strategy_class: OmniAuth::Strategies::DoximityOauth2, scope: 'email'}
end
```


### Devise

First define your application id and secret in `config/initializers/devise.rb`

```ruby
config.omniauth :doximity, ENV['DOXIMITY_CLIENT_ID'], ENV['DOXIMITY_CLIENT_SECRET'], { strategy_class: OmniAuth::Strategies::DoximityOauth2, scope: 'email'}
```

Then add the following to `config/routes.rb` so the callback routes are defined.

```ruby
devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
```

Make sure your model is omniauthable. Generally this is `app/models/user.rb`

```ruby
devise :omniauthable, omniauth_providers: [:doximity]
```

Then make sure your callbacks controller is setup.

```ruby
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def doximity
    # LOGIC
    # you can retrive your request with: request.env['omniauth.auth']
  end
end
```

For your views you can login using:
```ruby
<%= link_to 'Sign in with Doximity', user_omniauth_authorize_path(:doximity) %>
```

An overview is available at https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview


## Contributing

1. Fork it ( https://github.com/pushhealth/omniauth-doximity_oauth2/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
