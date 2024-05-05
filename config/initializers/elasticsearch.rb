# config/initializers/elasticsearch.rb

config = {
  transport_options: { request: { timeout: 5 } }
}
if File.exist?('config/elasticsearch.yml')
  template = ERB.new(File.new('config/elasticsearch.yml').read)
  processed = YAML.safe_load(template.result(binding))
  config.merge!(processed[Rails.env].symbolize_keys)
end
