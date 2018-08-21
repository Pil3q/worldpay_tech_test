require_relative '../database_connection_setup'

class Offer
  TIME_NOW = Time.new.strftime("%Y%m%d%H%M%S")
  attr_reader :id, :title, :description, :price, :currency, :duration, :status, :created_at
  def initialize(id, title, description, price, currency, duration, status, created_at)
    @id = id
    @title = title
    @description = description
    @price = price
    @currency = currency
    @duration = duration
    @status = status
    @created_at = created_at
  end

  def self.create(content)
    initial_status = 'live'
    offer_created_at = TIME_NOW
    result = DatabaseConnection.query("INSERT INTO offers(title, description, price, currency, duration, status, created_at) VALUES('#{content[:title]}', '#{content[:description]}', '#{content[:price]}', '#{content[:currency]}', '#{content[:duration]}', '#{initial_status}', #{offer_created_at}) RETURNING *")
    Offer.new(result.first['id'], result.first['title'], result.first['description'], result.first['price'], result.first['currency'], result.first['duration'], result.first['status'], result.first['created_at'])
  end

  def self.show
    result = DatabaseConnection.query("SELECT * FROM offers")
    result.map { |offer| Offer.new(offer['id'], offer['title'], offer['description'], offer['price'], offer['currency'], offer['duration'], offer['status'], offer['created_at']) }
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM offers WHERE id = '#{id}'")
    Offer.new(result.first['id'], result.first['title'], result.first['description'], result.first['price'], result.first['currency'], result.first['duration'], result.first['status'], result.first['created_at'])
  end

  def self.cancel(id)
    DatabaseConnection.query("UPDATE offers SET status = 'cancelled' WHERE id = '#{id}'")
  end

  def expired?
    self.created_at.to_i + self.duration.split(':').join.to_i < TIME_NOW.to_i
  end
end
