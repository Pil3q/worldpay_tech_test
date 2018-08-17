require 'pg'

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'merchant_test')
  connection.exec("TRUNCATE offers;")
end

task :setup do
  p 'Creating databases...'

  ['merchant', 'merchant_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")

    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE offers(id SERIAL PRIMARY KEY, title VARCHAR(60), description VARCHAR(240), price NUMERIC, currency VARCHAR(10), created_at VARCHAR(20), duration INTEGER, status VARCHAR(20));")
  end
end

task :teardown do
  p "You are going to loose it all, type yes if you want to clear databases"

  confirm = STDIN.gets.chomp

  return unless confirm == 'yes'

  ['merchant', 'merchant_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{ database }")
  end
end
