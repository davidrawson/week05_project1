require_relative ('../db/sql_runner')
require ('pry-byebug')

class Sale

  attr_reader :id, :album_id, :buy_price, :sell_price

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @album_id = options['album_id'].to_i
    @buy_price = options['buy_price'].to_f
    @sell_price = options['sell_price'].to_f
  end


  def save
    sql = "INSERT INTO sales (album_id, buy_price, sell_price)
    VALUES ($1, $2, $3) RETURNING *"
    values = [@album_id, @buy_price, @sell_price]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.best_sellers
    sql = "SELECT album_id,
    COUNT (album_id)
    FROM sales
    GROUP BY album_id;"
    values = []
    result = SqlRunner.run(sql, values)

    # binding.pry
  end

  def self.delete_all
    sql = "DELETE FROM sales"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM sales"
    values = []
    sales = SqlRunner.run(sql, values)
    result = sales.map{|sales_hash| Sale.new(sales_hash)}
    return result
  end


end
