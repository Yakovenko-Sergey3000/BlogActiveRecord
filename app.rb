require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, {adapter: "sqlite3", database: "blog.sqlite"}

class Post < ActiveRecord::Base

end 

class Comment < ActiveRecord::Base

end

get '/' do 
  erb :post
end 

get '/newpost' do 
  erb :newpost
end  

post '/newpost' do 
  @p = Post.new params[:post] 
  @p.save

  erb "New post send"
end  