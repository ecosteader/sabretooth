# Load the Rails application.
#require_relative 'application'

require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActiveRecord::SchemaDumper.ignore_tables = ['deprecated_preview_cards']

#config.active_record.cache_versioning = false
