require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }
  describe "GET /index" do
    it 'gets a list of apartments' do 
      apartment = user.apartments.create(
        street: 'ABC Sesame Street',
        unit: '20',
        city: 'Sesame',
        state: 'MUPPET',
        square_footage: 3000,
        price: "1900",
        bedrooms: 5,
        bathrooms: 3,
        pets: "puppets only",
        image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg"
      )

      get '/apartments'
      apartment = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.first['street']).to eq 'ABC Sesame Street'
    end
  end

  describe "POST/create" do 
    it "creates an apartment" do 
      apartment_params = {
        apartment: {
          street: 'ABC Sesame Street',
          unit: '20',
          city: 'Sesame',
          state: 'MUPPET',
          square_footage: 3000,
          price: "1900",
          bedrooms: 5,
          bathrooms: 3,
          pets: "puppets only",
          image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(200)
      apartment = Apartment.first
      expect(apartment.street).to eq 'ABC Sesame Street'
    end
  end

  it "does not create an apartment without a street" do 
    apartment_params = {
        apartment: {
          unit: '20',
          city: 'Sesame',
          state: 'MUPPET',
          square_footage: 3000,
          price: "1900",
          bedrooms: 5,
          bathrooms: 3,
          pets: "puppets only",
          image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params 
      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['street']).to include "can't be blank"
  end
end
