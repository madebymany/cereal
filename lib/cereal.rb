require "cereal/version"
require "active_support"

module Cereal

  extend ActiveSupport::Concern

  def serializable_hash(opts = {})
    attrs = {}

    if self.respond_to?("defaults") 
      attrs.merge!(self.defaults)
    end

    keys = opts[:with]
    if keys
      keys.each do |option|
        if self.respond_to? option
          attributes_to_find = self.send(option)
          attrs.merge!(attributes_to_find)
        end
      end
    end

    output = attrs.empty? ? attributes : attrs
    output.symbolize_keys
  end
  
end
