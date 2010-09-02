load_template 'install_alchemy'
gem 'acts_as_taggable_on_steroids'
gem 'vpim'
plugin 'alchemy-mailings', :git => 'git://github.com/tvdeyen/alchemy-mailings.git'
plugin 'auto_complete', :git => 'git://github.com/rails/auto_complete.git'

rake 'db:migrate:alchemy-mailings'
