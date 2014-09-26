class ApiKey
  attr_reader :key, :api_keys

  def self.key_for_role(desired_role)
    key, _ = self.load_api_keys.detect { |key,role| desired_role == role }
    raise "No API key found for #{desired_role}" unless key
    key
  end

  def self.api_keys_file_path
    Rails.root.join('config/api_keys.yml')
  end

  def self.load_api_keys
    YAML.load_file(api_keys_file_path)
  end

  def initialize(key)
    @key = key
    @api_keys = self.class.load_api_keys
  end

  def role
    api_keys[key]
  end

  def valid?
    role.present?
  end
end