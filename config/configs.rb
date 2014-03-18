module Configs

  # loading config.yml
  
  def self.load(config_path, env = "development")
    @config = YAML.load_file(config_path)[env.to_s]
    @config["environment"] = env
  end

  def self.[](key)    
    @config[key] || "Key '#{key}' is not defined in config.yml"
  end

  # require files 

  def self.folders(&block)
    obj = Requirable.new
    obj.instance_eval(&block)
    @requirable = obj
  end

  def self.require_all
    Dir.glob(@requirable.folders).each {|file| 
      puts file; 
      require file 
    }
  end

  class Requirable
    
    attr_reader :folders

    def initialize
      @folders = []
    end

    def f folder
      @folders << (full_path folder)
    end

    private

    def full_path folder
       "#{ENV['ROOT_PATH']}/#{folder}/*.rb"
    end

  end

end
