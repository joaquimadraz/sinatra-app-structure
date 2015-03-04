class SampleApp < Sinatra::Base

  before '/:color/world' do
    redirect('/', 301) if !authenticated?
  end

  get '/' do
    @title = 'Yellow World'
    erb :home
  end

  get '/:color/world' do
    @title = "#{params[:color].capitalize} World"
    erb :home
  end

  get '/send_mail' do
    Mailbox.sample_email.deliver
  end

  get '/random_user.json' do
    json error: 'false', message: User.random_name
  end

end
