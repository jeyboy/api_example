require './api/root'

use ActiveRecord::ConnectionAdapters::ConnectionManagement

dbconfig = YAML::load(File.open('./config/database.yml'))
ActiveRecord::Base.establish_connection(dbconfig['development'])

run API::Root
