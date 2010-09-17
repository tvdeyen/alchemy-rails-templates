# This rails template installs Alchemy and all depending plugins and gems.
# Run it with +rails YOUR_APP_NAME -d mysql -m install_alchemy+.

# GEM Dependencies for Alchemy
gem 'acts_as_ferret', :version => '0.4.8'
gem 'authlogic', :version => '>=2.1.2'
gem 'awesome_nested_set', :version => '>=1.4.3'
gem 'declarative_authorization', :version => '>=0.4.1'
gem "fleximage", :version => ">=1.0.1"
gem 'fast_gettext', :version => '>=0.4.8'
gem 'gettext_i18n_rails', :version => '>=0.2.3'
gem 'gettext', :lib => false, :version => '>=1.9.3'
gem 'rmagick', :lib => "RMagick2", :version => '>=2.12.2'
gem 'tvdeyen-ferret', :version => '>=0.11.8.1', :lib => 'ferret'
gem 'will_paginate', :version => '>=2.3.12'
gem 'mimetype-fu', :version => '>=0.1.2', :lib => 'mimetype_fu'

rake 'gems:install'

# Installing a lot of plugins for Alchemy
plugin "acts_as_list", :git => "git://github.com/rails/acts_as_list.git"
plugin "alchemy", :git => "git://github.com/tvdeyen/alchemy.git"
plugin "attachment_fu", :git => "git://github.com/technoweenie/attachment_fu.git"
plugin "i18n_label", :git => "git://github.com/iain/i18n_label.git"
plugin "tinymce_hammer", :git => "git://github.com/trevorrowe/tinymce_hammer.git"
plugin "userstamp", :git => "git://github.com/delynn/userstamp.git"

# TODO: We need a generator for adding these two lines into the environment.rb file
#     config.load_paths += %W( #{RAILS_ROOT}/vendor/plugins/alchemy/app/sweepers )
#     config.load_paths += %W( #{RAILS_ROOT}/vendor/plugins/alchemy/app/middleware )
# When we have this generaotr, then we can migrate within this script
#rake "db:create"
#rake "db:migrate:alchemy"

run "rm public/index.html"
rake "alchemy:assets:copy:all"

readme = <<EOF
++++++++++++++++++ SUCCESS! Have a lot of fun with Alchemy! ++++++++++++++++++++++
+                                                                                +"
+ Next steps:                                                                    +"
+                                                                                +"
+ 1. Add these two lines into your environment.rb file:                          +"
+                                                                                +"
+ config.load_paths += %W( vendor/plugins/alchemy/app/sweepers )                 +"
+ config.load_paths += %W( vendor/plugins/alchemy/app/middleware )               +"
+                                                                                +"
+ 2. Then create your database and migrate the Alchemy tables:                   +"
+                                                                                +"
+ rake db:create                                                                 +"
+ rake db:migrate:alchemy                                                        +"
+                                                                                +"
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
EOF
puts readme
