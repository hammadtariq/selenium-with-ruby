require 'yaml'

module Config
  @settings = YAML::load_file('conf/dev.yml')

  def self.settings
    return @settings
  end

end

