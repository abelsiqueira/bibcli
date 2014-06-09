module Bibcli
  class Command

    class << self
      attr_reader :subclasses

      def subclasses
        @subclasses ||= []
      end

      def inherited(base)
        subclasses << base
        super(base)
      end
    end
  end
end
