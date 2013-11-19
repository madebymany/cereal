# Cereal [![Build Status](https://travis-ci.org/madebymany/cereal.png?branch=master)](https://travis-ci.org/madebymany/cereal/)

Serializers without the verbose controllers, or crazy templates

I've always wondered why more people don't fall into Rail's responds_with and use of serializable_hash method. So here's my concept of a simple class that should help with that and not interfere with anything else.

The concept is that you include your serializer into your model and include Cereal into your serializer.

``` ruby
class User < ActiveRecord::Base

  include UserSerializer

end

```

Your serialiser might look like this..


``` ruby
module UserSerializer

  include Cereal

  def defaults
    {
      id: id,
      updated_at: updated_at
    }
  end

  def account_details
    {
      email: email,
      created_at: created_at,
      updated_at: updated_at
    }
  end

end

```

This allows you to have a very Rails like controller but ask for something else in Serialization..

``` ruby
class AccountsController < APIController

  def create
    @user = User.create(user_params)
    respond_with @user, with: [:auth_details, :account_details]
  end

end
```
