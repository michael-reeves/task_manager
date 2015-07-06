require 'bundler'
Bundler.require   # requires all the gems in Gemfile

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/app"))

require 'controllers/task_manager_app'

run TaskManagerApp