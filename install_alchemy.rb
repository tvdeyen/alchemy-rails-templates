# This rails template installs Alchemy and all depending plugins and gems.
# Run it with +rails YOUR_APP_NAME -d mysql -m install_alchemy+.

# GEM Dependencies for Alchemy
gem 'acts_as_ferret', :version => '>=0.4.8'
gem 'authlogic', :version => '>=2.1.2'
gem 'awesome_nested_set', :version => '>=1.4.3'
gem 'declarative_authorization', :version => '>=0.4.1'
gem "fleximage", :version => ">=1.0.1"
gem 'grosser-fast_gettext', :version => '>=0.4.8', :lib => 'fast_gettext'
gem 'gettext', :lib => false, :version => '>=1.9.3'
gem 'mime-types', :lib => "mime/types", :version => '>=1.16'
gem 'rmagick', :lib => "RMagick2", :version => '>=2.12.2'
gem 'tvdeyen-ferret', :version => '>=0.11.8.1', :lib => 'ferret'
gem 'will_paginate', :version => '>=2.3.12'

rake 'gems:install'

# Installing a lot of plugins for Alchemy
plugin "acts_as_list", :git => "git://github.com/rails/acts_as_list.git"
plugin "alchemy", :git => "git://github.com/tvdeyen/alchemy.git"
plugin "asset_packager", :git => "git://github.com/sbecker/asset_packager.git"
plugin "attachment_fu", :git => "git://github.com/technoweenie/attachment_fu.git"
plugin "engines", :git => "git://github.com/lazyatom/engines.git"
plugin "i18n_label", :git => "git://github.com/iain/i18n_label.git"
plugin "tinymce_hammer", :git => "git://github.com/trevorrowe/tinymce_hammer.git"
plugin "userstamp", :git => "git://github.com/delynn/userstamp.git"

rake "db:create"
generate :plugin_migration
rake "db:migrate"

run "rm public/index.html"

if yes?('Use a git repository?')
  git :init
  file ".gitignore", <<-END
  .DS_Store
  log/*.log
  tmp/**/*
  config/database.yml
  index/*
  uploads/*
  END
  run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
  git :add => ".", :commit => "-m 'initial commit'"
end

puts "++++++++ SUCCESS! Have a lot of fun with Alchemy! +++++++++"
