require 'offer'

describe Offer do
  before(:each) do
    @offer = Offer.create(title: 'car', description: 'super fast', price: 100000.51, currency: 'GBP', duration: '24:00:00')
  end

  describe '#create' do
    it 'creates a new offer' do
      expect(@offer.id).not_to be_nil
      expect(@offer.title).to eq 'car'
      expect(@offer.description).to eq 'super fast'
      expect(@offer.price).to eq '100000.51'
      expect(@offer.currency).to eq 'GBP'
      expect(@offer.duration).to eq '24:00:00'
      expect(@offer.status).to eq 'live'
    end
    it 'creates a new offer with the right time' do
      time_now = Time.new.strftime("%Y%m%d%H%M%S")
      expect(@offer.created_at).to eq time_now
    end
  end

  describe '#show' do
    it 'returns all offers, wrapped in a Offer instance' do
      offers = Offer.show

      results = offers.map(&:description)

      expect(results).to include("super fast")
    end
  end

  describe '#find' do
    it 'finds offer by index' do
      result = Offer.find(@offer.id)
      expect(result.title).to eq 'car'
      expect(result.description).to eq 'super fast'
      expect(result.price).to eq '100000.51'
      expect(result.currency).to eq 'GBP'
      expect(result.duration).to eq '24:00:00'
      expect(result.status).to eq 'live'
    end
  end

  describe '#cancel' do
    it 'cancel (change status of the offer)' do
      Offer.cancel(@offer.id)
      cancelled_offer = Offer.find(@offer.id)
      expect(cancelled_offer.status).to eq 'cancelled'
    end
  end

  describe 'expired' do
    it 'finds if offer expierd' do
      expired_offer = Offer.create(title: 'car', description: 'super fast', price: 100000.51, currency: 'GBP', duration: '-24:00:00')
      expect(@offer.expired?).to eq false
      expect(expired_offer.expired?).to eq true
    end
  end
end
