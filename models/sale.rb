require_relative ('../db/sql_runner')
require ('pry-byebug')
require_relative ('./bestseller.rb')

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

  def self.till_value
    sql = "SELECT SUM(sell_price) sell_price FROM sales"
    values = []
    total_sales = SqlRunner.run(sql, values)[0]['sell_price'].to_f
    # binding.pry
    return total_sales
  end

  def self.profit
    sql = "SELECT SUM(buy_price) buy_price FROM sales"
    values = []
    total_buy_price = SqlRunner.run(sql, values)[0]['buy_price'].to_f
    profit = self.till_value() - total_buy_price
    return profit
  end

  def self.bestsellers
    sql = "SELECT album_id,
    COUNT (album_id)
    FROM sales
    GROUP BY album_id
    ORDER BY COUNT (album_id) DESC;"
    values = []
    result = SqlRunner.run(sql, values)

    bestsellers = result.map{|result_hash| Bestseller.new(result_hash)}
    # binding.pry
    return bestsellers
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
