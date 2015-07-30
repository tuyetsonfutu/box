namespace :products do
  desc "TODO"
  task :import => :environment do
    AmazonPaser.new.import_product
  end
end