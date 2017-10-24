# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Seeding started..'
  # Чистим базу
  DatabaseCleaner.clean_with(:truncation, :only => ['roles','users','journeys','places',
                                                                    'journeys_users'])
  
  p 'Cleaning tables complete..'
  
  p 'Creating roles..'

  ['registered', 'admin'].each do |role|
	 Role.find_or_create_by({name: role})
	end

	p 'Creating admin..'

  pass = '12345678'
  User.create!(
	  email:    'admin@example.com',
	  password: pass,
	  password_confirmation: pass,
	  role_id: 2,
	  first_name: 'admin',
	  last_name: 'admin',
	)

	5.times do |i|
   User.create!(
        first_name:  Faker::Name.first_name,
        last_name:   Faker::Name.last_name,
        password:  pass,
        password_confirmation: pass,
        city:      Faker::Address.city,
        email:     "#{i}_" + Faker::Internet.safe_email, # у фейкера мыла дублируюся как я понял
    		role_id: 1,
    )
    puts "create user ##{i}" if i
  end

r = Random.new
p 'Creating journeys..'
  
  100.times do |i|
  	@journey = Journey.create!(
  		:count_of_seats     => r.rand(15..50),
      :place_of_departure => Faker::Address.city,
      :date_of_departure  => Faker::Time.forward(1),
      :place_of_arrive    => Faker::Address.city,
      :date_of_arrive     => Faker::Time.between(DateTime.now + 2, DateTime.now + 3),
  	)
  	
	puts "create journey ##{i}" if i
  end
