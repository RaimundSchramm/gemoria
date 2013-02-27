# successfully run once
namespace :production do
  # desc 'updates status of existing userstories in production'
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


  # desc 'updates category of existing userstories in production'
  # task :update_userstories => :environment do
  #   %w(Bug Chore Feature Feature).each do |type|
  #     Category.create(name: type) unless Category.all.map(&:name).include? type
  #   end

  #   Userstory.all.each do |userstory|
  #     userstory.category_id = Category.first.id
  #     userstory.save
  #   end
  # end

  desc 'updates position of existing userstories in production'
  task :userstories => :environment do
    Userstory.all.each do |userstory|
      userstory.position = Userstory::POSITION[:sprint]
      userstory.save
    end
  end

  desc 'updates projects in production with a current sprint'
  task :projects => :environment do
    Project.all.each { |project| project.sprints.create complete: false }
  end

  desc 'updates userstories in production to belong to the one and only current sprint'
  task :sprint_userstories => :environment do
    Userstory.all.each do |userstory|
      userstory.sprint_id = userstory.project.sprints.first.id
      userstory.save
    end
  end
end
