require 'sinatra'
require 'sinatra/reloader' if development?

get '/chess' do

	# make top row with 8 cells starting with white
	row = [nil, 1] * 4

	# make board 8x8
	@board = []
	8.times { |t| @board += (t.even? ? row : row.reverse) }

	erb :board, :layout => :layout	

end