module SolidusExtendedAddresses
  module AddressMethods
    extend ActiveSupport::Concern

    def full_name
      "#{title} #{firstname} #{lastname}".strip
    end
  end
end
