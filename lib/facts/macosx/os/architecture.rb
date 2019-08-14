# frozen_string_literal: true

module Facter
  module Macosx
    class OsArchitecture
      FACT_NAME = 'os.architecture'
      @aliases = []

      def initialize(*args)
        @args = args
        puts 'Dispatching to resolve: ' + args.inspect
      end

      def call_the_resolver!
        fact_value = UnameResolver.resolve(:architecture)
        Fact.new(FACT_NAME, fact_value)
      end
    end
  end
end
