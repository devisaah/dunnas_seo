require "dunnas_seo/version"
require "dunnas_seo/engine"

require 'carrierwave'


module DunnasSeo
  # Your code goes here...

  mattr_accessor :active_uuid

  def self.active_uuid
    @@active_uuid
  end
end
