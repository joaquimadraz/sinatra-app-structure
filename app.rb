module SampleApp

  class Web < ::Sinatra::Base

    UseCases = SampleApp::V0::UseCases

    helpers Helpers::CurrentUser
    helpers Helpers::DeclaredParams
    helpers ::Sinatra::JSON
    register ::Sinatra::Partial
    register ::Sinatra::ActiveRecordExtension

    set :environments, %w{development staging production}

    set :root, File.dirname(__FILE__)
    set :views, Proc.new { File.join(root, 'app/web/assets/views') }
    set :public_folder, Proc.new { File.join(root, 'public') }
    set :partial_template_engine, :erb

    enable :logging, :partial_underscores

    use Rack::Parser, :content_types => {
      'application/json' => Proc.new { |body| ::MultiJson.decode body },
      'application/json;charset=UTF-8' => Proc.new { |body| ::MultiJson.decode body }
    }

    error Compel::InvalidObjectError do |exception|
      status 400
      json exception.object
    end

    configure :development do
      set :show_exceptions, false
      set :raise_errors, true

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

end
