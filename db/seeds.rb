require 'csv'

class Seed

  def initialize
    generate_industries
    generate_categories
    generate_services
    generate_users
    generate_pros
    generate_projects
    generate_bids
    generate_messages
    generate_reviews
  end

  def generate_users
    5000.times do |n|
      user = User.create(first_name: "Burt#{n}", last_name: "Reynolds", zipcode: "80203", phone_number: "5555554", email: "turdferguson#{n}@gmail.com", password: "password")
      puts "Created #{user.first_name}"
    end
  end

  def generate_pros
    @zipps = [80012, 80014, 80110, 80111, 80123, 80202, 80203, 80204, 80205, 80206, 80207, 80209, 80210, 80211, 80212, 80214, 80216, 80218, 80219, 80220, 80221, 80222, 80223, 80224, 80226, 80227, 80230, 80231, 80232, 80235, 80236, 80237, 80238, 80239, 80246, 80247, 80249, 80264, 80290, 80293, 80294]
    600.times do |n|
      pro = Pro.create(first_name: "Bob#{n}", last_name: "Ross", zipcode: @zipps.sample, phone_number: "5555555", email: "b#{n}@gmail.com", password: "password")
      pro.create_pro_service(service_ids: [rand(230..256)], radius: rand(1..10))
      puts "Created #{pro.first_name}"
    end
  end

  def generate_projects
    40000.times do |n|
      project = Project.create(status: [:open, :accepted, :invoiced, :completed].sample, zipcode: @zipps.sample, recurring: [true, false].sample, description: "i am #{n} years old", timeline: ['ASAP', 'Within 2 Weeks', 'Within 2 Months', 'Whenever'].sample, requester_id: User.all.sample.id, service_id: rand(230..256))
      puts "#{project.requester_id}"
    end
  end

  def generate_bids
    120000.times do |n|
      bid = Bid.create(user_id: Pro.all.sample.id, project_id: Project.all.sample.id, amount: rand(30..300).to_s, comment: "I THINK THIS NEEDS TO BE A MESSAGE_ID")
      puts "#{bid.amount}"
    end
  end

  def generate_messages
    200.times do |n|
      Message.create!(content: Faker::ChuckNorris.fact, user_id: User.all.sample.id, bid_id: Bid.all.sample.id)
      puts "created #{n} messages"
    end
  end

  def generate_reviews
    200.times do |n|
      Review.create!(rating: rand(1..5), body: Faker::ChuckNorris.fact, user_id: User.all.sample.id, pro_id: Pro.all.sample.id, service_id: Service.all.sample.id)
      puts "created #{n} reviews"
    end
  end

  def generate_industries
    industries.each do |industry|
      new_industry = Industry.create!(name: industry[:name])

      puts "Created #{new_industry.name}"
    end
  end

  def generate_categories
    categories.each do |category|
      new_category = Category.create!(name: category[:name],
                                      industry: Industry.find_by(name: category[:industry_name]))

    puts "Created #{new_category.name}"
    end
  end

  def generate_services
    services.each do |service|
      new_service = Service.create!(name: service[:name],
                      category: Category.find_by(name: service[:category_name]))

      puts "Created #{new_service.name}"
    end
  end

  def industries
    CSV.open'db/csv/industries_services_categories/industries-Table 1.csv', headers: true, header_converters: :symbol
  end

  def categories
    CSV.open'db/csv/industries_services_categories/categories-Table 1.csv', headers: true, header_converters: :symbol
  end

  def services
    CSV.open'db/csv/industries_services_categories/services-Table 1.csv', headers: true, header_converters: :symbol
  end
end

Seed.new
