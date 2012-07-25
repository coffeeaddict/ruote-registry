require 'ruote'

module Ruote
  class << self
    # Override the default Ruote.define and store the created pdef in a 
    # registry which can be read through Ruote.definition
    #
    def define(*attributes, &block)

      pdef = RubyDsl.create_branch('define', attributes, &block) 
      
      if (name = pdef[1]['name'])
        @pdef_registry ||= {}
        @pdef_registry[name.to_sym] = pdef
      end
      
      return pdef
    end

    # Return a stored pdef
    #
    # @param [String,Symbol] name The :name of the definition
    #
    def definition(name)
      @pdef_registry[name.to_sym]
    end
  end
end