class SampleApp < Sinatra::Base

  get '/users' do
    @users = 5.times.map{|i| User.random_name }
    erb :users
  end

end