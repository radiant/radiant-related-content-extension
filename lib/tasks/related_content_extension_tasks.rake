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
    
    end
  end
end