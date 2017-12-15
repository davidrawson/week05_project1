require_relative ('../db/sql_runner')


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
