require_relative ('../db/sql_runner')
require ('pry-byebug')


class Bestseller

  attr_reader :id, :album_id, :quantity

  def initialize (options)
    @album_id = options['album_id']
    @quantity = options['count']
  end

end
