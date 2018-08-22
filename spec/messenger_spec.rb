require 'messenger'

describe Message do
  let(:offer) { double :offer, title: 'car'}
  describe '#send' do
    it 'sends a message' do
      VCR.use_cassette('twilio') do
        Message.send(offer, {:name => 'John', :number => 123})
      end
    end
  end
end
