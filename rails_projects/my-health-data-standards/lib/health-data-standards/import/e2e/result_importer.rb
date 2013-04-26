module HealthDataStandards
  module Import
    module E2E
      class ResultImporter < SectionImporter

          # class Entry
          # field :description, type: String
          # field :specifics, type: String
          # field :time, type: Integer
          # field :start_time, type: Integer
          # field :end_time, type: Integer
          # field :status, type: String
          # field :codes, type: Hash, default: {}
          # field :value, type: Hash, default: {}
          # field :free_text, type: String
          # field :mood_code, type: String, default: "EVN"
          #
          # class LabResult < Entry
          # field :referenceRange, type: String
          # field :interpretation, type: Hash

          def initialize
          @entry_xpath = "//cda:section[cda:templateId/@root='2.16.840.1.113883.3.1818.10.2.16.1' and cda:code/@code='11502-2']/cda:entry/cda:observation"
          @code_xpath = "./cda:code"
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value] "
          @check_for_usable = true               # Pilot tools will set this to false
        end
    
        # Traverses the E2E document passed in using XPath and creates an Array of Entry
        # objects based on what it finds                          
        # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
        #        will have the "cda" namespace registered to "urn:hl7-org:v3"
        #        measure definition
        # @return [Array] will be a list of Entry objects
        def create_entries(doc,id_map = {})
          result_list = []
          entry_elements = doc.xpath(@entry_xpath)
          entry_elements.each do |entry_element|
            result = create_entry(entry_element, id_map)
            if @check_for_usable
              result_list << result if result.usable?
            else
              result_list << result
            end
          end
          result_list
        end
        
        def create_entry(entry_element, id_map={})
          result = LabResult.new
          extract_codes(entry_element, result)
          extract_dates(entry_element, result)
          extract_value(entry_element, result)
          extract_description(entry_element, result, id_map)
          extract_interpretation(entry_element, result)
          result
        end
    
        private
        def extract_interpretation(parent_element, result)
          interpretation_element = parent_element.at_xpath("./cda:interpretationCode")
          if interpretation_element
            code = interpretation_element['code']
            code_system = CodeSystemHelper.code_system_for(interpretation_element['codeSystem'])
            result.interpretation = {'code' => code, 'codeSystem' => code_system}
          end
        end
    
      end
    end
  end
end