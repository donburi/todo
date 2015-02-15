require 'minitest/autorun'
require 'rack/test'
require_relative 'app'

class TestSinatra < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_adding_a_todo
    post '/add', { todo: 'My todo'}
    response = get '/'
    assert_includes(response.body, "My todo")
    
    post '/add', { todo: 'Todo 2'}
    response = get '/'
    assert_includes(response.body, "Todo 2")
  end
end