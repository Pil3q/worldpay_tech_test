require 'database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it 'sets up a connection with database' do
      expect(PG).to receive(:connect).with(dbname: 'merchant_test')

      DatabaseConnection.setup('merchant_test')
    end
  end

  describe '#query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('merchant_test')

      expect(connection).to receive(:exec).with("SELECT * FROM offers;")

      DatabaseConnection.query("SELECT * FROM offers;")
    end
  end
end
