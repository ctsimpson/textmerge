require 'spec_helper'

describe Textmerge::Merge do
  merge = ''

  before(:each) do
    options = {:template => "template.txt",:input=>"in.txt", :output=> "out.txt"}
    merge = Textmerge::Merge.new(options)
  end

  let(:data) { "{1:First question} This is some text to ignore
                this would be some additional text, and then {2:Second question}
                and we have some more text before ending {3:Third question}" }

  let(:result) {{1=>"First question",2=>"Second question",3=>"Third question"}}

  let(:answers) {{1=>"Answer 1", 2=>"answer 2",3=>"answer 3"}}

  let(:output) { "Answer 1 This is some text to ignore
                this would be some additional text, and then answer 2
                and we have some more text before ending answer 3" }

  context "when reading from input" do
    it "should read from an input file and output a hash of responses" do
      test_file_path = File.join(File.dirname(__FILE__), "test_input.txt")
      expect(merge.get_responses_from_input_file(test_file_path)).to eq(answers)
    end

    it "should read a file and return an array of questions" do
      merge.get_requests(data).should eq(result)
      expect(merge.get_requests(data)[2]).to eq("Second question")
    end
  end

  context "when handling input" do
    it "should build responses from our hash of questions" do
      Textmerge::Merge.any_instance.stub(:ask_basic_question).and_return("Answer 1")
      merge.get_responses({1=>"Question 1"}).should eq({1=>"Answer 1"})
    end

    it "should merge the responses into our content" do
      merge.merge_responses(answers,data).should eq(output)
    end
  end
end

