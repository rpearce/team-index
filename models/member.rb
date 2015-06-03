require 'sequel'
require './db/connection'

class Member < Sequel::Model
  plugin :json_serializer
  plugin :validation_helpers

  def validate
    super()
    validates_presence :first_name
    validates_presence :last_name
    validates_presence :image_uri
  end
end
