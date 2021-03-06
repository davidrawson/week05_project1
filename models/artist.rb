require_relative ('../db/sql_runner')


class Artist

  attr_reader :id, :name

  def initialize (options)
    @id = options['id'] if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING *;"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE artists SET name = $1
    WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map{|album_hash| Album.new(album_hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    artist = SqlRunner.run(sql, values)
    return Artist.new( artist.first )
  end

  def self.all
    sql = "SELECT * FROM artists"
    values = []
    artists = SqlRunner.run(sql, values)
    result = artists.map{|artist_hash| Artist.new(artist_hash)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    values = []
    SqlRunner.run(sql, values)
  end

end
