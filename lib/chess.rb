#!/usr/bin/ruby
require_relative './string.rb'
require_relative './board.rb'
require_relative './pieces.rb'
require_relative './game.rb'
require 'yaml'

class Chess
  attr_accessor :board 
  
  def initialize
    @game_over = false
    main_menu
  end
  
  def main_menu
    app_on = true
    while app_on == true
      print %(
        Welcome to CHESS. Would you like to start a
        NEW game or LOAD a SAVED game?
        
        1 = NEW game
        2 = LOAD a SAVED game
        3 = QUIT
        
        Enter 1, 2 or 3: )
        valid_answer = false
        while valid_answer == false
          @new_or_saved = gets.chomp.to_i
          if @new_or_saved == 1
            valid_answer = true
            @game = Game.new(false, false)
          elsif @new_or_saved == 2
            valid_answer = true
            saved_games_menu
          elsif @new_or_saved == 3
            app_on = false
            break
        else print %(You may only enter 1, 2 or 3.  Try again.)
        end
      end
    end
  end

  def saved_games_menu
    saved_games_hash = {}
    saved_games = Dir['./yaml/*.yml'].to_a
    saved_games.map!.with_index do |f, index|
      saved_games_hash[index + 1] = f
    end
    saved_games_readable = []
    saved_games_hash.each do |key, value|
      value = value.sub('./yaml/', '')
      value = value.sub('.yml', '')
      saved_games_readable.push("#{key}: #{value}")
    end
    saved_games_readable = saved_games_readable.join("\n      ")
    print %(
      Select the number corresponding to your saved game
      from the list below:

      #{saved_games_readable}

      Enter a number: )
    selected_game = gets.chomp.to_i
    selected_game = saved_games_hash.values_at(selected_game)
    load_game(selected_game)
  end

  def load_game(selected_game)
    selected_game = selected_game.join('')
    game_data = YAML.load_file(selected_game)
    # @solution_word = game_data.values_at(:solution_word).join('')
    # @misses = game_data.values_at(:misses).join('').to_i
    # @guess_array = game_data.values_at(:guess_array).flatten
    # @letters = game_data.values_at(:letters).flatten
    # @solution_array = @solution_word.split('')
    # @all_guesses = game_data.values_at(:all_guesses).flatten
    @game = Game.new(true, game_data)
  end


end


Chess.new