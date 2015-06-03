all: bundle db_create db_create_members

bundle:
	bundle

db_create:
	createdb team-index-sinatra_development

db_create_members:
	ruby db/create_members.rb

db_drop:
	dropdb team-index-sinatra_development
