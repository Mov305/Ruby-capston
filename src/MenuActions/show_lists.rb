class ShowLists
  def on_spotify?(music_album)
    "On Spotify: #{music_album.on_spotify ? 'Yes' : 'No'}"
  end

  def list_all_book(books)
    books.each do |book|
      puts "Publisher: #{book.publisher} \nCover State: #{book.cover_state} "
      puts "Published Date: #{book.publish_date} \nTitle: #{book.label.title} \nColor: #{book.label.color}\n\n"
    end
  end

  def list_labels(labels)
    labels.each do |label|
      puts "Title: #{label.title} Color: #{label.color}"
    end
  end

  def list_all_music_albums(music_albums)
    music_albums.each do |music_album|
      puts "Published in: #{music_album.publish_date}, #{on_spotify?(music_album)}, Genre: #{music_album.genre.name}"
    end
  end

  def list_all_genres(genres)
    genres.each do |genre|
      puts genre.name
    end
  end

  def multiplayer?(game)
    "Multiplayer: #{game.multiplayer ? 'Yes' : 'No'}"
  end

  def list_all_games(games)
    games.each do |game|
      puts "Name: #{game.name}, #{multiplayer?(game)}, Author: #{game.author.name}, Last played: #{game.last_played_at}"
    end
  end

  def list_game_authors(authors)
    authors.each do |author|
      puts author.name
    end
  end
end
