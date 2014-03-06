# establish db connection
ActiveRecord::Base.establish_connection(YAML::load_file('./config/database.yml')[ENV["RACK_ENV"]])