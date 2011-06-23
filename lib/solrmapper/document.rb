require 'active_support/concern'
require 'active_model/attribute_methods'

module SolrMapper
  class Document
    include ActiveModel::AttributeMethods
    
    # Initialize the document with a hash of attributes. The keys are used as Solr field names,
    # and it is up to the user to use correct field names for their schema.
    def initialize(attrs={})
      @attributes = {}
      attrs.each do |attribute_name, val|
        @attributes[attribute_name.to_sym] = val
      end
    end
    
    # Dynamically define attribute getters if they are present in the attributes hash.
    def method_missing(method_name, *args, &block)
      if @attributes.keys.include?(method_name)
        (class << self; self; end).class_eval do
          define_method method_name do |*arg|
            @attributes[method_name]
          end
        end
        send(method_name, *args, &block)
      else
        super
      end
    end
    
  end
end