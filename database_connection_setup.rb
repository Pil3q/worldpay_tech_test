require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('merchant_test')
else
  DatabaseConnection.setup('merchant')
end
