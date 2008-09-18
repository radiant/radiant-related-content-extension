namespace :radiant do
  namespace :extensions do
    namespace :related_content do
      
      desc "Runs the migration of the Related Content extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          RelatedContentExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          RelatedContentExtension.migrator.migrate
        end
      end

      desc "Copies the assets of the Related Content extension"
      task :update => :environment do
        FileUtils.cp RelatedContentExtension.root + "/public/javascripts/lowpro.js", RAILS_ROOT + "/public/javascripts/"
      end    
    end
  end
end