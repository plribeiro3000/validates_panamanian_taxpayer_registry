# frozen_string_literal: true

require 'shoulda-matchers'

module Shoulda
  module Matchers
    module ActiveModel
      def require_a_valid_panamanian_taxpayer_registry(attr = :taxpayer_registry)
        RequireAValidPanamanianTaxpayerRegistryMatcher.new(attr)
      end

      class RequireAValidPanamanianTaxpayerRegistryMatcher < ValidationMatcher
        def description
          'requires a valid Panamanian Taxpayer Registry'
        end

        def failure_message
          'does not require a valid Panamanian Taxpayer Registry'
        end

        def matches?(subject)
          super(subject)

          allows_value_of('123456789-2-2015') &&
            allows_value_of('10101010-1-2001') &&
            allows_value_of('12312123-3-2040') &&
            disallows_value_of('90-234-1-23') &&
            disallows_value_of('10-0-123-123')
        end
      end
    end
  end
end
