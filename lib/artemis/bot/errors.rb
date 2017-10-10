module Artemis
  module Bot
    class ArtemisError < StandardError
      attr_reader :code

      def initialize(code, msg)
        @code = code
        super(msg)
      end
    end
  end
end

module Artemis
  module Bot
    class ServerError < Artemis::Bot::ArtemisError
    end
  end
end

module Artemis
  module Bot
    class ClientError < Artemis::Bot::ArtemisError
    end
  end
end
