require 'highline/import'

module Textmerge
  class Merge

    def initialize(options)
      @template_file = options[:template]
      @input_file = options[:input]
      @output_file = options[:output]
    end

    def read_template
      file = File.open(@template_file, "rb")
      file.read
    end

    def get_responses_from_input_file(data_file = @input_file)
      collection = []
      File.open(data_file, 'r') do |file|
        collection = file.map { |line| line.chomp.split(':') }
      end
      collection.sort
      array_to_hash(collection)
    end

    def get_requests(data)
      regex = /\{(\d)\:(.*?)\}/
      collection = data.scan(regex)
      collection.sort
      array_to_hash(collection)
    end

    def get_responses(requests)
      requests.each do |k,v|
        requests[k] = ask_basic_question(v)
      end
      requests
    end

    def merge_responses(responses,data)
      responses.each do |k,v|
        data.gsub!(/\{#{k}.*?\}/,v)
      end
      data
    end

    def write_file(contents)
      File.open(@output_file, 'w') {|f| f.write(contents)}
    end

    protected

    def ask_basic_question(question)
      ask("#{question} ?")
    end

    def array_to_hash(array)
      array.inject({}) {|m,e| m[e[0].to_i] = e[1]; m}
    end

  end
end
