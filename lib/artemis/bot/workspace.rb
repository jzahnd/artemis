module Artemis
  module Bot
    class Workspace
      attr_reader :name, :language, :created, :updated, :description,
                  :workspace_id, :metadata, :learning_opt_out

      def initialize(attrs = {})
        @name = attrs['name']
        @language = attrs['language']
        @created = attrs['created']
        @updated = attrs['updated']
        @description = attrs['description']
        @workspace_id = attrs['workspace_id']
        @metadata = attrs['metadata']
        @learning_opt_out = attrs['learning_opt_out']
      end
    end
  end
end
