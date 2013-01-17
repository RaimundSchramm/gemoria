namespace :production do
  desc 'updates status of existing userstories in production'
  # task :update_userstories => :environment do
  #   Userstory.where("status IS NULL").each do |userstory|
  #     userstory.status = 'opened'
  #     userstory.save
  #   end
  # end
  # successfully run once

  task :update_userstories => :environment do
    Userstory.where("status = 'recent'").each do |userstory|
      userstory.status = 'opened'
      userstory.save
    end
  end
end
