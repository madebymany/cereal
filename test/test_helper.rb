require 'minitest/autorun'
require 'turn/autorun'
require './lib/cereal'
require "active_model"

Turn.config.natural = true

module NormalUserSerializer
  include Cereal
end

class NormalUser 
  include ActiveModel::Model
  include ActiveModel::Serialization
  include NormalUserSerializer

  attr_accessor :name, :age

  def attributes
    {name: name, age: age}
  end
end

module UserSerializer
  include Cereal

  def defaults
    {
      name: name
    }
  end

  def age_details
    {
      age: age
    }
  end
end

class User
  include ActiveModel::Model
  include ActiveModel::Serialization
  include UserSerializer

  attr_accessor :name, :age

  def attributes
    {name: name, age: age}
  end
end
