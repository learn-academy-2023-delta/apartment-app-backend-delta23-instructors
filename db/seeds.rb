user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

user1_apartments = [
  {  street: 'ABC Sesame Street',
    unit: '20',
    city: 'Sesame',
    state: 'MUPPET',
    square_footage: 3000,
    price: "1900",
    bedrooms: 5,
    bathrooms: 3,
    pets: "puppets only",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg"
  },
  {  
    street: 'Elm St',
    unit: '216',
    city: 'Scary Ville',
    state: 'AH',
    square_footage: 10000,
    price: "5000",
    bedrooms: 1,
    bathrooms: 5,
    pets: "not allowed",
    image: "https://images.unsplash.com/photo-1621620844943-3c7f2b9d3300?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80"
  }
]

user2_apartments = [
  {
    street: 'Walaby Way',
    unit: '42',
    city: 'Sydney',
    state: 'New South Whales',
    square_footage: 2000,
    price: "25000",
    bedrooms: 3,
    bathrooms: 2,
    pets: "fish",
    image: "https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
  }
]

user1_apartments.each do |apartment|
  user1.apartments.create(apartment)
  p "created: #{apartment}"
end

user2_apartments.each do |apartment|
  user2.apartments.create(apartment)
  p "created: #{apartment}"
end