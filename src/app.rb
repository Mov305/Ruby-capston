require_relative "storage"
require_relative "actions/utiles_helper"

class App
  def initialize
    @store = Store.new
    @B_utiles = BookUtiles.new(@store)
    @M_utiles = MusicUtiles.new(@store)
    @Movies_utiles = MovieUtiles.new(@store)
    @G_utiles = GameUtiles.new(@store)
  end

  def sub_processor(option)
    case option
    when 1
      @store.books.each do |book|
        puts "id: #{book.id}, Publisher: #{book.publisher}, Publish Date: #{book.publish_date}, Cover State: #{book.cover_state}, label: #{book.label}"
      end
    when 2
      @store.musics.each do |music|
        puts "Title: #{music.title}, Publish Date: #{music.publish_date}, on Spotify: #{music.on_spotify}, genre: #{music.genre}"
      end
    when 3
      @store.movies.each do |movie|
        puts "Silent: #{movie.silent}, Publish Date: #{movie.publish_date}, source: #{movie.source}"
      end
    when 4
      @store.games.each do |game|
        puts "Mutiplayer: #{game.mutiplayer}, Last Played At: #{game.last_played_at}, Author: #{game.author}"
      end
    else
      puts "Invalid option"
    end
  end

  def main_processor(option)
    case option
    when 1
      puts "List Items
    1. Books
    2. Music albums
    3. Movies
    4. Games"

      sub_option = gets.chomp.to_i
      # handle option
      sub_processor(sub_option)
    when 2
      @B_utiles.add_book
    when 3
      @M_utiles.add_music_album
    when 4
      @Movies_utiles.add_movie
    when 5
      @G_utiles.add_game
    when 6
      @store.save_data
      return true
    else
      puts "Invalid option"
    end
    false
  end
end
