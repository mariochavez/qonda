require_plugin 'tog_core'
require_plugin 'fckeditor'

Tog::Plugins.settings :tog_headlines, "moderated_stories" => "true"
Tog::Plugins.settings :tog_headlines, 'pagination_size'   => "10"

require "i18n" unless defined?(I18n)
Dir[File.dirname(__FILE__) + '/locale/**/*.yml'].each do |file|
  I18n.load_path << file
end

Tog::Plugins.helpers Headlines::StoriesHelper

Tog::Interface.sections(:site).add "News", "/headlines/stories"     
manage = Tog::Interface.sections(:admin).add "News", "/admin/headlines/stories"
manage.add_item "Published", "/admin/headlines/stories/published"
manage.add_item "Drafts", "/admin/headlines/stories/draft"
manage.add_item "Archived", "/admin/headlines/stories/archived"

Tog::Search.sources << "Story"
