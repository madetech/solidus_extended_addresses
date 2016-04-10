module SolidusExtendedAddresses
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'solidus_extended_addresses'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'solidus_extended_addresses.permitted_attributes', after: :load_config_initializers do
      Spree::PermittedAttributes.address_attributes << :title
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Spree::Address.prepend(SolidusExtendedAddresses::AddressMethods)
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
