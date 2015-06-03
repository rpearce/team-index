require 'sequel'
require_relative './connection'

DB.create_table :members do
  primary_key :id
  varchar :first_name
  varchar :last_name
  varchar :image_uri
end
