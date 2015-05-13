chessBoard = Array.new(8) {Array.new(8)}

chessBoard.each_index do |x|
	subarray = chessBoard[x]
	subarray.each_index do |y|

		if x.even? and y.even?
			chessBoard[x][y] = 'white'
		elsif x.even? and y.odd?
			chessBoard[x][y] = 'black'
		end

		if x.odd? and y.even?
				chessBoard[x][y] = 'black'
		elsif x.odd? and y.odd?
				chessBoard[x][y] = 'white'
		end
	end
end

chessBoard.each do |row|
    row.each do |cell|
			puts cell
    end
    puts "--"
end