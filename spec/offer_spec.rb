require 'offer'

describe Offer do
  before(:each) do
    @offer = Offer.create(title: 'car', description: 'super fast', price: 100000.51, currency: 'GBP')
  end

  describe '#create' do
    it 'creates a new offer' do
      expect(@offer.id).not_to be_nil
      expect(@offer.title).to eq 'car'
      expect(@offer.description).to eq 'super fast'
      expect(@offer.price).to eq '100000.51'
      expect(@offer.currency).to eq 'GBP'
    end
  end

  describe '#show' do
    it 'returns all offers, wrapped in a Offer instance' do
      offers = Offer.show

      results = offers.map(&:description)

      expect(results).to include("super fast")
    end
  end
end
