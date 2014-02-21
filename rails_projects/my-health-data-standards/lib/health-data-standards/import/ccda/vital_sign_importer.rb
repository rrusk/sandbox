module HealthDataStandards
  module Import
    module CCDA
      class VitalSignImporter < C32::VitalSignImporter
        def initialize
          super
          @entry_xpath = "//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.27']"
        end
      end
    end
  end
end