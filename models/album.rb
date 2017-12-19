require_relative ('../db/sql_runner')
require ('pry-byebug')


class Album

  attr_reader :id, :title, :artist_id, :format, :thumb_url

  def initialize (options)
    @id = options['id'] if options['id']
    @title = options['title']
    @artist_id = options['artist_id']
    @format = options['format']
    @thumb_url = options['thumb_url']
  end

  def save()
    sql = "INSERT INTO albums
    (title, artist_id, format, thumb_url)
    VALUES
    ($1, $2, $3, $4) RETURNING *"
    values = [@title, @artist_id, @format, @thumb_url]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
    #Stock.blank_entry(@id)
  end

  def update()
    sql = "UPDATE albums SET (title, artist_id, format, thumb_url) =
    ($1, $2, $3, $4)
    WHERE id = $5;"
    values = [@title, @artist_id, @format, @thumb_url, @id]
    SqlRunner.run(sql, values)
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result =  SqlRunner.run(sql, values)[0]
    return Artist.new(result)
    #return result.map{|artist_hash| Artist.new(artist_hash)}
  end

  def stock
    sql = "SELECT * FROM stocks WHERE album_id = $1"
    values = [@id]
    result =  SqlRunner.run(sql, values)[0]
    #binding.pry
    return Stock.new(result)
  end

  def sell_item
    p "Hiya"
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    album = SqlRunner.run(sql, values)
    return Album.new( album.first )
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |album_hash| Album.new(album_hash) }
  end

end
