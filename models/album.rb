require ('../db/sql_runner')


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





end
