require 'faker'

User.delete_all
Channel.delete_all
Subscription.delete_all

users = 100.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

channels = ["Telemundo", "Unimas ", "Azteca 13", "Mexiquense",
 "ESPN", "Fox Sports", "NBC Sports", "Big Ten Network", "Nickelodeon"].map do |name|
  Channel.create!(:name            => name,
                  :callsign        => name[0..2].upcase,
                  :price_per_month => Faker::Commerce.price)
end

users.each do |user|
  user_channels = channels.sample(rand(2..4))
  user_channels.each do |channel|
    Subscription.create!(user: user,
                         channel: channel)
  end
end


# puts "Seeding the database ..."
#
#
# def seed_channel_table
#   puts "Seeding the channel table..."
#   total_seeds_required = 50
#   current_seeds_in_db = Channel.count
#   seeds_to_create = total_seeds_required - current_seeds_in_db
#
#   # ["name", "callsign", "price_per_month:decimal"]
#   seeds_to_create.times do
#     # channel_hash = {
#     #   name: Faker::Lorem.word,
#     #   description: Faker::Lorem.sentence,
#     #   status: Faker::Lorem.word,
#     #   rating: 5
#     # }
#     new_channel_record = Channel.new(channel_hash)
#     new_channel_record.save!
#   end
#
# end
# seed_channel_table
#
#
# def seed_subscription_table
#   puts "Seeding the subscription table..."
#   total_seeds_required = 50
#   current_seeds_in_db = Subscription.count
#   seeds_to_create = total_seeds_required - current_seeds_in_db
#
#   # ["user_id:integer", "channel_id:integer"]
#   seeds_to_create.times do
#     # subscription_hash = {
#     #   name: Faker::Lorem.word,
#     #   description: Faker::Lorem.sentence,
#     #   status: Faker::Lorem.word,
#     #   rating: 5
#     # }
#     new_subscription_record = Subscription.new(subscription_hash)
#     new_subscription_record.save!
#   end
#
# end
# seed_subscription_table
#
#
