module Players
  class Computer < Player

    MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    def move(board)
      #return a valid move somehow!
      #develop AI here
      #MOVES.find{|pos| !board.taken?(pos)}
      opponent = ""
      win = nil
      lose = nil
      comb = nil
      self.token == "X" ? opponent = "O" : opponent = "X"
      return "5" if !board.taken?("5")
      return ["1", "3", "7", "9"].sample if board.turn_count == 1
      win = WIN_COMBINATIONS.find{|c| (board.cells[c[0]] == self.token && board.cells[c[1]] == self.token) || (board.cells[c[1]] == self.token && board.cells[c[2]] == self.token) || (board.cells[c[0]] == self.token && board.cells[c[2]] == self.token)}
      if win
        return win.find{|pos| board.cells[pos] == " "}.to_s
      end
      lose = WIN_COMBINATIONS.find{|c| (board.cells[c[0]] == opponent && board.cells[c[1]] == opponent) || (board.cells[c[1]] == opponent && board.cells[c[2]] == opponent) || (board.cells[c[0]] == opponent && board.cells[c[2]] == opponent)}
      if lose
        return lose.find{|pos| board.cells[pos] == " "}.to_s
      end
      comb = WIN_COMBINATIONS.find{|c| board.cells[c[0]] == self.token || board.cells[c[1]] == self.token || board.cells[c[2]] == self.token}
      comb ? comb.sample.to_s : MOVES.sample
    end
  end
end
