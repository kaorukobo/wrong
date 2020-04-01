if defined? IRB
  module IRB
    class Context
      alias :original_evaluate :evaluate
      attr_reader :all_lines

      def evaluate(line, line_no, *rest_args)
        (@all_lines ||= "") <<line
        original_evaluate line, line_no, *rest_args
      end
    end
  end

  # include it in the top level too, since if you're using Wrong inside IRB that's probably what you want
  include Wrong
end
