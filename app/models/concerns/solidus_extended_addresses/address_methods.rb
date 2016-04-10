module SolidusExtendedAddresses
  module AddressMethods
    extend ActiveSupport::Concern

    def full_name
      "#{title} #{super}".strip
    end
  end
end
