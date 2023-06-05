namespace :dev do
  desc "Pre-populate database with dummy data"
  task prime: :environment do
    if Rails.env.production?
      ActiveRecord::Base.connection.tables.each do |t|
        ActiveRecord::Base.connection.reset_pk_sequence!(t)
      end
    end
    
    User.destroy_all
    users = [
      { id: 1, email: "alice@example.com", name: "Alice Smith", created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 2, email: "bob@example.com", name: "Bob Smith", created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 3, email: "carol@example.com", name: "Carol Smith", created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 4, email: "osi@example.com", name: "Osi Okoro", created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 5, email: "riddhi@example.com", name: "Riddhi Shah", created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 6, email: "fatimah@example.com", name: "Fatimah Asghar", created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 7, email: "chase@example.com", name: "Chase Young", created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 8, email: "zapp@example.com", name: "Zapp Greene", created_at: 1.day.ago, updated_at: 1.day.ago}
    ]

    User.insert_all!(users)
    User.find_each do |user|
      user.password = "password"
      user.save
    end
    puts "#{User.count} users"

    Room.destroy_all
    rooms = [
      { id: 1, number_of_bedrooms: 1, name: "Traveler's Dream - 1 bed in a shared bedroom", description: "About this space Join us at Freehand Chicago Hotel for your travels in Chicago. Perfect for travelers here too long for a traditional hotel or for just 1 night; make us your home away from home. This listing is for one bunk for one person in a shared mixed/co-ed room with 4 bunks (up to 3 roommates). We have many options such as private standard rooms and private quad rooms. Please send us a message with any questions. $5 nightly resort fee plus tax paid at the property The space Somewhere between a hostel and hotel, you'll find the amenities you need to get through anywhere from a week to a few months. This listing is for one twin bunk in a shared room with four total bunks, so you would have up to 3 roommates. The room has a private bathroom and lockers for storing valuables. Each bunk features a curtain for privacy, reading lamp, and power outlet. Linens and towels are included, as is regular housekeeping service. One piece of luggage, one personal item (such as a book bag), and 3-4 hanging items of clothing permitted. For the lockers, guests are welcome to use their own lock or the front desk sells combination padlocks for $5. Please ask the front desk if you need complimentary extra towels, blankets, or toiletries. Guest access Besides your bunk, you will have access to all public spaces and amenities at the hotel including the Broken Shaker cocktail bar. Coin-operated and valet laundry are available. Other things to note To check-in, the hotel requires guests must be 18 or older with a government-issued photo ID. Your room and tax will be prepaid through Airbnb, but the hotel requires a $50 deposit for incidentals on a card at check-in per room, per stay. We do not accept gift cards, prepaid cards, or cash for incidentals. The deposit will be released back to your card at checkout provided you do not charge anything to your room. It takes most banks 3-10 business days to process the release. $5 nightly resort fee plus tax paid at the property For long term stays, guests must move rooms about every 30 days.", address: "19 E Ohio St, Chicago, IL 60611, USA", cost_per_night: 25, host_id: 6, number_of_bathrooms: 1, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 2, number_of_bedrooms: 1, name: "Luxury Stay - Claridge House, Queen Room", description: "About this space Gold Coast stunner with newly-renovated rooms, bar, and an onsite spa and fitness center. Well-situated location puts you steps from Lake Michigan and high-end Gold Coast boutiques. The space Serene, polished rooms are done up in sophisticated neutrals, creating a true urban oasis – complete with pillowtop beds and spa-style shower. Juniper dishes up handcrafted cocktails in a stylish, inviting setting. Your room will include: Free WiFi Flat-screen TV Pillowtop beds Spa-style shower Bath amenities Bathrobes Steamer Mini-fridge Coffeemaker Hairdryer Room service The space offers: Juniper bar Spa Fitness center $59/night Valet Parking Available Other things to note We charge a nightly Urban Fee of $23.48 (tax inclusive) per room/per night. This is paid directly upon your arrival, and is not included in your total quoted by and paid to AirBnB. Registered guests must be 21 years of age to check-in. Upon arrival, we require Government-Issued Photo ID and a credit card matching the name on the reservation. Credit card is authorized for $100 at check-in to cover any incidental charges you may incur (bar, spa, etc). Unused funds will be released immediately upon checkout, though be aware your financial institution may take an additional 3-7 days to remove the pending record.", address: "1242 North Dearborn Street, Chicago, IL 60610", cost_per_night: 68, host_id: 4, number_of_bathrooms: 1, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 3, number_of_bedrooms: 1, name: "Queen Bed with Private Bathroom in Boystown", description: "Queen bed with a private bathroom located in the heart of Boystown and a ten minute walk to Wrigley Field, this room has Wifi, a TV, a fridge and microwave is located outside of the room and light breakfast is in the kitchen. We have free street parking around us.", address: "814 West Newport Avenue, Chicago, IL 60657", cost_per_night: 35, host_id: 2, number_of_bathrooms: 1, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 4, number_of_bedrooms: 2, name: "Long stays welcome@warm&cute vintage 2BR", description: "About this space This musically-inspired vintage 2 BR is perfectly placed in Oak Park and we know you'll have a rockin' vacation here. Steps to shops, cafes, train, and FL Wright home. With a cassette wall, reading nook, and many other cute touches. The apartment is a vintage brownstone with charming details, like original woodwork. Street parking available. Easy access to Chicago.The place is an older Chicago brownstone, with a lived-in feel. NO PARTIES!! Upstairs neighbors can be heard walking and moving The space This is a family-friendly space in a quiet neighborhood. We are strict about no smoking and quiet hours, as we love our tenants and neighbors. A dog and some cats live in the building, so please know that you may see or hear them! Guest access You'll have access to the front porch and entire bathroom. If laundry is important to you, just let me know and we can figure something out! Parking is easy on the street, as long as you get a pass from the village. Other things to note A quick note that there is a family upstairs. With COVid, they’re home frequently. You will hear them walking around- it’s an older building and sound travels. We supply white noise machines, but there is always some ambient noise", address: "1115 Chicago Avenue, Oak Park, IL 60302", cost_per_night: 91, host_id: 6, number_of_bathrooms: 1, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 5, number_of_bedrooms: 2, name: "Mid-Century Modern Charm. Close to Chicago.", description: "About this space Step back in time a bit with our charming 2nd floor walk-up in a quiet, safe suburb. Newly remodeled but with a vintage, welcoming vibe. A short walk to the train or a 20-minute drive to downtown Chicago. We live downstairs and are happy to say hi, or happy to leave you in peace, whichever you prefer. 1 Guest Parking spot. Additional Free Parking available. Great wifi. 3-season back porch. Feel free to relax in our welcoming back yard. Record Player (Real Vinyl!) The space This is a truly unique 2nd floor apartment that has been newly renovated. complete with a real record player and a retro fridge in the kitchen, you will feel so at home here. The middle bedroom has a one-of-a-kind headboard. the 2nd bedroom has a trundle bed. Our suggestion is good old game of rock-paper-scissors to see who gets the rolling trundle! Guest access Feel free to make yourself at home on the back porch or in our welcoming back yard which has a gas grill and a charcoal 'bucket' grill. spend much time out there and you'll probably meet our dogs Charley and Boji...both of them are super friendly! Other things to note ABOUT YOUR HOSTS: Gigi owns and runs her own theatre and theatre school;The Actors Garden. Dave is a professional playwright. Together, they've created countless productions together. and... they've also created their own cocktail book!", address: "7240 13th Street, Forest Park, IL 60130", cost_per_night: 95, host_id: 2, number_of_bathrooms: 1, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 6, number_of_bedrooms: 3, name: "Spacious home near Chicago, fenced yard for pets", description: "About this space Modern single family home with over 2100 sqft of space including 3 bedrooms, & 2.5 bathrooms. Located in a quiet neighborhood with free parking, our home has easy access to trains & major highways. We're a short ride from Downtown Chicago, Midway Airport, Tinley Park Convention Center, Hollywood Casino Amphitheatre, universities, shopping & dining. Enjoy a fully stocked kitchen, washer/dryer, WIFI, smart tv & spacious deck. Come unwind in a cozy living space during your trip to Illinois! The space Relax in 1 of our 3 bedrooms or indulge in our deep soaking tub. In the bathroom, we have provided you with plush towels, shampoo, conditioner, body wash, and soap. Our bedrooms include 1 king bed, 1 queen bed, 2 twin beds, and 1 sofa sleeper. Enjoy free parking and get anywhere fast by jumping on the nearby train or taking a short drive. We are a short ride away from Downtown Chicago, Midway Airport, Tinley Park Convention Center, Hollywood Casino Amphitheatre, Governors State University and Prairie State College. We are also minutes away from plenty of grocery stores, shopping, dining, and entertainment. Our home boasts a fully stocked kitchen, washer/dryer, and plenty of games. At night, relax in the living room as you watch a movie on our smart TV or surf our high-speed internet. As you exit toward the backyard, find a quiet oasis deck area, with seating options, and plenty of grassy space for you to enjoy. If you need anything we haven't thought of, please let us know and we may be able to provide it for you! Other things to note: • Guests have access to the entire home except the garage (please park in the driveway) • There is also a storage room in the entryway of the house that will be locked (no access to guests) • There are security cameras on the outside of the property for everyone's safety • No parties or large gatherings • If bringing pets, please beware that the fenced in gate has a space where smaller pets could escape Guest access Entry is keyless. The code will be provided before check in.", address: "22222 Cherie Court, Richton Park, IL 60471", cost_per_night: 120, host_id:2, number_of_bathrooms: 3, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 7, number_of_bedrooms: 0, name: "All bathrooms babey!", description: "You gotta pick a toilet to sleep by :)", address: "746 S Oak Park Ave, Oak Park, IL 60304", cost_per_night: 900, host_id: 3, number_of_bathrooms: 5, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 8, number_of_bedrooms: 1, name: "Single bed room with Asian decor in family home", description: "About this space Private home with bedroom (second floor) available with shared bath (second floor). See details for places to go, things to see, places to eat and drink locally as well as in the city! The space Private room with single bed for single person occupancy only. Guests are not allowed to bring other people to the room. No exceptions. Guest access This is a single bed room in a private family home. It is on the second level of the house with shared full bathroom on the second floor. Someone will be here to greet you on your arrival. Other things to note We are located 10 miles from downtown Chicago with easy access to I 290, both airports and public transportation. There are 4 restaurants within 1 block from the home as well as a grocery store, bakery, banks and cleaners. There are shopping malls,restaurants, and movie theaters within 1-2 miles (our town and the neighboring town). If arriving by car there is free street parking for the first 3 nights then $7 per night payable to the Village of Oak Park. This can be done through their app. Please visit the Oak Park web site for details. We do have some other free options for parking but are limited. Please contact me directly to discuss these options.", address: "746 S Oak Park Ave, Oak Park, IL 60304", cost_per_night: 33, host_id: 4, number_of_bathrooms: 1, created_at: 1.day.ago, updated_at: 1.day.ago},
      # { id:, number_of_bedrooms: , name:, description:, address: , cost_per_night:, host_id:, number_of_bathrooms:},, created_at: 1.day.ago, updated_at: 1.day.ago
    ]
    # Room.insert_all!(rooms)
    Room.create(rooms)
    puts "#{Room.count} rooms"

    Photo.destroy_all
    photos = [
      { id: 1, room_id: 1, url: Pathname.new(Rails.root.join("db/images/bedroom-1.jpg")).open, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 2, room_id: 1, url: Pathname.new(Rails.root.join("db/images/kitchen-1.jpg")).open, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 3, room_id: 1, url: Pathname.new(Rails.root.join("db/images/living-room-1.jpg")).open, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 4, room_id: 1, url: Pathname.new(Rails.root.join("db/images/bedroom-2.jpg")).open, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 5, room_id: 2, url: Pathname.new(Rails.root.join("db/images/living-room-2.jpg")).open},
      { id: 6, room_id: 2, url: Pathname.new(Rails.root.join("db/images/library-room-1.jpg")).open},
      { id: 7, room_id: 2, url: Pathname.new(Rails.root.join("db/images/living-room-3.jpg")).open},
      { id: 8, room_id: 2, url: Pathname.new(Rails.root.join("db/images/living-room-4.jpg")).open},
      { id: 9, room_id: 2, url: Pathname.new(Rails.root.join("db/images/dirty-room-1.jpg")).open},
      { id: 10, room_id: 7, remote_url_url: "http://static.demilked.com/wp-content/uploads/2019/09/5d89c5057d126-1-5d84970c91fc1__700.jpg"},
      { id: 11, room_id: 7, remote_url_url: "http://static.demilked.com/wp-content/uploads/2019/09/5d89c505a5868-toilets-with-threatening-auras-192-5d832083d5b88__700.jpg"},
      { id: 12, room_id: 7, remote_url_url: "http://static.demilked.com/wp-content/uploads/2019/09/5d89c50611dfe-toilets-with-threatening-auras-102-5d831fd041f17__700.jpg"},
      { id: 13, room_id: 7, remote_url_url: "http://static.demilked.com/wp-content/uploads/2019/09/5d89c5086ac18-toilets-with-threatening-auras-197-5d83208ec5e04__700.jpg"},
      { id: 14, room_id: 7, remote_url_url: "http://static.demilked.com/wp-content/uploads/2019/09/5d89c50917dc1-toilets-with-threatening-auras-405-5d83271ab50dd__700.jpg"},
      { id: 15, room_id: 3, url: Pathname.new(Rails.root.join("db/images/library-room-1.jpg")).open },
      { id: 16, room_id: 3, url: Pathname.new(Rails.root.join("db/images/library-room-1.jpg")).open },
      { id: 17, room_id: 3, url: Pathname.new(Rails.root.join("db/images/library-room-1.jpg")).open },
      { id: 18, room_id: 3, url: Pathname.new(Rails.root.join("db/images/library-room-1.jpg")).open },
      { id: 19, room_id: 3, url: Pathname.new(Rails.root.join("db/images/library-room-1.jpg")).open },
      { id: 20, room_id: 4, url: Pathname.new(Rails.root.join("db/images/living-room-3.jpg")).open },
      { id: 21, room_id: 4, url: Pathname.new(Rails.root.join("db/images/living-room-3.jpg")).open },
      { id: 22, room_id: 4, url: Pathname.new(Rails.root.join("db/images/dirty-room-1.jpg")).open },
      { id: 23, room_id: 5, url: Pathname.new(Rails.root.join("db/images/dirty-room-1.jpg")).open },
      { id: 24, room_id: 5, url: Pathname.new(Rails.root.join("db/images/living-room-2.jpg")).open },
      { id: 25, room_id: 5, url: Pathname.new(Rails.root.join("db/images/living-room-2.jpg")).open },
      { id: 26, room_id: 6, url: Pathname.new(Rails.root.join("db/images/living-room-2.jpg")).open },
      { id: 27, room_id: 6, url: Pathname.new(Rails.root.join("db/images/living-room-1.jpg")).open },
      { id: 28, room_id: 6, url: Pathname.new(Rails.root.join("db/images/living-room-1.jpg")).open },
      { id: 29, room_id: 8, url: Pathname.new(Rails.root.join("db/images/living-room-4.jpg")).open },
      { id: 30, room_id: 8, url: Pathname.new(Rails.root.join("db/images/living-room-4.jpg")).open },
      # { id: 20, room_id: 2, remote_url_url: ""},
      # { id: 1, room_id:, remote_url_url: },
      # { id: 1, room_id:, remote_url_url: },
    ]
    Photo.create(photos)
    puts "#{Photo.count} photos"


    UserRoom.destroy_all
    stays = [
      { id: 1, guest_id: 1, room_id: 1, check_in: Date.parse("Jan 3rd, 2022"), check_out: Date.parse("Jan 10th, 2022"), approved: true, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 2, guest_id: 2, room_id: 1, check_in: Date.parse("Jan 14th, 2022"), check_out: Date.parse("Jan 21st, 2022"), approved: true, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 3, guest_id: 5, room_id: 1, check_in: Date.parse("Feb 5th, 2022"), check_out: Date.parse("Feb 15th, 2022"), approved: true, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 4, guest_id: 4, room_id: 1, check_in: Date.parse("March 16th, 2022"), check_out: Date.parse("March 26th, 2022"), approved: false, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 5, guest_id: 7, room_id: 7, check_in: Date.parse("March 10th, 2021"), check_out: Date.parse("March 12th, 2021"), approved: true, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 6, guest_id: 3, room_id: 1, check_in: Date.parse("Feb 10th, 2021"), check_out: Date.parse("Feb 17th, 2021"), approved: true, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 7, guest_id: 3, room_id: 8, check_in: Date.parse("June 7th, 2021"), check_out: Date.parse("June 14th, 2021"), approved: true, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 8, guest_id: 3, room_id: 2, check_in: Date.parse("July 4th, 2021"), check_out: Date.parse("July 7th, 2021"), approved: true, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 9, guest_id: 3, room_id: 6, check_in: Date.parse("March 4th, 2022"), check_out: Date.parse("March 7th, 2022"), approved: true, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 10, guest_id: 2, room_id: 4, check_in: Date.parse("March 1st, 2022"), check_out: Date.parse("March 5th, 2022"), approved: true, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 11, guest_id: 1, room_id: 4, check_in: Date.parse("Feb 22nd, 2022"), check_out: Date.parse("Feb 28th, 2022"), approved: true, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 12, guest_id: 1, room_id: 5, check_in: Date.parse("March 12th, 2022"), check_out: Date.parse("March 17th, 2022"), approved: nil, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 13, guest_id: 7, room_id: 7, check_in: Date.parse("Jan 12th, 2022"), check_out: Date.parse("Jan 17th, 2022"), approved: true, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 14, guest_id: 8, room_id: 7, check_in: Date.parse("Jan 24th, 2022"), check_out: Date.parse("Jan 30th, 2022"), approved: true, created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 15, guest_id: 8, room_id: 8, check_in: Date.parse("Feb 24th, 2022"), check_out: Date.parse("Feb 28th, 2022"), approved: true, created_at: 1.day.ago, updated_at: 1.day.ago},
      # { id: , guest_id: , room_id: , check_in: , check_out: , approved: }
      # { id: , guest_id: , room_id: , check_in: , check_out: , approved: }
      # { id: , guest_id: , room_id: , check_in: , check_out: , approved: }
      # { id: , guest_id: , room_id: , check_in: , check_out: , approved: }
    ]
    UserRoom.insert_all!(stays)
    puts "#{UserRoom.count} stays"

    Interaction.destroy_all
    messages = [
      { id: 1, sender_id: 5, recipient_id: 2, room_id: 1, body: "Hi, could use some help :)",created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 2, sender_id: 4, recipient_id: 6, room_id: 4, body: "Real cool digs bruv.",created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 3, sender_id: 6, recipient_id: 4, room_id: 4, body: "Thanks!",created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 4, sender_id: 2, recipient_id: 5, room_id: 1, body: "Sure, what can I help you with?",created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 5, sender_id: 5, recipient_id: 2, room_id: 1, body: "The toilet is like... *super* clogged. I swear it was like that before. Do you have like a mega plunger somewhere?",created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 6, sender_id: 3, recipient_id: 2, room_id: 2, body: "Did I happen to leave a blue notebook? It has sticker on it.",created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 7, sender_id: 7, recipient_id: 3, room_id: 7, body: "I gotta say, the bnb did not disapoint!",created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 8, sender_id: 3, recipient_id: 7, room_id: 7, body: "Appreciate it :)",created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 9, sender_id: 8, recipient_id: 3, room_id: 7, body: "You really weren't kidding about sleeping by the the toilet. There was suprisingly good white noise.",created_at: 1.day.ago, updated_at: 1.day.ago},
      { id: 10, sender_id: 1, recipient_id: 4, room_id: 8, body: "Is there a place to do laundry?",created_at: 1.day.ago, updated_at: 1.day.ago},
      # { id: , sender_id:, recipient_id:, room_id: , body: ,created_at: 1.day.ago, updated_at: 1.day.ago},
    ]
    Interaction.insert_all!(messages)
    puts "#{Interaction.count} messages"
    
    Line.destroy_all
    likes = [
      { id: 1, user_id: 1, location_id: 1, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 2, user_id: 1, location_id: 3, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 3, user_id: 2, location_id: 5, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 4, user_id: 2, location_id: 7, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 5, user_id: 2, location_id: 1, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 6, user_id: 2, location_id: 2, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 7, user_id: 3, location_id: 5, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 8, user_id: 3, location_id: 1, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 9, user_id: 3, location_id: 7, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 10, user_id: 3, location_id: 4, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 11, user_id: 3, location_id: 6, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 12, user_id: 4, location_id: 2, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 13, user_id: 4, location_id: 4, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 14, user_id: 4, location_id: 7, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 15, user_id: 5, location_id: 1, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 16, user_id: 5, location_id: 2, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 17, user_id: 5, location_id: 4, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 18, user_id: 5, location_id: 6, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 19, user_id: 6, location_id: 1, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 20, user_id: 6, location_id: 7, created_at: 3.day.ago, updated_at: 2.day.ago},
      { id: 21, user_id: 7, location_id: 7, created_at: 3.day.ago, updated_at: 2.day.ago},
      # { id: , user_id: , location_id: , created_at: 3.day.ago, updated_at: 2.day.ago},
    ]
    Line.insert_all!(likes)
    puts "#{Line.count} likes"
  end
end
