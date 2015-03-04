module Configs

  def self.load(config_path, env = "development")
    @config = YAML.load_file(config_path)[env.to_s]
    @config["environment"] = env
  end

  def self.[](key)
    @config[key] || "Key '#{key}' is not defined in config.yml"
  end

end
