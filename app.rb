require 'sinatra/base'
require './database_connection_setup'
require './lib/offer'
require './lib/messenger'

class Merchant  < Sinatra::Base
  run! if app_file == $0

  get '/' do
    redirect('/offers')
  end

  get '/offers' do
    @offers = Offer.show
    erb :"offers/index"
  end

  get '/offers/new' do
    erb :"offers/new"
  end

  post '/offers' do
    Offer.create(params)
    redirect '/offers'
  end

  post '/offers/:id/cancel' do
    Offer.cancel(params['id'])
    redirect '/offers'
  end
end
