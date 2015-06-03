require 'json'
require 'sinatra/base'
require 'tilt/erb'
require './db/connection'
require './models/member'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/members.json' do
    @members = Member.all
    status 200
    @members.to_json
  end

  post '/members' do
    create_member(params)
  end

  post '/members.json' do
    create_member(get_attrs)
  end

  delete '/members' do
    delete_member(params)
  end

  delete '/members.json' do
    delete_member(get_attrs)
  end

  private

  def get_attrs
    JSON.parse(request.body.read, symbolize_names: true)
  end

  def create_member(attrs)
    @member = Member.new do |m|
      m.first_name = attrs[:first_name]
      m.last_name = attrs[:last_name]
      m.image_uri = attrs[:image_uri]
    end

    begin
      @member.save
      status 201
      body "Success! Added #{@member.first_name} #{@member.last_name}"
    rescue
      halt 422, @member.errors.to_json
    end
  end

  def delete_member(attrs)
    halt 400 unless !!attrs[:first_name] and !!attrs[:last_name]

    @members = Member.where(first_name: attrs[:first_name], last_name: attrs[:last_name])
    @members.map(&:destroy)
    status 200
    body "Deleted users where first_name=#{attrs[:first_name]} and last_name=#{attrs[:last_name]}"
  end
end
