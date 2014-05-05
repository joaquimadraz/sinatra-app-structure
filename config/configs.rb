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

    self
  end

  def self.require_all
    @requirable.folders.each do |folder|
      sorted_files = []

      Dir.glob(folder).reduce(sorted_files){|sorted_files, path| 
        path.end_with?('_init.rb') ? sorted_files.unshift(path) : sorted_files << path 
      }
      
      sorted_files.each{|file| require file }
    end

    @requirable.clean_required_folders
  end

  class Requirable
    
    attr_reader :folders

    def initialize
      @folders = []
    end

    def f folder
      @folders << (full_path folder)
    end

    def rf folder
      @tmp_folders = []

      append_recursive_folder folder
            
      @tmp_folders.each do |inner_folder|
        @folders << (full_path inner_folder)
      end
    end

    # clean required folders, 
    # so in the next requires, there are only
    # not required folders to require.
    def clean_required_folders
      @folders = []
    end

    private

    def full_path folder
      "#{ENV['ROOT_PATH']}/#{folder}/*.rb"
    end

    def append_recursive_folder folder    
      @tmp_folders << folder

      Dir.entries(folder).each do |entry|
        full_path = "#{folder}/#{entry}"
        
        if valid_folder? full_path
          append_recursive_folder full_path
        end
      end
    end

    def valid_folder? folder
      File.directory?("#{folder}") && !folder.end_with?('.') && !folder.end_with?('..')
    end

  end

end
