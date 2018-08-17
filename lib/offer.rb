require_relative '../database_connection_setup'

class Offer
  attr_reader :id, :title, :description, :price, :currency
  def initialize(id, title, description, price, currency)
    @id = id
    @title = title
    @description = description
    @price = price
    @currency = currency
  end

  def self.create(content)
    result = DatabaseConnection.query("INSERT INTO offers(title, description, price, currency) VALUES('#{content[:title]}', '#{content[:description]}', '#{content[:price]}', '#{content[:currency]}') RETURNING *")
    Offer.new(result.first['id'], result.first['title'], result.first['description'], result.first['price'], result.first['currency'])
  end

  def self.show
    result = DatabaseConnection.query("SELECT * FROM offers")
    result.map { |offer| Offer.new(offer['id'], offer['title'], offer['description'], offer['price'], offer['currency']) }
  end
end
