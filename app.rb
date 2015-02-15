require 'sinatra'
require 'sinatra/reloader'

class Todo
	attr_accessor :done, :important, :text
end



TODOS = []

get '/' do 
	erb :todos, locals: { todos: TODOS}
end

post '/add' do
	t = Todo.new
	t.text = params[:todo]
	t.important = params[:important]

	TODOS << t
	redirect('/')
end 

get '/done/:i' do
	TODOS[params[:i].to_i].done = true
	redirect('/')
end

get '/reopen/:i' do
	TODOS[params[:i].to_i].done = false
	redirect('/')
end



