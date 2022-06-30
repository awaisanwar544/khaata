require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/categories/:category_id/payments'
      # Expected to be found but inaccesible due to authorization
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST /index' do
    it 'returns http success' do
      post '/categories/:category_id/payments'
      # Expected to be found but inaccesible due to authorization
      expect(response).to have_http_status(:found)
    end
  end
end
