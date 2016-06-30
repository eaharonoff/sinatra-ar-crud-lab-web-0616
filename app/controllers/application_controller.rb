require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    
  end

  get '/posts/new' do 
    erb :new
  end

  post '/posts' do 
    @blog_post = Post.create(params)
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all 
    erb :index
  end

  get '/posts/:id' do 
    @blogger = Post.find(params[:id])
    erb :show 
  end

  get "/posts/:id/edit" do 
    @blogger = Post.find(params[:id])
    erb :edit 
  end

  patch "/posts/:id" do
    @update_post = Post.find(params[:id])
    @update_post.update(name: params["name"], content: params["content"])
    redirect "/posts/#{params[:id]}"
  end

  delete '/posts/:id/delete' do 
    @post_to_delete = Post.find(params[:id])
    @name = @post_to_delete.name 
    @post_to_delete.destroy
    erb :deleted  
  end

end