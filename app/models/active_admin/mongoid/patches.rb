require 'ostruct'

module ActiveAdmin
  module Mongoid
    COLUMN_TYPES = { Bignum => :integer, Array => :string }

    module Patches
      def self.included(base)
        raise 'Include ActiveAdmin::Mongoid::Patches after Mongoid::Document' unless base.respond_to?(:collection_name)
        base.extend ClassPatches
      end

      def column_for_attribute(attr)
        self.class.columns.detect { |c| c.name == attr.to_s }
      end

      module ClassPatches
        HIDDEN_COLUMNS = %w(_id _type)

        def content_columns
          fields.map do |name, field|
            next if HIDDEN_COLUMNS.include?(name)
            OpenStruct.new.tap do |c|
              c.name = field.name
              c.type = ActiveAdmin::Mongoid::COLUMN_TYPES[field.type] || field.type.to_s.downcase.to_sym
            end
          end.compact
        end

        def columns
          content_columns
        end
      end
    end
  end
end
