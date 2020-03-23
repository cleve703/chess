require_relative '../lib/chess.rb'
require_relative '../lib/board.rb'
require_relative '../lib/pieces.rb'
require_relative '../lib/string.rb'

describe "Chess" do
  describe "#analyze_board_check" do
    it "Returns true if white rook is in attack position of black king" do
      game = Game.new
      game.board.update_hash(game.board.black_king, [3,4], game.board.board_hash)
      game.board.update_hash(game.board.white_rook1, [3,5], game.board.board_hash)
      expect(game.analyze_board_check("black", game.board.board_hash)).to eql(true)
    end
    it "Returns false if no white pieces are in attack position fo black king" do
      game = Game.new
      expect(game.analyze_board_check("black", game.board.board_hash)).to eql(false)
    end
  end
  describe "#analyze_board_check_mate" do
    it "Returns true if black king is in check with nowhere to go" do
      game = Game.new
      game.board.update_hash(game.board.black_king, [3,5], game.board.board_hash)
      game.board.update_hash(game.board.white_rook1, [1,5], game.board.board_hash)
      game.board.update_hash(game.board.white_rook2, [3,3], game.board.board_hash)
      game.board.update_hash(game.board.white_bishop1, [5,3], game.board.board_hash)
      game.board.update_hash(game.board.white_bishop2, [1,3], game.board.board_hash)
      expect(game.analyze_board_check_mate("black", game.board.board_hash)).to eql(true)
    end
    it "Returns false if black king is not in check" do
      game = Game.new
      expect(game.analyze_board_check_mate("black", game.board.board_hash)).to eql(false)
    end
    it "Returns false if black king is in check, but able to move out of check" do
      game = Game.new
      game.board.update_hash(game.board.black_king, [3,4], game.board.board_hash)
      game.board.update_hash(game.board.white_rook1, [3,5], game.board.board_hash)
      expect(game.analyze_board_check_mate("black", game.board.board_hash)).to eql(false)
    end

  end
end