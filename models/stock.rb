require_relative ('../db/sql_runner')


class Stock

  attr_reader :id, :album_id
  attr_accessor :quantity, :buy_price, :sell_price, :reorder_level

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @album_id = options['album_id'].to_i
    @quantity = options['quantity'].to_i
    @buy_price = options['buy_price'].to_f
    @sell_price = options['sell_price'].to_f
    @reorder_level = options['reorder_level'].to_i
  end

  def save()
    sql = "INSERT INTO stocks
    (album_id, quantity, buy_price, sell_price, reorder_level)
    VALUES
    ($1, $2, $3, $4, $5) RETURNING *"
    values = [@album_id, @quantity, @buy_price, @sell_price, @reorder_level]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE stocks SET
    (album_id, quantity, buy_price, sell_price, reorder_level)
    = ($1, $2, $3, $4, $5)
    WHERE id = $6;"
    values = [@album_id, @quantity, @buy_price, @sell_price, @reorder_level, @id]
    SqlRunner.run(sql, values)
  end

  def check_stock_level
    if @quantity > @reorder_level
      reorder_status = "Stock ok."
    else
      reorder_status = "Re-order item."
    end
  end

  def self.delete_all()
    sql = "DELETE FROM stocks"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM stocks"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |stock_hash| Stock.new(stock_hash) }
  end

end
