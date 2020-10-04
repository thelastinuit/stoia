module Graphql
  module TestHelpers
    attr_accessor :graphql_response

    # The returned results of a GraphQL query
    # @return [data] this is the bulk of the return to test.
    # @return [error] any time a query, mutation, subscription throws and error
    class GraphqlResponse
      attr_reader :data, :errors

      def initialize(args)
        @data = args['data'] || nil
        @errors = args['errors'] || nil
      end
    end

    # Query to interact with the GraphQL API.
    # @param [query] required The query string that would be passed to the schema.
    def query(query, variables: {}, context: {})
      converted = variables.deep_transform_keys! {|key| key.to_s.camelize(:lower)} || {}
      response = StoiaSchema.execute(query, variables: converted, context: context, operation_name: nil)
      @graphql_response = GraphqlResponse.new(response.to_h)
    end

    alias_method :mutation, :query
  end
end
