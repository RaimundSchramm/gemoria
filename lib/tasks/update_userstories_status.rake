namespace :production do
  desc 'updates status of existing userstories in production'
  # task :update_userstories => :environment do
  #   Userstory.where("status IS NULL").each do |userstory|
  #     userstory.status = 'opened'
  #     userstory.save
  #   end
  # end
  # successfully run once

  # task :update_userstories => :environment do
  #   Userstory.where("status = 'recent'").each do |userstory|
  #     userstory.status = 'opened'
  #     userstory.save
  #   end
  # end
  # successfully run once

  task :update_userstories => :environment do
    %w(Bug Chore Feature Feature).each do |type|
      Category.create(name: type) unless Category.all.map(&:name).include? type
    end

    Userstory.all.each do |userstory|
      userstory.category_id = Category.first.id
      userstory.save
    end
  end
  # successfully run once
end
