require 'rails_helper'

RSpec.describe Apartment, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  it 'should validate bedrooms' do 
    apartment = user.apartments.create(
      street: 'ABC Sesame Street',
      unit: '20',
      city: 'Sesame',
      state: 'MUPPET',
      square_footage: 3000,
      price: "1900",
      bathrooms: 3,
      pets: "puppets only",
      image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg"
    )
    expect(apartment.errors[:bedrooms]).to include "can't be blank"
  end

  it 'should validate a user_id' do 
    apartment = Apartment.create(
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
    expect(apartment.errors[:user_id]).to include "can't be blank"
  end
end