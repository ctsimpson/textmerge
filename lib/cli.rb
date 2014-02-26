require 'thor'
require 'thor/runner'

module Textmerge
  module CLI
    class Main < Thor

      desc 'version', 'Version of the Merge utility'
      def version
        require 'Textmerge/version'
        say Textmerge::VERSION
      end

      desc 'merge', 'Merge input with your custom template'
      method_option :template, aliases: '-t', type: 'string', default: '', :required => true, desc: 'path to your template file'
      method_option :input, aliases: '-i', type: 'string', default: '', desc: 'path to your input file that feeds the template'
      method_option :output, aliases: '-o', type: 'string', default: '', desc: 'path to your output file'
      def merge
        begin
          raise ArgumentError, "Missing template" unless !options[:template].empty?
          template = ""
          requests,answers = []
          merge = Textmerge::Merge.new(options)
          template = merge.read_template
          if options[:input] && File.exists?(options[:input])
            puts "Building from input file"
            answers = merge.get_responses_from_input_file
          else
            requests = merge.get_requests(template)
            answers = merge.get_responses(requests)
          end
          output = merge.merge_responses(answers,template)
          if !options[:output].empty?
            merge.write_file(output)
          else
            puts output
          end
        rescue Exception => e
          say e.message, :red
        end
      end
    end
  end
end
