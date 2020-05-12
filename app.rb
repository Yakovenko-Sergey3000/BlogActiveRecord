require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, {adapter: "sqlite3", database: "blog.sqlite"}

class Post < ActiveRecord::Base
  validates :name, presence: true
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
   if @p.save
        erb "New post send"
  else 
    @error = @p.errors.full_messages.first
    erb :newpost
  end 

  
end  