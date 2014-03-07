class SampleApp < Sinatra::Base

  helpers  Sinatra::JSON
  register Sinatra::Partial
  register Sinatra::SessionAuth
  register Sinatra::ActiveRecordExtension

  set :environments, %w{development staging production}

  set :root,                    File.dirname(__FILE__)
  set :views,                   Proc.new { File.join(root, "app/views") }
  set :public_folder,           Proc.new { File.join(root, "public") }
  set :session_secret,          "sample_app_secret_token"
  set :partial_template_engine, :erb

  enable :logging, :sessions, :partial_underscores

  configure :development do
    enable :dump_errors, :raise_errors
    use ::BetterErrors::Middleware
  end

  configure :staging, :production do
    set :raise_errors, true
    set :show_exceptions, false
    set :dump_errors, false

    file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
    file.sync = true
    use Rack::CommonLogger, file
  end

end
