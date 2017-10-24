module Filterable
  extend ActiveSupport::Concern
  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil)
      keys = { place_of_departure: 'place_of_dep', place_of_arrive: 'place_of_arr', date_of_departure: 'date_of_dep' }
      filtering_params.each do |key, value|
        results = results.public_send(keys[key.to_sym], value) if value.present?
      end
      results
    end
  end
end