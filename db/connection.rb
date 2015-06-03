require 'sequel'
require 'pg'

DB = Sequel.connect(ENV.fetch('DATABASE_URL') { 'postgres://:@localhost:5432/team-index-sinatra_development' })
